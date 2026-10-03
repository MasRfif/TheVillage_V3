<?php

namespace App\Http\Controllers;

use App\Data\VillageData;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function showLogin()
    {
        return view('pages.auth.login');
    }

    public function login(Request $request)
    {
        $data = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ], [
            'email.required' => 'Email wajib diisi.',
            'email.email' => 'Format email tidak valid.',
            'password.required' => 'Password wajib diisi.',
        ]);

        $user = VillageData::users()[$data['email']] ?? null;

        if (!$user || $data['password'] !== 'password') {
            return back()->withInput($request->only('email'))->with('error', 'Email atau password salah.');
        }

        session(['user' => $user]);

        $tujuan = match ($user['nama_role']) {
            'ADMIN_BG' => 'admin.dashboard',
            'PENYELENGGARA' => 'organizer.dashboard',
            default => 'home',
        };

        return redirect()->route($tujuan)->with('success', 'Berhasil masuk!');
    }

    public function showRegister(Request $request)
    {
        return view('pages.auth.register', ['role' => $request->query('role', 'USER')]);
    }

    public function register(Request $request)
    {
        $data = $request->validate([
            'nama_awal' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:6',
        ]);

        $role = $request->input('role', 'USER');
        session(['user' => [
            'nama_awal' => $data['nama_awal'],
            'nama_akhir' => $request->input('nama_akhir', ''),
            'email' => $data['email'],
            'nama_role' => $role,
        ]]);

        return redirect()
            ->route($role === 'PENYELENGGARA' ? 'organizer.dashboard' : 'home')
            ->with('success', 'Registrasi berhasil! Selamat datang 🎉');
    }

    public function logout(Request $request)
    {
        $request->session()->forget('user');
        return redirect()->route('splash')->with('success', 'Kamu sudah keluar.');
    }
}
