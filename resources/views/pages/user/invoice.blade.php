@extends('layouts.app')

@section('title', 'Invoice #' . $trx['id'])

@section('content')
@php
    $lunas = in_array($trx['status'], ['PAID', 'GRATIS', 'COD_PAID']);
    $isQris = $metode['tipe'] === 'QRIS';
    $isCod = $metode['tipe'] === 'COD';
@endphp

<div class="container" style="padding-top:1.5rem;padding-bottom:3rem">
    <a href="{{ route('profile', ['tab' => 'transactions']) }}" class="back-link">
        <i data-lucide="arrow-left" class="ic-14"></i> Kembali ke transaksi
    </a>

    <div class="checkout-steps" style="margin-bottom:1.25rem">
        <div class="checkout-step done">1. Pendaftaran</div>
        <div class="checkout-step active">2. Invoice</div>
        <div class="checkout-step">3. Tiket Saya</div>
    </div>

    <div class="invoice-card">
        <div class="invoice-head">
            <div>
                <div class="footer-brand">The Village</div>
                <h1>Invoice #{{ $trx['id'] }}</h1>
                <p>@tanggal($trx['tanggal'])</p>
            </div>
            <span class="badge {{ $lunas ? 'badge-green' : ($isCod ? '' : 'badge-red') }}">{{ $trx['status'] }}</span>
        </div>

        <div class="invoice-grid">
            <section>
                <h3>Data Pendaftar</h3>
                <div class="invoice-box">
                    <div><span>Nama</span><b>{{ $pendaftar['nama_pendaftar'] ?? '-' }}</b></div>
                    <div><span>Email</span><b>{{ $pendaftar['email'] ?? '-' }}</b></div>
                    <div><span>No HP</span><b>{{ $pendaftar['no_hp'] ?? '-' }}</b></div>
                </div>

                <h3>Ringkasan Tiket</h3>
                <div class="invoice-box">
                    <div><span>Acara</span><b>{{ $trx['nama_event'] }}</b></div>
                    <div><span>Tiket</span><b>{{ $trx['nama_tiket'] }} × {{ $trx['jumlah'] }}</b></div>
                    <div><span>Total</span><b class="orange">@rupiah($trx['total'])</b></div>
                </div>
            </section>

            <section>
                <h3>Instruksi Pembayaran</h3>
                <div class="payment-instruction">
                    @if ($trx['total'] == 0)
                        <div class="free-invoice">
                            <i data-lucide="circle-check" class="ic-44"></i> Tiket gratis, tidak perlu pembayaran.
                        </div>
                    @elseif ($isQris)
                        <div>
                            <div class="mock-qris" style="margin:0 auto"><span>QRIS</span></div>
                            <p>Scan QRIS mockup ini lalu bayar sebesar <b>@rupiah($trx['total'])</b>.</p>
                            <small>Kode pembayaran: {{ $trx['kode'] }}</small>
                        </div>
                    @elseif ($isCod)
                        <div>
                            <i data-lucide="banknote" class="ic-44" style="margin:0 auto"></i>
                            <p>Bayar langsung di lokasi acara. Bawa invoice ini sebagai bukti pemesanan.</p>
                            <small>Kode pembayaran: {{ $trx['kode'] }}</small>
                        </div>
                    @else
                        <div>
                            <i data-lucide="credit-card" class="ic-44" style="margin:0 auto"></i>
                            <p>Transfer sebesar <b>@rupiah($trx['total'])</b> melalui {{ $metode['nama'] }}.</p>
                            <div class="virtual-account">8808-{{ str_replace('PAY-', '', $trx['kode']) }}</div>
                            <small>Kode pembayaran: {{ $trx['kode'] }}</small>
                        </div>
                    @endif
                </div>
            </section>
        </div>

        <div class="invoice-actions no-print">
            <button type="button" class="btn btn-ghost" onclick="window.print()">
                <i data-lucide="printer" class="ic-18"></i> Cetak Invoice
            </button>
            <a href="{{ route('profile') }}" class="btn btn-primary">
                <i data-lucide="ticket" class="ic-18"></i> Lihat Tiket Saya
            </a>
        </div>
    </div>
</div>
@endsection
