@extends('layouts.app')

@section('title', 'Masuk')
@section('fullscreen', true)

@section('content')
<div class="fullscreen-center">
    <div style="width:min(460px,100%)">
        <a href="{{ route('splash') }}" class="back-link"><i data-lucide="arrow-left" class="ic-14"></i> Kembali</a>

        <div class="card" style="padding:2rem;border-radius:18px">
            <div style="text-align:center;margin-bottom:1.75rem">
                <div class="nav-logo" style="margin-bottom:.25rem">The Village</div>
                <h2 style="font-weight:900;font-size:1.4rem">Masuk</h2>
            </div>

            <form action="{{ route('login.submit') }}" method="POST" style="display:grid;gap:1rem">
                @csrf
                <div>
                    <label class="input-label" for="email">Email</label>
                    <input class="input" id="email" type="email" name="email" value="{{ old('email') }}" placeholder="user@village.test" required>
                    @error('email') <div class="err">{{ $message }}</div> @enderror
                </div>
                <div>
                    <label class="input-label" for="password">Password</label>
                    <input class="input" id="password" type="password" name="password" placeholder="••••••••" required>
                    @error('password') <div class="err">{{ $message }}</div> @enderror
                </div>
                <button type="submit" class="btn btn-primary" style="width:100%;min-height:48px">Masuk</button>
            </form>

            <div class="muted" style="margin-top:1.25rem;padding:.85rem;border:1px dashed var(--border);border-radius:12px;font-size:.78rem;line-height:1.7">
                <b style="color:var(--text)">Akun demo</b> (password: <code>password</code>)<br>
                user@village.test · organizer@village.test · admin@village.test
            </div>

            <p class="dim" style="text-align:center;margin-top:1.25rem;font-size:.85rem">
                Belum punya akun?
                <a href="{{ route('role') }}" style="color:var(--orange);font-weight:700">Daftar</a>
            </p>
        </div>
    </div>
</div>
@endsection
