@extends('layouts.app')

@section('title', 'Profil Saya')

@section('content')
<div class="container" style="padding-top:2rem;padding-bottom:3rem">

    {{-- Header profil --}}
    <div class="card" style="padding:1.5rem;margin-bottom:1.5rem;display:flex;gap:1.25rem;align-items:center;flex-wrap:wrap">
        <div style="width:72px;height:72px;border-radius:50%;background:var(--orange);color:#fff;display:grid;place-items:center;font-size:1.8rem;font-weight:900;flex-shrink:0">
            {{ strtoupper(substr(session('user.nama_awal'), 0, 1)) }}
        </div>
        <div style="flex:1">
            <h2 style="font-weight:900;font-size:1.3rem;margin-bottom:.25rem">{{ session('user.nama_awal') }} {{ session('user.nama_akhir') }}</h2>
            <div class="muted" style="font-size:.88rem">{{ session('user.email') }}</div>
            <span class="badge" style="margin-top:.5rem">{{ session('user.nama_role') }}</span>
        </div>
        <div style="display:flex;gap:1.5rem">
            <div style="text-align:center">
                <div style="font-weight:900;font-size:1.4rem;color:var(--orange)">{{ count($tickets) }}</div>
                <div class="dim" style="font-size:.75rem">Tiket</div>
            </div>
            <div style="text-align:center">
                <div style="font-weight:900;font-size:1.4rem;color:var(--orange)">{{ count($transactions) }}</div>
                <div class="dim" style="font-size:.75rem">Transaksi</div>
            </div>
        </div>
    </div>

    {{-- Tab (berupa link ?tab=...) --}}
    <div class="profile-tabs" style="margin-bottom:1.25rem">
        <a href="{{ route('profile', ['tab' => 'tickets']) }}" class="profile-tab {{ $tab === 'tickets' ? 'active' : '' }}">
            <i data-lucide="ticket" class="ic-14" style="display:inline-block;vertical-align:-2px"></i> Tiket Saya
        </a>
        <a href="{{ route('profile', ['tab' => 'transactions']) }}" class="profile-tab {{ $tab === 'transactions' ? 'active' : '' }}">
            <i data-lucide="bell" class="ic-14" style="display:inline-block;vertical-align:-2px"></i> Transaksi
        </a>
    </div>

    @if ($tab === 'tickets')
        @forelse ($tickets as $t)
            @if ($loop->first)
                <div style="display:grid;gap:.75rem">
            @endif

            @include('partials.ticket-card', ['t' => $t])

            @if ($loop->last)
                </div>
            @endif
        @empty
            <x-empty icon="🎫" title="Belum ada tiket" desc="Beli tiket event dan tiketmu muncul di sini" />
        @endforelse
    @else
        @forelse ($transactions as $trx)
            @if ($loop->first)
                <div class="card" style="overflow:hidden">
                    <div class="responsive-table">
                        <table class="profile-table">
                            <thead>
                                <tr><th>ID</th><th>Tanggal</th><th>Total</th><th>Status</th><th>Aksi</th></tr>
                            </thead>
                            <tbody>
            @endif

                                <tr>
                                    <td style="font-weight:700">#{{ $trx['id'] }}</td>
                                    <td>@tanggal($trx['tanggal'], 'j M Y')</td>
                                    <td style="font-weight:700;color:var(--orange)">@rupiah($trx['total'])</td>
                                    <td><x-status-badge :status="$trx['status']" type="transaksi" /></td>
                                    <td>
                                        <a href="{{ route('invoice.show', $trx['id']) }}" class="btn btn-ghost btn-sm">
                                            <i data-lucide="receipt-text" class="ic-14"></i> Invoice
                                        </a>
                                    </td>
                                </tr>

            @if ($loop->last)
                            </tbody>
                        </table>
                    </div>
                </div>
            @endif
        @empty
            <x-empty icon="📋" title="Belum ada transaksi" />
        @endforelse
    @endif
</div>
@endsection
