<?php

namespace App\Http\Controllers;

use App\Models\Acara;
use App\Models\Kategori;
use App\Models\Tiket;

class DashboardController extends Controller
{
    public function admin()
    {
        if (!in_array(session('user.nama_role'), ['ADMIN_BG', 'ADMIN_SYSTEM'])) {
            return redirect()->route('login')->with('error', 'Halaman ini khusus admin.');
        }
        return view('pages.dashboard.admin', [
            'stats' => $this->stats(),
            'events' => Acara::with(['kategori', 'tickets'])->orderByDesc('id')->get(),
        ]);
    }

    public function organizer()
    {
        if (!in_array(session('user.nama_role'), ['PENYELENGGARA', 'ADMIN_BG'])) {
            return redirect()->route('login')->with('error', 'Halaman ini khusus penyelenggara.');
        }
        return view('pages.dashboard.organizer', [
            'stats' => $this->stats(),
            'events' => Acara::with(['kategori', 'tickets'])->orderByDesc('id')->get(),
        ]);
    }

    /** Statistik dihitung langsung dari tabel hasil seeder */
    private function stats(): array
    {
        $total = Acara::count();
        $tayang = Acara::where('status_event', 'PUBLISHED')->count();

        return [
            ['label' => 'Total Acara', 'nilai' => (string) $total, 'sub' => $tayang . ' tayang, ' . ($total - $tayang) . ' belum tayang'],
            ['label' => 'Jenis Tiket', 'nilai' => (string) Tiket::count(), 'sub' => 'semua acara'],
            ['label' => 'Kapasitas', 'nilai' => number_format(Acara::sum('max_peserta'), 0, ',', '.'), 'sub' => 'total peserta'],
            ['label' => 'Kategori', 'nilai' => (string) Kategori::count(), 'sub' => 'kategori acara'],
        ];
    }
}
