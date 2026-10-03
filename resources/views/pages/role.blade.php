@extends('layouts.app')

@section('title', 'Pilih Peran')
@section('fullscreen', true)

@section('content')
<div class="fullscreen-center">
    <div style="width:min(700px,100%);text-align:center">
        <a href="{{ route('splash') }}" class="back-link"><i data-lucide="arrow-left" class="ic-14"></i> Kembali</a>

        <h1 style="font-size:clamp(1.5rem,5vw,2.5rem);font-weight:900;margin-bottom:.5rem">Bergabung sebagai apa?</h1>
        <p class="muted" style="margin-bottom:2rem">Pilih peranmu di The Village</p>

        <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(260px,1fr));gap:1rem">
            @foreach ($roles as $r)
                <a href="{{ $r['to'] }}" class="card card-glow" style="padding:2rem 1.5rem;display:block;transition:all .2s">
                    <div style="width:72px;height:72px;border-radius:50%;background:{{ $r['warna'] }}22;color:{{ $r['warna'] }};display:grid;place-items:center;margin:0 auto 1rem">
                        <i data-lucide="{{ $r['icon'] }}" class="ic-36"></i>
                    </div>
                    <div style="font-weight:900;font-size:1.15rem;margin-bottom:.5rem">{{ $r['judul'] }}</div>
                    <div class="muted" style="font-size:.85rem;line-height:1.6">{{ $r['desc'] }}</div>
                </a>
            @endforeach
        </div>

        <p class="dim" style="margin-top:1.5rem;font-size:.85rem">
            Sudah punya akun?
            <a href="{{ route('login') }}" style="color:var(--orange);font-weight:700">Masuk di sini</a>
        </p>
    </div>
</div>
@endsection
