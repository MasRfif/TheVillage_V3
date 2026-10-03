@extends('layouts.app')

@section('title', 'Dashboard Admin')

@section('content')
<div class="container" style="padding-top:1.5rem;padding-bottom:3rem">
    <h1 style="font-weight:900;font-size:clamp(1.4rem,4vw,2rem);margin-bottom:.35rem">Dashboard Admin</h1>
    <p class="muted" style="margin-bottom:1.5rem;font-size:.9rem">Ringkasan sistem dan verifikasi acara The Village</p>

    @include('pages.dashboard._stats', ['stats' => $stats])

    <div class="admin-card">
        <div class="admin-card-header"><span class="admin-card-title">Verifikasi Acara</span></div>
        <div class="responsive-table">
            <table class="admin-table">
                <thead>
                    <tr><th>Acara</th><th>Kategori</th><th>Tanggal</th><th>Status</th><th>Aksi</th></tr>
                </thead>
                <tbody>
                    @forelse ($events as $e)
                        <tr>
                            <td style="font-weight:700">{{ $e['nama_event'] }}</td>
                            <td>{{ $e['nama_category'] }}</td>
                            <td>@tanggal($e['tanggal_mulai'], 'j M Y')</td>
                            <td>
                                @if ($e['status_event'] === 'PUBLISHED')
                                    <span class="admin-badge green">Terbit</span>
                                @elseif ($e['status_event'] === 'PENDING')
                                    <span class="admin-badge orange">Menunggu</span>
                                @else
                                    <span class="admin-badge red">Ditolak</span>
                                @endif
                            </td>
                            <td>
                                @if ($e['status_event'] === 'PENDING')
                                    <button type="button" class="btn btn-success btn-sm">Setujui</button>
                                    <button type="button" class="btn btn-danger btn-sm">Tolak</button>
                                @else
                                    <a href="{{ route('events.show', $e['id']) }}" class="btn btn-ghost btn-sm" style="color:#1a1714">Lihat</a>
                                @endif
                            </td>
                        </tr>
                    @empty
                        <tr><td colspan="5" style="text-align:center">Belum ada acara.</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
