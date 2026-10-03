@extends('layouts.app')

@section('title', 'Selamat Datang')
@section('fullscreen', true)

@section('content')
<div class="splash-page" style="position:relative">
    <div class="splash-bg"></div>

    <div class="splash-wrap">
        <span style="font-size:.78rem;font-weight:800;letter-spacing:.2em;color:var(--text-dim);text-transform:uppercase;background:var(--panel2);padding:.35rem 1rem;border-radius:999px;border:1px solid var(--border)">
            Platform Acara Desa
        </span>
        <h1 class="splash-title">The Village</h1>
        <p class="splash-tagline">
            Jembatan Informasi Acara Desa.<br>Satu Desa, Ribuan Cerita.
        </p>
        <p class="splash-copy">Temukan, daftar, dan nikmati event desa terbaik di sekitarmu.</p>

        <div style="display:flex;flex-direction:column;align-items:center;gap:.75rem;margin-top:2rem">
            <a href="{{ route('home') }}" class="btn btn-primary" style="min-width:220px;font-size:1rem;min-height:50px;border-radius:12px">
                Mulai Jelajahi <i data-lucide="arrow-right" class="ic-18"></i>
            </a>
            @if (session('user'))
                <a href="{{ route('profile') }}" class="dim row" style="font-size:.88rem">
                    <i data-lucide="user" class="ic-14"></i> Halo, {{ session('user.nama_awal') }} — lihat tiketmu
                </a>
            @else
                <a href="{{ route('login') }}" class="dim row" style="font-size:.88rem">
                    <i data-lucide="log-in" class="ic-14"></i> Sudah punya akun? Masuk
                </a>
            @endif
        </div>
    </div>

    <div style="position:absolute;bottom:1.5rem;left:0;right:0;display:flex;justify-content:center;gap:2rem">
        @foreach ($stats as $stat)
            <div style="text-align:center">
                <div style="font-weight:900;color:var(--orange);font-size:1rem">{{ $stat[0] }}</div>
                <div class="dim" style="font-size:.72rem">{{ $stat[1] }}</div>
            </div>
        @endforeach
    </div>
</div>
@endsection
