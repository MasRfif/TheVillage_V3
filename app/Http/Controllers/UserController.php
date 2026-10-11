<?php

namespace App\Http\Controllers;

use App\Data\VillageData;
use App\Models\Tiket;
use Illuminate\Http\Request;

class UserController extends Controller
{
    private function perluLogin()
    {
        return redirect()->route('login')->with('error', 'Login dulu untuk melanjutkan.');
    }

    public function profile(Request $request)
    {
        if (!session('user')) return $this->perluLogin();

        return view('pages.user.profile', [
            'tab' => $request->query('tab', 'tickets'),
            'tickets' => VillageData::myTickets(),
            'transactions' => array_merge(session('transactions', []), VillageData::transactions()),
        ]);
    }

    public function checkout(Request $request, int $ticketId)
    {
        if (!session('user')) return $this->perluLogin();

        $ticket = Tiket::with('acara')->find($ticketId);
        abort_if(!$ticket, 404);

        return view('pages.user.checkout', [
            'event' => $ticket->acara,
            'ticket' => $ticket,
            'qty' => max(1, min((int) $request->query('qty', 1), $ticket->qty)),
            'methods' => VillageData::paymentMethods(),
            'user' => session('user'),
        ]);
    }

    public function checkoutStore(Request $request, int $ticketId)
    {
        if (!session('user')) return $this->perluLogin();

        $ticket = Tiket::with('acara')->find($ticketId);
        abort_if(!$ticket, 404);

        $data = $request->validate([
            'nama_pendaftar' => 'required',
            'email' => 'required|email',
            'no_hp' => 'required',
            'catatan' => 'nullable',
            'qty' => 'required|integer|min:1|max:' . $ticket->qty,
            'id_payment_method' => 'required|integer',
        ], [
            'qty.max' => 'Jumlah melebihi sisa tiket (' . $ticket->qty . ').',
        ]);

        $semua = session('transactions', []);
        $id = 100 + count($semua) + 1;
        $total = $ticket->harga * $data['qty'];

        array_unshift($semua, [
            'id' => $id, 'tanggal' => now()->toDateTimeString(),
            'status' => $total == 0 ? 'GRATIS' : 'PENDING', 'total' => $total,
            'nama_event' => $ticket->acara->nama_event, 'nama_tiket' => $ticket->nama_tiket,
            'jumlah' => (int) $data['qty'], 'metode' => (int) $data['id_payment_method'],
            'kode' => 'PAY-' . str_pad($id, 4, '0', STR_PAD_LEFT),
            'pendaftar' => $data,
        ]);
        session(['transactions' => $semua]);

        return redirect()->route('invoice.show', $id)->with('success', 'Pendaftaran tersimpan, lanjut ke invoice');
    }

    public function invoice(int $id)
    {
        if (!session('user')) return $this->perluLogin();

        $semua = array_merge(session('transactions', []), VillageData::transactions());
        $trx = collect($semua)->firstWhere('id', $id);
        abort_if(!$trx, 404);

        return view('pages.user.invoice', [
            'trx' => $trx,
            'metode' => VillageData::paymentMethod($trx['metode']),
            'pendaftar' => $trx['pendaftar'] ?? [
                'nama_pendaftar' => trim(session('user.nama_awal') . ' ' . session('user.nama_akhir')),
                'email' => session('user.email'), 'no_hp' => '-',
            ],
        ]);
    }
}
