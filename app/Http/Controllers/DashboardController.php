<?php

namespace App\Http\Controllers;

use App\Data\VillageData;

class DashboardController extends Controller
{
    public function admin()
    {
        if (!in_array(session('user.nama_role'), ['ADMIN_BG', 'ADMIN_SYSTEM'])) {
            return redirect()->route('login')->with('error', 'Halaman ini khusus admin.');
        }
        return view('pages.dashboard.admin', [
            'stats' => VillageData::dashboardStats(),
            'events' => VillageData::events(),
        ]);
    }

    public function organizer()
    {
        if (!in_array(session('user.nama_role'), ['PENYELENGGARA', 'ADMIN_BG'])) {
            return redirect()->route('login')->with('error', 'Halaman ini khusus penyelenggara.');
        }
        return view('pages.dashboard.organizer', [
            'stats' => VillageData::dashboardStats(),
            'events' => VillageData::events(),
        ]);
    }
}
