<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

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

        if (!Auth::attempt($data, $request->boolean('remember'))) {
            return back()
                ->withInput($request->only('email'))
                ->withErrors(['email' => 'Email atau password salah.']);
        }

        $request->session()->regenerate();
        $user = Auth::user();
        abort_unless($user instanceof User, 500);
        $this->syncLegacyUserSession($user);

        $tujuan = match ($user->role) {
            'ADMIN_BG' => 'admin.dashboard',
            'PENYELENGGARA' => 'organizer.dashboard',
            default => 'home',
        };

        return to_route($tujuan)->with('success', 'Berhasil masuk!');
    }

    public function showRegister(Request $request)
    {
        return view('pages.auth.register', ['role' => $request->query('role', 'USER')]);
    }

    public function register(Request $request)
    {
        $data = $request->validate([
            'nama_awal' => 'required|string|max:100',
            'nama_akhir' => 'nullable|string|max:100',
            'email' => 'required|email|max:255|unique:users,email',
            'password' => 'required|confirmed|min:8',
        ]);

        $role = $request->input('role') === 'PENYELENGGARA' ? 'PENYELENGGARA' : 'USER';
        $user = User::create([
            'name' => trim($data['nama_awal'] . ' ' . ($data['nama_akhir'] ?? '')),
            'email' => $data['email'],
            'password' => $data['password'],
            'role' => $role,
        ]);

        Auth::login($user);
        $request->session()->regenerate();
        $this->syncLegacyUserSession($user);

        return to_route($role === 'PENYELENGGARA' ? 'organizer.dashboard' : 'home')
            ->with('success', 'Registrasi berhasil! Selamat datang 🎉');
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return to_route('splash')->with('success', 'Kamu sudah keluar.');
    }

    private function syncLegacyUserSession(User $user): void
    {
        $name = preg_split('/\s+/', trim($user->name), 2);

        session(['user' => [
            'id' => $user->id,
            'nama_awal' => $name[0] ?? $user->name,
            'nama_akhir' => $name[1] ?? '',
            'name' => $user->name,
            'email' => $user->email,
            'nama_role' => $user->role,
        ]]);
    }
}
