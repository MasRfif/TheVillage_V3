<?php

namespace App\Http\Controllers;

use App\Data\VillageData;
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
            'events' => VillageData::events(['published' => true]),
            'categories' => VillageData::categories(),
            'testimonials' => VillageData::testimonials(),
        ]);
    }

    public function events(Request $request)
    {
        $tag = $request->query('tag', 'Semua');
        $city = $request->query('city', 'Semua Kota');
        $q = trim((string) $request->query('q', ''));

        $events = VillageData::events(['published' => true, 'tag' => $tag, 'city' => $city, 'q' => $q]);

        return view('pages.events.index', [
            'events' => $events,
            'categories' => VillageData::categories(),
            'cities' => VillageData::cities(),
            'tag' => $tag, 'city' => $city, 'q' => $q,
        ]);
    }

    public function eventShow(int $id)
    {
        $event = VillageData::event($id);
        abort_if(!$event, 404);

        return view('pages.events.show', [
            'event' => $event,
            'testimonials' => array_values(array_filter(
                VillageData::testimonials(), fn ($t) => $t['event'] === $event['nama_event']
            )),
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
        return view('pages.map', ['events' => VillageData::events(['published' => true])]);
    }
}
