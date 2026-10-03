@extends('layouts.app')

@section('title', 'Pendaftaran Peserta')

@section('content')
<div class="container" style="padding-top:1.5rem;padding-bottom:3rem">
    <a href="{{ route('events.show', $event['id']) }}" class="back-link"><i data-lucide="arrow-left" class="ic-14"></i> Kembali</a>

    <div class="checkout-steps" style="margin-bottom:1.25rem">
        <div class="checkout-step active">1. Pendaftaran</div>
        <div class="checkout-step">2. Invoice</div>
        <div class="checkout-step">3. Tiket Saya</div>
    </div>

    <div class="checkout-layout">
        <form class="card" action="{{ route('checkout.store', $ticket['id']) }}" method="POST" style="padding:1.25rem;display:grid;gap:1rem">
            @csrf
            <input type="hidden" name="qty" value="{{ $qty }}">

            <div>
                <h1 style="font-weight:900;font-size:clamp(1.35rem,4vw,2rem);margin-bottom:.35rem">Pendaftaran Peserta</h1>
                <p class="muted" style="font-size:.9rem">Isi data peserta dulu sebelum masuk ke invoice pembayaran.</p>
            </div>

            <div class="form-grid-2">
                <div>
                    <label class="input-label"><i data-lucide="user" class="ic-12"></i> Nama Pendaftar</label>
                    <input class="input" name="nama_pendaftar" required
                           value="{{ old('nama_pendaftar', trim($user['nama_awal'] . ' ' . $user['nama_akhir'])) }}">
                    @error('nama_pendaftar') <div class="err">{{ $message }}</div> @enderror
                </div>
                <div>
                    <label class="input-label"><i data-lucide="mail" class="ic-12"></i> Email</label>
                    <input class="input" type="email" name="email" required value="{{ old('email', $user['email']) }}">
                    @error('email') <div class="err">{{ $message }}</div> @enderror
                </div>
                <div>
                    <label class="input-label"><i data-lucide="phone" class="ic-12"></i> Nomor HP</label>
                    <input class="input" name="no_hp" required value="{{ old('no_hp') }}" placeholder="08xxxxxxxxxx">
                    @error('no_hp') <div class="err">{{ $message }}</div> @enderror
                </div>
                <div>
                    <label class="input-label"><i data-lucide="clipboard-list" class="ic-12"></i> Catatan</label>
                    <input class="input" name="catatan" value="{{ old('catatan') }}" placeholder="Opsional">
                </div>
            </div>

            <div>
                <label class="input-label">Metode Pembayaran</label>
                <div class="payment-method-grid">
                    @foreach ($methods as $m)
                        <label class="payment-method-card">
                            <input type="radio" name="id_payment_method" value="{{ $m['id'] }}" data-nama="{{ $m['nama'] }}" @checked(old('id_payment_method', $methods[0]['id']) == $m['id'])>
                            <span><i data-lucide="{{ $m['icon'] }}" class="ic-18"></i></span>
                            <b>{{ $m['nama'] }}</b>
                            <small>{{ $m['ket'] }}</small>
                        </label>
                    @endforeach
                </div>
            </div>

            <button type="submit" class="btn btn-primary" style="width:100%;min-height:48px">Lanjut ke Invoice</button>
        </form>

        <aside class="card checkout-summary">
            <img src="{{ asset('assets/' . rawurlencode($event['image'])) }}" alt="{{ $event['nama_event'] }}">
            <div style="padding:1rem">
                <h2 style="font-weight:900;font-size:1rem;margin-bottom:.25rem">{{ $event['nama_event'] }}</h2>
                <p class="muted" style="font-size:.82rem;margin-bottom:1rem">{{ $ticket['nama_tiket'] }} × {{ $qty }}</p>
                <div class="summary-row"><span>Metode</span><b id="ringkasMetode">{{ $methods[0]['nama'] }}</b></div>
                <div class="summary-row"><span>Total</span><b class="orange">@rupiah($ticket['harga'] * $qty)</b></div>
            </div>
        </aside>
    </div>
</div>
@endsection

@push('scripts')
<script>
    document.querySelectorAll('input[name="id_payment_method"]').forEach(function (r) {
        r.addEventListener('change', function () {
            document.getElementById('ringkasMetode').textContent = r.dataset.nama;
        });
    });
</script>
@endpush
