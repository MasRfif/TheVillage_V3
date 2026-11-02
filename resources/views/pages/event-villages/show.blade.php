@extends('layouts.app')

@section('title', $event->nama_event)

@section('content')
<div class="container" style="padding-top:2rem;padding-bottom:3rem">
    <div style="max-width:760px;margin:0 auto">
        <a href="{{ route('event-villages.index') }}" class="back-link">Kembali ke event</a>
        <article class="card" style="padding:1.5rem;margin-top:1rem">
            @if ($event->poster)
                <a href="{{ asset('storage/' . $event->poster) }}" target="_blank" rel="noopener">
                    <img src="{{ asset('storage/' . $event->poster) }}" alt="Poster {{ $event->nama_event }}" style="width:100%;max-height:420px;object-fit:cover;border-radius:12px;margin-bottom:1.25rem">
                </a>
            @endif
            <h1 style="font-size:1.8rem;font-weight:900">{{ $event->nama_event }}</h1>
            <p class="muted">{{ $event->tanggal->format('d F Y') }}</p>
            <p style="white-space:pre-line;margin-top:1rem">{{ $event->deskripsi }}</p>
            @if ($event->poster)
                <a href="{{ asset('storage/' . $event->poster) }}" target="_blank" rel="noopener" class="btn btn-ghost" style="margin-top:1rem">Buka Poster</a>
            @endif
        </article>
    </div>
</div>
@endsection