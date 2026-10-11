{{--
    Gambar acara. Sumber boleh berupa URL internet (https://...) atau nama file lokal di public/assets.
    Jika gambar kosong atau gagal dimuat (offline / link mati), otomatis diganti placeholder.svg.
--}}
@props(['event', 'alt' => null])

@php
    $placeholder = asset('assets/placeholder.svg');
    $img = $event['image'] ?? null;

    if (!$img) {
        $src = $placeholder;
    } elseif (\Illuminate\Support\Str::startsWith($img, ['http://', 'https://'])) {
        $src = $img;
    } else {
        $src = asset('assets/' . rawurlencode($img));
    }
@endphp

<img {{ $attributes }}
     src="{{ $src }}"
     alt="{{ $alt ?? $event['nama_event'] }}"
     loading="lazy"
     onerror="this.onerror=null;this.src='{{ $placeholder }}';">
