@props(['event'])

@php
    $hargaTermurah = collect($event['tickets'])->min('harga') ?? 0;
@endphp

<a href="{{ route('events.show', $event['id']) }}" class="event-card" style="display:block">
    <img src="{{ asset('assets/' . rawurlencode($event['image'])) }}" alt="{{ $event['nama_event'] }}">
    <div class="event-card-body">
        <span class="badge">{{ $event['nama_category'] }}</span>
        <div class="event-card-title" style="margin-top:.55rem">{{ $event['nama_event'] }}</div>
        <div class="event-card-meta">
            <span><i data-lucide="calendar" class="ic-12"></i> @tanggal($event['tanggal_mulai'], 'j M Y')</span>
            <span><i data-lucide="map-pin" class="ic-12"></i> {{ $event['nama_tempat'] }}</span>
        </div>
        <div class="event-card-footer">
            @if ($event['jenis_event'] === 'GRATIS')
                <span class="event-price">GRATIS</span>
            @else
                <span class="event-price">Mulai @rupiah($hargaTermurah)</span>
            @endif
            <span class="badge badge-gray">Detail</span>
        </div>
    </div>
</a>
