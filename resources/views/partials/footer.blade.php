<footer class="footer">
    <div class="container">
        <div class="footer-grid">
            <div>
                <div class="footer-brand">The Village</div>
                <p class="footer-text">
                    Jembatan Informasi Acara Desa.<br>
                    Temukan, daftar, dan nikmati event desa terbaik di sekitarmu.
                </p>
            </div>
            <div>
                <div class="footer-head">Jelajahi</div>
                <a class="footer-link" href="{{ route('home') }}">Beranda</a>
                <a class="footer-link" href="{{ route('events.index') }}">Semua Acara</a>
                <a class="footer-link" href="{{ route('map') }}">Peta Acara</a>
            </div>
            <div>
                <div class="footer-head">Akun</div>
                <a class="footer-link" href="{{ route('login') }}">Masuk</a>
                <a class="footer-link" href="{{ route('role') }}">Daftar</a>
                <a class="footer-link" href="{{ route('profile') }}">Tiket Saya</a>
            </div>
            <div>
                <div class="footer-head">Bantuan</div>
                <a class="footer-link" href="{{ route('faq') }}">FAQ</a>
                <a class="footer-link" href="{{ route('register', ['role' => 'PENYELENGGARA']) }}">Jadi Penyelenggara</a>
            </div>
        </div>
        <div class="footer-bottom">© {{ date('Y') }} The Village. Semua hak dilindungi.</div>
    </div>
</footer>
