@extends('layouts.app')

@section('title', 'Daftar Akun')
@section('fullscreen', true)

@section('content')
<div class="fullscreen-center">
    <div style="width:min(460px,100%)">
        <a href="{{ route('role') }}" class="back-link"><i data-lucide="arrow-left" class="ic-14"></i> Kembali</a>

        <div class="card" style="padding:2rem;border-radius:18px">
            <div style="text-align:center;margin-bottom:1.75rem">
                <div class="nav-logo" style="margin-bottom:.25rem">The Village</div>
                <h2 style="font-weight:900;font-size:1.4rem">Daftar Akun</h2>
                @if ($role === 'PENYELENGGARA')
                    <span class="badge" style="margin-top:.5rem">Penyelenggara</span>
                @endif
            </div>

            <form action="{{ route('register.submit') }}" method="POST" style="display:grid;gap:1rem">
                @csrf
                <input type="hidden" name="role" value="{{ $role }}">

                <div style="display:grid;grid-template-columns:1fr 1fr;gap:.75rem">
                    <div>
                        <label class="input-label">Nama Depan</label>
                        <input class="input" name="nama_awal" value="{{ old('nama_awal') }}" placeholder="Budi" required>
                        @error('nama_awal') <div class="err">{{ $message }}</div> @enderror
                    </div>
                    <div>
                        <label class="input-label">Nama Belakang</label>
                        <input class="input" name="nama_akhir" value="{{ old('nama_akhir') }}" placeholder="Santoso">
                    </div>
                </div>

                @if ($role === 'PENYELENGGARA')
                    <div>
                        <label class="input-label">Nama Organisasi</label>
                        <input class="input" name="organisasi" value="{{ old('organisasi') }}" placeholder="Karang Taruna Sukamaju">
                    </div>
                @endif

                <div>
                    <label class="input-label">Email</label>
                    <input class="input" type="email" name="email" value="{{ old('email') }}" placeholder="email@contoh.com" required>
                    @error('email') <div class="err">{{ $message }}</div> @enderror
                </div>
                <div>
                    <label class="input-label">Password</label>
                    <input class="input" type="password" name="password" placeholder="Minimal 6 karakter" required>
                    @error('password') <div class="err">{{ $message }}</div> @enderror
                </div>

                <button type="submit" class="btn btn-primary" style="width:100%;min-height:48px">Daftar</button>
            </form>

            <p class="dim" style="text-align:center;margin-top:1.25rem;font-size:.85rem">
                Sudah punya akun?
                <a href="{{ route('login') }}" style="color:var(--orange);font-weight:700">Masuk</a>
            </p>
        </div>
    </div>
</div>
@endsection
