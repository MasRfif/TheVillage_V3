@extends('layouts.app')

@section('title', $event['nama_event'])

@section('content')
<div class="container" style="padding-top:1.5rem;padding-bottom:3rem">
    <a href="{{ route('events.index') }}" class="back-link"><i data-lucide="arrow-left" class="ic-14"></i> Kembali ke daftar acara</a>

    <div class="detail-layout">
        {{-- Kiri: informasi acara --}}
        <div>
            <img class="detail-hero-img" src="{{ asset('assets/' . rawurlencode($event['image'])) }}" alt="{{ $event['nama_event'] }}">

            <div class="card" style="margin-top:1.25rem;overflow:hidden">
                <div class="detail-section">
                    <div style="display:flex;gap:.5rem;flex-wrap:wrap;margin-bottom:.75rem">
                        <span class="badge"><i data-lucide="tag" class="ic-12"></i> {{ $event['nama_category'] }}</span>
                        <x-status-badge :status="$event['status_event']" type="event" />
                        <span class="badge">{{ $event['jenis_event'] === 'BERBAYAR' ? 'Berbayar' : 'Gratis' }}</span>
                    </div>
                    <h1 style="font-weight:900;font-size:clamp(1.3rem,4vw,2rem);line-height:1.2;margin-bottom:.75rem">{{ $event['nama_event'] }}</h1>
                    @if (!empty($event['organizer_name']))
                        <p class="muted" style="font-size:.88rem">oleh <span style="color:var(--orange);font-weight:700">{{ $event['organizer_name'] }}</span></p>
                    @endif
                </div>

                <div class="detail-section">
                    <h2 class="row" style="font-weight:900;font-size:1rem;margin-bottom:.75rem">
                        <i data-lucide="calendar" class="ic-14" style="color:var(--orange)"></i> Detail Acara
                    </h2>
                    <div style="display:grid;gap:.65rem">
                        <div style="display:flex;gap:.75rem">
                            <i data-lucide="calendar" class="ic-14 dim" style="margin-top:3px"></i>
                            <div>
                                <div class="dim" style="font-size:.8rem">Tanggal</div>
                                <div style="font-weight:700;font-size:.9rem">
                                    @tanggal($event['tanggal_mulai'])
                                    @if ($event['tanggal_selesai'] !== $event['tanggal_mulai'])
                                        — @tanggal($event['tanggal_selesai'])
                                    @endif
                                </div>
                            </div>
                        </div>
                        <div style="display:flex;gap:.75rem">
                            <i data-lucide="map-pin" class="ic-14 dim" style="margin-top:3px"></i>
                            <div>
                                <div class="dim" style="font-size:.8rem">Lokasi</div>
                                <div style="font-weight:700;font-size:.9rem">{{ $event['nama_tempat'] }}</div>
                                <div class="muted" style="font-size:.82rem">{{ $event['nama_desa'] }}, {{ $event['kabupaten'] }}</div>
                            </div>
                        </div>
                        @if ($event['max_peserta'] > 0)
                            <div style="display:flex;gap:.75rem">
                                <i data-lucide="users" class="ic-14 dim" style="margin-top:3px"></i>
                                <div>
                                    <div class="dim" style="font-size:.8rem">Kapasitas</div>
                                    <div style="font-weight:700;font-size:.9rem">{{ $event['max_peserta'] }} peserta</div>
                                </div>
                            </div>
                        @endif
                    </div>
                </div>

                @if (!empty($event['deskripsi']))
                    <div class="detail-section">
                        <h2 style="font-weight:900;font-size:1rem;margin-bottom:.75rem">Tentang Acara</h2>
                        <p class="muted" style="line-height:1.7;font-size:.9rem">{{ $event['deskripsi'] }}</p>
                    </div>
                @endif

                <div class="detail-section">
                    <h2 class="row" style="font-weight:900;font-size:1rem;margin-bottom:.75rem">
                        <i data-lucide="map-pin" class="ic-14" style="color:var(--orange)"></i> Lokasi
                    </h2>
                    <div style="border-radius:12px;overflow:hidden;background:var(--panel2);height:180px">
                        <iframe src="https://www.google.com/maps?q={{ urlencode($event['nama_tempat'] . ' ' . $event['kabupaten']) }}&output=embed"
                                width="100%" height="180" style="border:0;display:block" allowfullscreen loading="lazy"
                                referrerpolicy="no-referrer-when-downgrade" title="Lokasi acara"></iframe>
                    </div>
                    <p class="muted" style="font-size:.82rem;margin-top:.5rem">{{ $event['map_popup_desc'] }}</p>
                </div>
            </div>
        </div>

        {{-- Kanan: panel tiket --}}
        <div style="display:flex;flex-direction:column;gap:1rem">
            <form class="card" style="padding:1.25rem" method="GET" action="{{ route('checkout.show', ['ticketId' => '__ID__']) }}" id="formTiket">
                <h3 style="font-weight:900;font-size:1rem;margin-bottom:1rem">Pilih Tiket</h3>

                @forelse ($event['tickets'] as $t)
                    @if ($loop->first)
                        <div style="display:grid;gap:.75rem;margin-bottom:1rem">
                    @endif

                    <label class="ticket-option">
                        <input type="radio" name="tiket" value="{{ $t['id'] }}" data-harga="{{ $t['harga'] }}" data-stok="{{ $t['qty'] }}" @checked($loop->first)>
                        <div style="display:flex;justify-content:space-between;align-items:flex-start">
                            <div>
                                <div class="ticket-name">{{ $t['nama_tiket'] }}</div>
                                <div class="dim" style="font-size:.74rem;margin-top:.15rem">{{ $t['nama_kategori'] }}</div>
                            </div>
                            <div style="text-align:right">
                                <div class="ticket-price">@rupiah($t['harga'])</div>
                                <div class="dim" style="font-size:.72rem">Sisa: {{ $t['qty'] }}</div>
                            </div>
                        </div>
                    </label>

                    @if ($loop->last)
                        </div>
                    @endif
                @empty
                    <div class="dim" style="text-align:center;padding:1.5rem 0;font-size:.88rem">Tiket belum tersedia</div>
                @endforelse

                @if (count($event['tickets']) > 0)
                    <div style="margin-bottom:1rem">
                        <label class="muted" style="font-size:.8rem;font-weight:700;display:block;margin-bottom:.5rem">Jumlah</label>
                        <div class="qty-control">
                            <button type="button" class="qty-btn" id="qtyMin">−</button>
                            <input type="hidden" name="qty" id="qtyInput" value="1">
                            <span class="qty-value" id="qtyText">1</span>
                            <button type="button" class="qty-btn" id="qtyPlus">+</button>
                        </div>
                    </div>

                    <div style="background:var(--panel2);border-radius:10px;padding:.75rem;margin-bottom:1rem;font-size:.85rem;display:flex;justify-content:space-between">
                        <span class="muted">Total</span>
                        <span id="totalText" style="font-weight:900;color:var(--orange);font-size:1rem"></span>
                    </div>

                    @if (session('user'))
                        <button type="submit" class="btn btn-primary" style="width:100%;min-height:48px">
                            <i data-lucide="shopping-cart" class="ic-18"></i> Pesan Sekarang
                        </button>
                    @else
                        <a href="{{ route('login') }}" class="btn btn-primary" style="width:100%;min-height:48px">
                            <i data-lucide="log-in" class="ic-18"></i> Masuk untuk Memesan
                        </a>
                    @endif
                @endif
            </form>

            <div class="card muted" style="padding:1.25rem;font-size:.82rem">
                <div class="row" style="font-weight:800;margin-bottom:.5rem;color:var(--text)">
                    <i data-lucide="info" class="ic-14" style="color:var(--orange)"></i> Info Pembelian
                </div>
                <div style="line-height:1.7">
                    • Tiket dikirim langsung ke profil kamu<br>
                    • Tunjukkan kode tiket saat masuk lokasi<br>
                    • Pembayaran diproses secara aman
                </div>
            </div>
        </div>
    </div>

    <div style="margin-top:2.5rem">
        <x-testimonial-section
            title="Testimoni & Rating Acara"
            subtitle="Ulasan dari warga yang sudah mengikuti atau menilai acara ini."
            :items="$testimonials" />
    </div>
