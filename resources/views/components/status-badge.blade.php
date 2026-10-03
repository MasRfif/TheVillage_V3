@props(['status', 'type' => 'tiket'])

@php
    $peta = [
        'tiket' => ['VALID' => 'badge-green', 'USED' => 'badge-gray', 'BAYAR_DI_TEMPAT' => 'badge', 'BELUM_BAYAR' => 'badge-red', 'CANCELLED' => 'badge-red'],
        'transaksi' => ['PAID' => 'badge-green', 'GRATIS' => 'badge-green', 'PENDING' => 'badge', 'COD_PENDING' => 'badge', 'FAILED' => 'badge-red', 'EXPIRED' => 'badge-red'],
        'event' => ['PUBLISHED' => 'badge-green', 'PENDING' => 'badge', 'REJECTED' => 'badge-red'],
    ];
    $kelas = $peta[$type][$status] ?? 'badge-gray';
@endphp

<span class="badge {{ $kelas }}">{{ str_replace('_', ' ', $status) }}</span>
