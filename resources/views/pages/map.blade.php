@extends('layouts.app')

@section('title', 'Peta Acara')

@section('content')
<div class="container" style="padding-top:1.5rem;padding-bottom:3rem">
    <h1 style="font-weight:900;font-size:clamp(1.4rem,4vw,2rem);margin-bottom:.35rem">Peta Acara</h1>
    <p class="muted" style="margin-bottom:1.5rem;font-size:.9rem">Temukan event berdasarkan lokasi di sekitarmu</p>

    <div style="display:grid;gap:1.25rem">
        <div style="border-radius:16px;overflow:hidden;border:1px solid var(--border);height:400px">
            <iframe src="https://www.google.com/maps?q=Bandung,+Jawa+Barat&output=embed"
                    width="100%" height="400" style="border:0;display:block" allowfullscreen loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade" title="Peta Bandung"></iframe>
        </div>

        <div>
            <h2 style="font-weight:900;font-size:1.1rem;margin-bottom:1rem">Titik Lokasi Event ({{ count($events) }})</h2>
            <div style="display:grid;gap:.65rem">
                @forelse ($events as $ev)
                    <a href="{{ route('events.show', $ev['id']) }}" class="card card-glow" style="padding:1rem;display:flex;gap:.85rem;align-items:center">
                        <div style="width:40px;height:40px;border-radius:50%;background:var(--orange-dim);color:var(--orange);display:grid;place-items:center;flex-shrink:0">
                            <i data-lucide="map-pin" class="ic-18"></i>
                        </div>
                        <div style="flex:1;min-width:0">
                            <div style="font-weight:800;font-size:.92rem">{{ $ev['nama_event'] }}</div>
                            <div class="muted" style="font-size:.78rem;display:flex;gap:.75rem;margin-top:.2rem;flex-wrap:wrap">
                                <span class="row"><i data-lucide="map-pin" class="ic-12"></i> {{ $ev['nama_tempat'] }}</span>
                                <span class="row"><i data-lucide="calendar" class="ic-12"></i> @tanggal($ev['tanggal_mulai'], 'j M Y')</span>
                            </div>
                        </div>
                        <span class="badge">{{ $ev['nama_category'] }}</span>
                    </a>
                @empty
                    <x-empty title="Belum ada event di peta" />
                @endforelse
            </div>
        </div>
    </div>
</div>
@endsection