</div>
@endsection

@push('scripts')
<script>
    (function () {
        var form = document.getElementById('formTiket');
        if (!form) return;
        var radios = form.querySelectorAll('input[name="tiket"]');
        if (!radios.length) return;
        var qty = 1;
        var baseAction = form.getAttribute('action');
        var qtyInput = document.getElementById('qtyInput');
        var qtyText = document.getElementById('qtyText');
        var totalText = document.getElementById('totalText');

        function terpilih() { return form.querySelector('input[name="tiket"]:checked'); }
        function rupiah(n) { return n === 0 ? 'GRATIS' : 'Rp ' + n.toLocaleString('id-ID'); }

        function render() {
            var r = terpilih();
            var stok = parseInt(r.dataset.stok, 10);
            if (qty > stok) qty = stok;
            qtyInput.value = qty;
            qtyText.textContent = qty;
            totalText.textContent = rupiah(parseInt(r.dataset.harga, 10) * qty);
            form.setAttribute('action', baseAction.replace('__ID__', r.value));
        }

        radios.forEach(function (r) { r.addEventListener('change', render); });
        document.getElementById('qtyMin').addEventListener('click', function () { qty = Math.max(1, qty - 1); render(); });
        document.getElementById('qtyPlus').addEventListener('click', function () { qty += 1; render(); });
        render();
    })();
</script>
@endpush
