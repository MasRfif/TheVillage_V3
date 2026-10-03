@php
    $menu = [
        ['route' => 'home', 'label' => 'Beranda', 'icon' => 'house'],
        ['route' => 'events.index', 'label' => 'Acara', 'icon' => 'calendar'],
        ['route' => 'map', 'label' => 'Peta', 'icon' => 'map-pin'],
        ['route' => 'faq', 'label' => 'FAQ', 'icon' => 'circle-help'],
    ];
    $user = session('user');
@endphp

<header class="navbar">
    <div class="container">
        <div class="nav-inner">
            <a href="{{ route('home') }}" class="nav-logo">The Village</a>

            <form action="{{ route('events.index') }}" method="GET" class="nav-search">
                <i data-lucide="search" class="ic-14 dim"></i>
                <input type="text" name="q" value="{{ request('q') }}" placeholder="Cari acara…">
            </form>

            <nav class="nav-links">
                @foreach ($menu as $m)
                    <a href="{{ route($m['route']) }}"
                       class="nav-link {{ request()->routeIs($m['route'] . '*') ? 'active' : '' }}">
                        {{ $m['label'] }}
                    </a>
                @endforeach

                @if ($user)
                    <div class="profile-wrap">
                        <button type="button" class="profile-pill" data-toggle="#profileMenu">
                            <span class="profile-avatar">{{ strtoupper(substr($user['nama_awal'], 0, 1)) }}</span>
                            <span style="font-size:.85rem;font-weight:700">{{ $user['nama_awal'] }}</span>
                        </button>
                        <div class="dropdown-menu hidden" id="profileMenu" data-closeable>
                            <a class="dropdown-item" href="{{ route('profile') }}">
                                <i data-lucide="ticket" class="ic-14"></i> Tiket &amp; Transaksi
                            </a>

                            @if (in_array($user['nama_role'], ['ADMIN_BG', 'ADMIN_SYSTEM']))
                                <a class="dropdown-item" href="{{ route('admin.dashboard') }}">
                                    <i data-lucide="layout-dashboard" class="ic-14"></i> Dashboard Admin
                                </a>
                            @elseif ($user['nama_role'] === 'PENYELENGGARA')
                                <a class="dropdown-item" href="{{ route('organizer.dashboard') }}">
                                    <i data-lucide="layout-dashboard" class="ic-14"></i> Dashboard Penyelenggara
                                </a>
                            @endif

                            <form action="{{ route('logout') }}" method="POST">
                                @csrf
                                <button type="submit" class="dropdown-item danger" style="width:100%">
                                    <i data-lucide="log-out" class="ic-14"></i> Keluar
                                </button>
                            </form>
                        </div>
                    </div>
                @else
                    <a href="{{ route('login') }}" class="nav-link">Masuk</a>
                    <a href="{{ route('role') }}" class="btn btn-primary btn-sm">Daftar</a>
                @endif
            </nav>

            <button type="button" class="nav-icon-btn nav-burger" data-toggle="#mobileMenu" aria-label="Menu">
                <i data-lucide="menu"></i>
            </button>
        </div>

        {{-- Menu mobile --}}
        <div class="mobile-menu-wrap hidden" id="mobileMenu" data-closeable>
            <div class="mobile-menu-card">
                <form action="{{ route('events.index') }}" method="GET" class="mobile-menu-search">
                    <i data-lucide="search" class="ic-14 dim"></i>
                    <input type="text" name="q" placeholder="Cari acara…">
                </form>
                <div class="mobile-menu-grid-links">
                    @foreach ($menu as $m)
                        <a href="{{ route($m['route']) }}"
                           class="mobile-menu-link {{ request()->routeIs($m['route'] . '*') ? 'active' : '' }}">
                            <i data-lucide="{{ $m['icon'] }}" class="ic-14"></i> {{ $m['label'] }}
                        </a>
                    @endforeach
                    @if ($user)
                        <a href="{{ route('profile') }}" class="mobile-menu-link">
                            <i data-lucide="ticket" class="ic-14"></i> Tiket Saya
                        </a>
                    @else
                        <a href="{{ route('login') }}" class="mobile-menu-link">
                            <i data-lucide="log-in" class="ic-14"></i> Masuk
                        </a>
                    @endif
                </div>
            </div>
        </div>
    </div>
</header>
