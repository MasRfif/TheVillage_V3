@extends('layouts.app')

@section('title', 'Event Desa')

@section('content')
<div class="container" style="padding-top:2rem;padding-bottom:3rem">
    <div style="display:flex;justify-content:space-between;align-items:center;gap:1rem;flex-wrap:wrap;margin-bottom:1.5rem">
        <div>
            <div class="eyebrow">Manajemen Admin</div>
            <h1 style="font-size:clamp(1.6rem,3vw,2.4rem);font-weight:900">Event Desa</h1>
            <p class="muted">Kelola informasi event dan poster kegiatan desa.</p>
        </div>
        <a href="{{ route('event-villages.create') }}" class="btn btn-primary">
            <i data-lucide="plus" class="ic-14"></i> Tambah Event
        </a>
    </div>

    @if (session('success'))
        <div class="alert alert-success" style="margin-bottom:1rem">{{ session('success') }}</div>
    @endif

    @forelse ($events as $event)
        <article class="card" style="display:flex;gap:1rem;padding:1rem;margin-bottom:.75rem;align-items:center;flex-wrap:wrap">
            @if ($event->poster)
                <img src="{{ asset('storage/' . $event->poster) }}" alt="Poster {{ $event->nama_event }}" style="width:130px;height:90px;object-fit:cover;border-radius:10px">
            @else
                <div style="width:130px;height:90px;border-radius:10px;background:var(--surface-2);display:grid;place-items:center;color:var(--muted)">Tanpa poster</div>
            @endif

            <div style="flex:1;min-width:220px">
                <h2 style="font-size:1.05rem;font-weight:800">{{ $event->nama_event }}</h2>
                <p class="muted" style="font-size:.85rem">{{ $event->tanggal->format('d F Y') }}</p>
                <a href="{{ route('event-villages.show', $event) }}" class="link">Lihat detail</a>
            </div>

            <div style="display:flex;gap:.5rem;align-items:center">
                <a href="{{ route('event-villages.edit', $event) }}" class="btn btn-ghost btn-sm">Edit</a>
                <form action="{{ route('event-villages.destroy', $event) }}" method="POST" onsubmit="return confirm('Hapus event ini?')">
                    @csrf
                    @method('DELETE')
                    <button type="submit" class="btn btn-ghost btn-sm danger">Hapus</button>
                </form>
            </div>
        </article>
    @empty
        <x-empty icon="calendar" title="Belum ada event" desc="Tambahkan event desa pertama." />
    @endforelse
</div>
@endsection