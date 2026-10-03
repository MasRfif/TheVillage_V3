<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\PageController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

// ── Halaman publik ──
Route::get('/', [PageController::class, 'splash'])->name('splash');
Route::get('/role', [PageController::class, 'role'])->name('role');
Route::get('/home', [PageController::class, 'home'])->name('home');
Route::get('/events', [PageController::class, 'events'])->name('events.index');
Route::get('/events/{id}', [PageController::class, 'eventShow'])->whereNumber('id')->name('events.show');
Route::get('/faq', [PageController::class, 'faq'])->name('faq');
Route::post('/faq', [PageController::class, 'faqSubmit'])->name('faq.submit');
Route::get('/map', [PageController::class, 'map'])->name('map');

// ── Autentikasi (demo, berbasis session) ──
Route::get('/login', [AuthController::class, 'showLogin'])->name('login');
Route::post('/login', [AuthController::class, 'login'])->name('login.submit');
Route::get('/register', [AuthController::class, 'showRegister'])->name('register');
Route::post('/register', [AuthController::class, 'register'])->name('register.submit');
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

// ── Halaman pengguna (wajib login) ──
Route::get('/profile', [UserController::class, 'profile'])->name('profile');
Route::get('/checkout/{ticketId}', [UserController::class, 'checkout'])->whereNumber('ticketId')->name('checkout.show');
Route::post('/checkout/{ticketId}', [UserController::class, 'checkoutStore'])->whereNumber('ticketId')->name('checkout.store');
Route::get('/invoice/{id}', [UserController::class, 'invoice'])->whereNumber('id')->name('invoice.show');

// ── Dashboard ──
Route::get('/admin', [DashboardController::class, 'admin'])->name('admin.dashboard');
Route::get('/organizer', [DashboardController::class, 'organizer'])->name('organizer.dashboard');
