@extends('layouts.app')

@section('title', 'Dashboard Penyelenggara')

@section('content')
<div class="container" style="padding-top:1.5rem;padding-bottom:3rem">
    <div class="section-head">
        <div>
            <h1 style="font-weight:900;font-size:clamp(1.4rem,4vw,2rem);margin-bottom:.35rem">Dashboard Penyelenggara</h1>
            <p class="muted" style="font-size:.9rem">Halo, {{ session('user.nama_awal') }}! Kelola acara dan pantau penjualan tiketmu.</p>
        </div>
        <button type="button" class="btn btn-primary"><i data-lucide="plus" class="ic-18"></i> Buat Acara</button>
    </div>

    @include('pages.dashboard._stats', ['stats' => $stats])

    <div class="admin-card">
        <div class="admin-card-header"><span class="admin-card-title">Acara Saya</span></div>
        <div class="responsive-table">
            <table class="admin-table">
                <thead>
                    <tr><th>Acara</th><th>Lokasi</th><th>Tiket</th><th>Status</th></tr>
                </thead>
                <tbody>
                    @forelse ($events as $e)
                        <tr>
                            <td style="font-weight:700">{{ $e['nama_event'] }}</td>
                            <td>{{ $e['nama_tempat'] }}</td>
                            <td>
                                @if (count($e['tickets']) > 0)
                                    {{ count($e['tickets']) }} jenis
                                @else
                                    <span class="admin-badge gray">Belum ada</span>
                                @endif
                            </td>
                            <td>
                                <span class="admin-badge {{ $e['status_event'] === 'PUBLISHED' ? 'green' : 'orange' }}">
                                    {{ $e['status_event'] === 'PUBLISHED' ? 'Terbit' : 'Menunggu' }}
                                </span>
                            </td>
                        </tr>
                    @empty
                        <tr><td colspan="4" style="text-align:center">Kamu belum membuat acara.</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
