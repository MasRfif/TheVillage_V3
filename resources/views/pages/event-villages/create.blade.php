@extends('layouts.app')

@section('title', 'Tambah Event Desa')

@section('content')
<div class="container" style="padding-top:2rem;padding-bottom:3rem">
    <div style="max-width:760px;margin:0 auto">
        <a href="{{ route('event-villages.index') }}" class="back-link">Kembali ke event</a>
        <h1 style="font-size:1.8rem;font-weight:900;margin:1rem 0 1.5rem">Tambah Event Desa</h1>

        <form action="{{ route('event-villages.store') }}" method="POST" enctype="multipart/form-data" class="card" style="padding:1.5rem;display:grid;gap:1rem">
            @csrf

            <div>
                <label class="input-label" for="nama_event">Nama Event</label>
                <input class="input" id="nama_event" name="nama_event" value="{{ old('nama_event') }}" required>
                @error('nama_event') <div class="err">{{ $message }}</div> @enderror
            </div>

            <div>
                <label class="input-label" for="deskripsi">Deskripsi</label>
                <textarea class="input" id="deskripsi" name="deskripsi" rows="6" required>{{ old('deskripsi') }}</textarea>
                @error('deskripsi') <div class="err">{{ $message }}</div> @enderror
            </div>

            <div>
                <label class="input-label" for="tanggal">Tanggal Event</label>
                <input class="input" id="tanggal" type="date" name="tanggal" value="{{ old('tanggal') }}" required>
                @error('tanggal') <div class="err">{{ $message }}</div> @enderror
            </div>

            <div>
                <label class="input-label" for="poster">Poster Event</label>
                <input class="input" id="poster" type="file" name="poster" accept=".jpg,.jpeg,.png">
                <div class="dim" style="font-size:.8rem;margin-top:.35rem">Format JPG, JPEG, atau PNG. Maksimal 2 MB.</div>
                @error('poster') <div class="err">{{ $message }}</div> @enderror
            </div>

            <button type="submit" class="btn btn-primary">Simpan Event</button>
        </form>
    </div>
</div>
@endsection