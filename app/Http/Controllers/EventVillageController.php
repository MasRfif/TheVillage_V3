<?php

namespace App\Http\Controllers;

use App\Models\EventVillage;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\View\View;

class EventVillageController extends Controller
{
    public function index(): View
    {
        $this->authorizeAdmin();

        return view('pages.event-villages.index', [
            'events' => EventVillage::query()->latest('tanggal')->get(),
        ]);
    }

    public function create(): View
    {
        $this->authorizeAdmin();

        return view('pages.event-villages.create');
    }

    public function store(Request $request): RedirectResponse
    {
        $this->authorizeAdmin();

        $data = $request->validate([
            'nama_event' => ['required', 'string', 'max:255'],
            'deskripsi' => ['required', 'string'],
            'tanggal' => ['required', 'date'],
            'poster' => ['nullable', 'image', 'mimes:jpg,jpeg,png', 'max:2048'],
        ]);

        if ($request->hasFile('poster')) {
            $data['poster'] = $request->file('poster')->store('poster_event', 'public');
        }

        EventVillage::create($data);

        return to_route('event-villages.index')
            ->with('success', 'Event desa berhasil ditambahkan.');
    }

    public function show(EventVillage $eventVillage): View
    {
        $this->authorizeAdmin();

        return view('pages.event-villages.show', [
            'event' => $eventVillage,
        ]);
    }

    public function edit(EventVillage $eventVillage): View
    {
        $this->authorizeAdmin();

        return view('pages.event-villages.edit', [
            'event' => $eventVillage,
        ]);
    }

    public function update(Request $request, EventVillage $eventVillage): RedirectResponse
    {
        $this->authorizeAdmin();

        $data = $request->validate([
            'nama_event' => ['required', 'string', 'max:255'],
            'deskripsi' => ['required', 'string'],
            'tanggal' => ['required', 'date'],
            'poster' => ['nullable', 'image', 'mimes:jpg,jpeg,png', 'max:2048'],
        ]);

        if ($request->hasFile('poster')) {
            if ($eventVillage->poster) {
                Storage::disk('public')->delete($eventVillage->poster);
            }

            $data['poster'] = $request->file('poster')->store('poster_event', 'public');
        }

        $eventVillage->update($data);

        return to_route('event-villages.index')
            ->with('success', 'Event desa berhasil diperbarui.');
    }

    public function destroy(EventVillage $eventVillage): RedirectResponse
    {
        $this->authorizeAdmin();

        if ($eventVillage->poster) {
            Storage::disk('public')->delete($eventVillage->poster);
        }

        $eventVillage->delete();

        return to_route('event-villages.index')
            ->with('success', 'Event desa berhasil dihapus.');
    }

    private function authorizeAdmin(): void
    {
        abort_unless(
            Auth::check() && in_array(Auth::user()->role, ['ADMIN_BG', 'ADMIN_SYSTEM'], true),
            403
        );
    }
}