<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', 'Beranda') — The Village</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    @stack('styles')
</head>
<body>
    {{-- Notifikasi (toast) --}}
    @include('partials.flash')

    @hasSection('fullscreen')
        {{-- Halaman tanpa navbar/footer: splash, pilih peran, login, daftar --}}
        @yield('content')
    @else
        <div class="page-shell">
            @include('partials.navbar')

            <main class="page-main">
                @yield('content')
            </main>

            @include('partials.footer')
        </div>
    @endif

    <script src="https://unpkg.com/lucide@latest"></script>
    <script src="{{ asset('js/app.js') }}"></script>
    @stack('scripts')
</body>
</html>
