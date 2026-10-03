{{-- Partial: satu baris tiket milik pengguna. Dipakai lewat @include('partials.ticket-card', ['t' => $t]) --}}
<div class="card" style="padding:1.1rem;display:flex;gap:1rem;flex-wrap:wrap;align-items:center">
    <div style="flex:1;min-width:200px">
        <div style="font-weight:800;font-size:.95rem;margin-bottom:.4rem">{{ $t['nama_event'] }}</div>
        <div class="muted" style="display:flex;gap:1rem;flex-wrap:wrap;font-size:.78rem">
            <span class="row"><i data-lucide="ticket" class="ic-12"></i> {{ $t['nama_tiket'] }}</span>
            <span class="row"><i data-lucide="hash" class="ic-12"></i> {{ $t['kode_tiket'] }}</span>
            <span class="row"><i data-lucide="calendar" class="ic-12"></i> @tanggal($t['tanggal'], 'j M Y')</span>
        </div>
    </div>
    <x-status-badge :status="$t['status']" type="tiket" />
</div>
