@extends('layouts.app')

@section('title', 'Bantuan & FAQ')

@section('content')
<div class="container" style="padding-top:2rem;padding-bottom:3rem;display:grid;gap:2rem">
    <div style="text-align:center">
        <h1 style="font-weight:900;font-size:clamp(1.5rem,4vw,2.2rem);margin-bottom:.4rem">Bantuan &amp; FAQ</h1>
        <p class="muted">Temukan jawaban untuk pertanyaan umum tentang The Village</p>
    </div>

    <div style="display:grid;gap:.65rem">
        @forelse ($faqs as $faq)
            <div class="faq-item">
                <button type="button" class="faq-q">
                    <span>{{ $faq['pertanyaan'] }}</span>
                    <i data-lucide="chevron-down" class="ic-18 muted"></i>
                </button>
                <div class="faq-a">{{ $faq['jawaban'] }}</div>
            </div>
        @empty
            <x-empty title="Belum ada FAQ tersedia" />
        @endforelse
    </div>

    <div class="card" style="padding:1.75rem;max-width:600px;margin:0 auto;width:100%">
        <h3 style="font-weight:900;font-size:1.1rem;margin-bottom:.35rem">Punya pertanyaan lain?</h3>
        <p class="muted" style="font-size:.88rem;margin-bottom:1.25rem">Pertanyaanmu akan dijawab oleh tim admin.</p>

        <form action="{{ route('faq.submit') }}" method="POST" style="display:grid;gap:1rem">
            @csrf
            <div>
                <label class="input-label">Kategori</label>
                <select name="kategori" class="input">
                    @foreach ($kategori as $k)
                        <option value="{{ $k }}" @selected(old('kategori') === $k)>{{ $k }}</option>
                    @endforeach
                </select>
            </div>
            <div>
                <label class="input-label">Pertanyaan</label>
                <textarea name="pertanyaan" class="input" rows="3" required placeholder="Tulis pertanyaanmu di sini…" style="resize:vertical">{{ old('pertanyaan') }}</textarea>
                @error('pertanyaan') <div class="err">{{ $message }}</div> @enderror
            </div>
            <button type="submit" class="btn btn-primary" style="justify-self:start">
                <i data-lucide="send" class="ic-14"></i> Kirim Pertanyaan
            </button>
        </form>
    </div>
</div>
@endsection
