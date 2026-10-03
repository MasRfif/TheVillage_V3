@extends('layouts.app')

@section('title', 'Beranda')

@section('content')
<div class="container" style="padding-top:1.5rem">

    {{-- Hero --}}
    <div class="hero-section" style="margin-bottom:2rem">
        <div class="hero-content">
            <div class="row" style="margin-bottom:1rem">
                <i data-lucide="flame" class="ic-14" style="color:var(--orange)"></i>
                <span style="font-size:.82rem;font-weight:800;color:var(--orange);letter-spacing:.1em;text-transform:uppercase">Acara Desa Terkini</span>
            </div>
            <h1 class="hero-title">Temukan Acara <span>Terbaik</span> di Desamu</h1>
            <p class="muted" style="margin-top:.75rem;max-width:460px;font-size:1rem">
                Acara warga, bazar UMKM, pengajian, kerja bakti, dan kegiatan desa lainnya.
            </p>

            <form action="{{ route('events.index') }}" method="GET" style="display:flex;gap:.5rem;margin-top:1.5rem;max-width:420px">
                <div style="flex:1;display:flex;align-items:center;gap:.5rem;background:rgba(255,255,255,.08);border:1px solid rgba(200,92,0,.25);border-radius:12px;padding:.6rem .9rem">
                    <i data-lucide="search" class="ic-14 dim"></i>
                    <input name="q" placeholder="Cari acara…" style="background:none;border:none;outline:none;color:var(--text);flex:1;font-size:.9rem">
                </div>
                <button type="submit" class="btn btn-primary">Cari</button>
            </form>
        </div>
    </div>

    {{-- Kategori --}}
    <section style="margin-bottom:2rem">
        <div class="section-head"><h2 class="section-title">Kategori Acara</h2></div>
        <div class="category-strip">
            <a href="{{ route('events.index') }}" class="cat-chip active">
                <span class="cat-icon"><i data-lucide="tag" class="ic-18"></i></span>
                <span>Semua</span>
            </a>
            @foreach ($categories as $cat)
                <a href="{{ route('events.index', ['tag' => $cat['nama']]) }}" class="cat-chip">
                    <span class="cat-icon"><i data-lucide="{{ $cat['icon'] }}" class="ic-18"></i></span>
                    <span>{{ $cat['nama'] }}</span>
                </a>
            @endforeach
        </div>
    </section>

    {{-- Acara mendatang --}}
    <section style="margin-bottom:3rem">
        <div class="section-head">
            <h2 class="section-title">Acara Mendatang</h2>
            <div class="row" style="flex-wrap:wrap;justify-content:flex-end">
                <button type="button" class="scroll-nav-btn" data-target="#eventScroll" data-scroll="-320" aria-label="Sebelumnya">
                    <i data-lucide="arrow-left" class="ic-14"></i>
                </button>
                <button type="button" class="scroll-nav-btn" data-target="#eventScroll" data-scroll="320" aria-label="Berikutnya">
                    <i data-lucide="arrow-right" class="ic-14"></i>
                </button>
                <a href="{{ route('events.index') }}" class="row" style="color:var(--orange);font-weight:800;font-size:.88rem">
                    Lihat semua <i data-lucide="arrow-right" class="ic-14"></i>
                </a>
            </div>
        </div>

        @if (count($events) > 0)
            <div class="event-scroll" id="eventScroll">
                @foreach ($events as $event)
                    <x-event-card :event="$event" />
                @endforeach
            </div>
        @else
            <x-empty title="Belum ada acara" desc="Acara akan segera hadir" />
        @endif
    </section>

    {{-- Testimoni --}}
    <x-testimonial-section
        title="Testimoni Warga"
        subtitle="Rating dan ulasan yang masuk dari peserta acara desa."
        :items="$testimonials" />

    {{-- CTA --}}
    <div class="card" style="padding:2rem;margin-bottom:3rem;display:flex;align-items:center;justify-content:space-between;gap:1.5rem;flex-wrap:wrap;border-radius:16px">
        <div>
            <h3 style="font-weight:900;font-size:1.3rem;margin-bottom:.4rem">Punya acara desa yang ingin dipromosikan?</h3>
            <p class="muted" style="font-size:.9rem">Daftarkan sebagai penyelenggara dan kelola acaramu dengan mudah.</p>
        </div>
        <a href="{{ route('register', ['role' => 'PENYELENGGARA']) }}" class="btn btn-primary">
            Daftar Penyelenggara <i data-lucide="arrow-right" class="ic-18"></i>
        </a>
    </div>
</div>
@endsection
