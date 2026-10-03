@extends('layouts.app')

@section('title', 'Semua Acara')

@section('content')
<div class="container" style="padding-top:1.5rem;padding-bottom:3rem">
    <div style="margin-bottom:1.5rem">
        <h1 style="font-weight:900;font-size:clamp(1.5rem,4vw,2.2rem);margin-bottom:.25rem">Semua Acara</h1>
        <p class="muted" style="font-size:.9rem">Temukan acara sesuai kategori dan kota</p>
    </div>

    {{-- Form pencarian & filter kota --}}
    <form action="{{ route('events.index') }}" method="GET" style="display:flex;gap:.75rem;flex-wrap:wrap;margin-bottom:1.5rem;align-items:center">
        @if ($tag !== 'Semua')
            <input type="hidden" name="tag" value="{{ $tag }}">
        @endif

        <div style="flex:1;min-width:210px;display:flex;align-items:center;gap:.5rem;background:var(--panel2);border:1px solid var(--border);border-radius:12px;padding:.55rem .9rem">
            <i data-lucide="search" class="ic-14 dim"></i>
            <input name="q" value="{{ $q }}" placeholder="Cari acara atau lokasi…" style="background:none;border:none;outline:none;color:var(--text);flex:1;font-size:.9rem">
        </div>

        <select name="city" class="input" style="width:auto;min-width:160px">
            <option value="Semua Kota">Semua Kota</option>
            @foreach ($cities as $kota)
                <option value="{{ $kota }}" @selected($city === $kota)>{{ $kota }}</option>
            @endforeach
        </select>

        <button type="submit" class="btn btn-primary btn-sm" style="min-height:44px">Terapkan</button>
    </form>

    {{-- Chip kategori --}}
    <div style="display:flex;gap:.5rem;flex-wrap:wrap;margin-bottom:1.5rem">
        <a href="{{ route('events.index', array_filter(['q' => $q, 'city' => $city !== 'Semua Kota' ? $city : null])) }}"
           class="chip-link {{ $tag === 'Semua' ? 'active' : '' }}">Semua</a>
        @foreach ($categories as $cat)
            <a href="{{ route('events.index', array_filter(['tag' => $cat['nama'], 'q' => $q, 'city' => $city !== 'Semua Kota' ? $city : null])) }}"
               class="chip-link {{ $tag === $cat['nama'] ? 'active' : '' }}">{{ $cat['nama'] }}</a>
        @endforeach
    </div>

    <div class="dim" style="font-size:.82rem;margin-bottom:1rem">{{ count($events) }} acara ditemukan</div>

    @forelse ($events as $event)
        @if ($loop->first)
            <div class="events-grid">
        @endif

        <x-event-card :event="$event" />

        @if ($loop->last)
            </div>
        @endif
    @empty
        <x-empty icon="🔍" title="Acara tidak ditemukan" desc="Coba ubah filter atau kata kunci pencarian" />
    @endforelse
</div>
@endsection
