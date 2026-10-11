<?php

namespace App\Http\Controllers;

use App\Data\VillageData;
use App\Models\Acara;
use App\Models\Kategori;
use App\Models\Testimoni;
use Illuminate\Http\Request;

class PageController extends Controller
{
    public function splash()
    {
        $stats = [['100+', 'Event'], ['50+', 'Desa'], ['10K+', 'Pengguna']];
        return view('pages.splash', compact('stats'));
    }

    public function role()
    {
        $roles = [
            ['judul' => 'Pengguna Biasa', 'icon' => 'users', 'warna' => '#c85c00', 'to' => route('register'),
             'desc' => 'Temukan dan daftar event menarik di desamu. Beli tiket dan simpan kenangan.'],
            ['judul' => 'Penyelenggara Acara', 'icon' => 'building-2', 'warna' => '#1d4ed8', 'to' => route('register', ['role' => 'PENYELENGGARA']),
             'desc' => 'Buat dan kelola event desa. Pantau tiket, transaksi, dan tim pengelolamu.'],
        ];
        return view('pages.role', compact('roles'));
    }

    public function home()
    {
        return view('pages.home', [
            // data berasal dari database lewat model Acara, Kategori, dan Testimoni
            'events' => Acara::with(['kategori', 'tickets'])
                ->where('status_event', 'PUBLISHED')
                ->orderBy('tanggal_mulai')
                ->limit(8)
                ->get(),
            'categories' => Kategori::orderBy('id')->get(),
            'testimonials' => $this->testimoni(),
        ]);
    }

    public function events(Request $request)
    {
        $tag = $request->query('tag', 'Semua');
        $city = $request->query('city', 'Semua Kota');
        $q = trim((string) $request->query('q', ''));

        $events = Acara::with(['kategori', 'tickets'])
            ->where('status_event', 'PUBLISHED')
            ->when($tag !== 'Semua', fn ($query) => $query->whereHas('kategori', fn ($k) => $k->where('nama', $tag)))
            ->when($city !== 'Semua Kota', fn ($query) => $query->where('kabupaten', $city))
            ->when($q !== '', fn ($query) => $query->where(function ($w) use ($q) {
                $w->where('nama_event', 'like', "%{$q}%")
                  ->orWhere('nama_tempat', 'like', "%{$q}%")
                  ->orWhere('nama_desa', 'like', "%{$q}%")
                  ->orWhere('kabupaten', 'like', "%{$q}%");
            }))
            ->orderBy('tanggal_mulai')
            ->get();

        return view('pages.events.index', [
            'events' => $events,
            'categories' => Kategori::orderBy('id')->get(),
            'cities' => Acara::where('status_event', 'PUBLISHED')->distinct()->orderBy('kabupaten')->pluck('kabupaten')->all(),
            'tag' => $tag, 'city' => $city, 'q' => $q,
        ]);
    }

    public function eventShow(int $id)
    {
        $event = Acara::with(['kategori', 'tickets'])->find($id);
        abort_if(!$event, 404);

        return view('pages.events.show', [
            'event' => $event,
            'testimonials' => $this->testimoni($id),
        ]);
    }

    public function faq()
    {
        return view('pages.faq', [
            'faqs' => VillageData::faqs(),
            'kategori' => ['Umum', 'Tiket', 'Pembayaran', 'Event', 'Akun', 'Lainnya'],
        ]);
    }

    public function faqSubmit(Request $request)
    {
        if (!session('user')) {
            return redirect()->route('login')->with('error', 'Login dulu untuk mengirim pertanyaan.');
        }
        $request->validate(['pertanyaan' => 'required|min:5', 'kategori' => 'required']);
        return redirect()->route('faq')->with('success', 'Pertanyaan terkirim! Admin akan segera membalas.');
    }

    public function map()
    {
        return view('pages.map', [
            'events' => Acara::where('status_event', 'PUBLISHED')->orderBy('tanggal_mulai')->get(),
        ]);
    }

    /** Ambil testimoni dari database, diubah ke array sederhana untuk komponen Blade */
    private function testimoni(?int $acaraId = null): array
    {
        return Testimoni::with('acara')
            ->when($acaraId, fn ($q) => $q->where('acara_id', $acaraId))
            ->latest('id')
            ->limit($acaraId ? 10 : 6)
            ->get()
            ->map(fn ($t) => [
                'nama' => $t->nama,
                'event' => $t->acara->nama_event,
                'rating' => $t->rating,
                'teks' => $t->teks,
            ])
            ->all();
    }
}
