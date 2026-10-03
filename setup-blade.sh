#!/usr/bin/env bash
# =====================================================================
#  setup-blade.sh  —  The Village (Blade Template, Laravel)
#  Jalankan DARI DALAM folder proyek Laravel hasil composer create-project:
#
#     bash setup-blade.sh "/path/ke/TheVillage/UI/public/assets"
#
#  Argumen (opsional) = folder gambar asli. Kalau diisi, gambar disalin
#  ke public/assets. Kalau kosong, salin manual (lihat panduan).
# =====================================================================
set -e

if [ ! -f artisan ]; then
  echo "❌ File 'artisan' tidak ditemukan. Jalankan skrip ini di dalam folder proyek Laravel (cd the-village)."
  exit 1
fi

echo "▶ Membuat folder & menulis file..."
mkdir -p "app/Data"
cat > "app/Data/VillageData.php" <<'__TV_EOF__'
<?php

namespace App\Data;

use Carbon\Carbon;

/**
 * Data contoh The Village (diambil dari the_village.sql).
 * Dipakai sebagai pengganti database supaya fokus tugas ke Blade.
 */
class VillageData
{
    public static function rupiah($nilai): string
    {
        return ((float) $nilai) == 0 ? 'GRATIS' : 'Rp ' . number_format((float) $nilai, 0, ',', '.');
    }

    public static function tanggal($tgl, string $format = 'l, j F Y'): string
    {
        return $tgl ? Carbon::parse($tgl)->locale('id')->translatedFormat($format) : '';
    }

    public static function categories(): array
    {
        return [
            ['id' => 1, 'nama' => 'Pengajian', 'icon' => 'landmark'],
            ['id' => 2, 'nama' => 'Acara 17 Agustus', 'icon' => 'flag'],
            ['id' => 3, 'nama' => 'Kerja Bakti', 'icon' => 'sparkles'],
            ['id' => 4, 'nama' => 'Posyandu', 'icon' => 'stethoscope'],
            ['id' => 5, 'nama' => 'Bazar UMKM', 'icon' => 'shopping-cart'],
            ['id' => 6, 'nama' => 'Rapat RT/RW', 'icon' => 'message-circle'],
            ['id' => 7, 'nama' => 'Musyawarah Desa', 'icon' => 'handshake'],
            ['id' => 8, 'nama' => 'Lomba Desa', 'icon' => 'trophy'],
            ['id' => 9, 'nama' => 'Karang Taruna', 'icon' => 'users'],
            ['id' => 10, 'nama' => 'Festival Desa', 'icon' => 'party-popper'],
        ];
    }

    public static function cities(): array
    {
        return ['Bandung', 'Bekasi'];
    }

    public static function events(array $filter = []): array
    {
        $semua = [
            [
                'id' => 1, 'nama_event' => 'Festival 17 Agustus Desa', 'nama_category' => 'Acara 17 Agustus',
                'deskripsi' => 'Perayaan kemerdekaan dengan lomba warga, bazar UMKM, dan panggung hiburan.',
                'tanggal_mulai' => '2026-08-17', 'tanggal_selesai' => '2026-08-17',
                'jenis_event' => 'BERBAYAR', 'status_event' => 'PUBLISHED', 'max_peserta' => 500,
                'nama_tempat' => 'Lapangan Desa Sukamaju', 'nama_desa' => 'Desa Sukamaju', 'kabupaten' => 'Bandung',
                'map_popup_desc' => 'Kegiatan utama berada di area lapangan desa.',
                'image' => '17 agus.jpg', 'organizer_name' => 'Rafi Organizer',
                'tickets' => [
                    ['id' => 1, 'nama_tiket' => 'Reguler Festival', 'nama_kategori' => 'Reguler', 'harga' => 25000, 'qty' => 250],
                    ['id' => 2, 'nama_tiket' => 'VIP Festival', 'nama_kategori' => 'VIP', 'harga' => 75000, 'qty' => 49],
                ],
            ],
            [
                'id' => 2, 'nama_event' => 'Pengajian Akbar Jumat Berkah', 'nama_category' => 'Pengajian',
                'deskripsi' => 'Pengajian warga desa dengan penceramah lokal dan konsumsi bersama.',
                'tanggal_mulai' => '2026-06-14', 'tanggal_selesai' => '2026-06-14',
                'jenis_event' => 'GRATIS', 'status_event' => 'PUBLISHED', 'max_peserta' => 300,
                'nama_tempat' => 'Balai Desa Sukamaju', 'nama_desa' => 'Desa Sukamaju', 'kabupaten' => 'Bandung',
                'map_popup_desc' => 'Lokasi acara administratif dan musyawarah.',
                'image' => 'pengajian.avif', 'organizer_name' => 'Rafi Organizer',
                'tickets' => [
                    ['id' => 3, 'nama_tiket' => 'Tiket Pengajian Gratis', 'nama_kategori' => 'Umum', 'harga' => 0, 'qty' => 300],
                ],
            ],
            [
                'id' => 3, 'nama_event' => 'Kerja Bakti RW 02', 'nama_category' => 'Kerja Bakti',
                'deskripsi' => 'Kegiatan bersih lingkungan dan penataan taman warga.',
                'tanggal_mulai' => '2026-06-21', 'tanggal_selesai' => '2026-06-21',
                'jenis_event' => 'GRATIS', 'status_event' => 'PUBLISHED', 'max_peserta' => 200,
                'nama_tempat' => 'Aula RW 02', 'nama_desa' => 'Desa Sukamaju', 'kabupaten' => 'Bandung',
                'map_popup_desc' => 'Lokasi acara warga RW 02.',
                'image' => 'gotong royong.jpg', 'organizer_name' => 'Rafi Organizer',
                'tickets' => [
                    ['id' => 4, 'nama_tiket' => 'Tiket Kerja Bakti', 'nama_kategori' => 'Umum', 'harga' => 0, 'qty' => 199],
                ],
            ],
            [
                'id' => 4, 'nama_event' => 'Bazar UMKM Desa', 'nama_category' => 'Bazar UMKM',
                'deskripsi' => 'Bazar produk makanan, pakaian, dan kerajinan warga.',
                'tanggal_mulai' => '2026-07-05', 'tanggal_selesai' => '2026-07-05',
                'jenis_event' => 'BERBAYAR', 'status_event' => 'PUBLISHED', 'max_peserta' => 400,
                'nama_tempat' => 'Lapangan Desa Sukamaju', 'nama_desa' => 'Desa Sukamaju', 'kabupaten' => 'Bandung',
                'map_popup_desc' => 'Kegiatan utama berada di area lapangan desa.',
                'image' => 'jalan sehat.jpg', 'organizer_name' => 'Rafi Organizer',
                'tickets' => [
                    ['id' => 5, 'nama_tiket' => 'Tiket Bazar Umum', 'nama_kategori' => 'Umum', 'harga' => 10000, 'qty' => 397],
                ],
            ],
            // Dua event tambahan (contoh) supaya filter kota/kategori terlihat bekerja
            [
                'id' => 5, 'nama_event' => 'Lomba Dangdut Warga', 'nama_category' => 'Lomba Desa',
                'deskripsi' => 'Lomba menyanyi dangdut antarwarga dengan hadiah menarik.',
                'tanggal_mulai' => '2026-09-12', 'tanggal_selesai' => '2026-09-12',
                'jenis_event' => 'BERBAYAR', 'status_event' => 'PUBLISHED', 'max_peserta' => 250,
                'nama_tempat' => 'Balai Desa Citrajaya', 'nama_desa' => 'Desa Citrajaya', 'kabupaten' => 'Bekasi',
                'map_popup_desc' => 'Panggung terbuka di depan balai desa.',
                'image' => 'dangdut.jpg', 'organizer_name' => 'Rafi Organizer',
                'tickets' => [
                    ['id' => 6, 'nama_tiket' => 'Tiket Penonton', 'nama_kategori' => 'Umum', 'harga' => 15000, 'qty' => 120],
                ],
            ],
            [
                'id' => 6, 'nama_event' => 'Posyandu Balita Ceria', 'nama_category' => 'Posyandu',
                'deskripsi' => 'Pemeriksaan kesehatan balita dan penyuluhan gizi untuk orang tua.',
                'tanggal_mulai' => '2026-10-20', 'tanggal_selesai' => '2026-10-20',
                'jenis_event' => 'GRATIS', 'status_event' => 'PENDING', 'max_peserta' => 80,
                'nama_tempat' => 'Balai Desa Mekarsari', 'nama_desa' => 'Desa Mekarsari', 'kabupaten' => 'Bandung',
                'map_popup_desc' => 'Ruang pertemuan lantai satu.',
                'image' => 'image.png', 'organizer_name' => 'Rafi Organizer',
                'tickets' => [],
            ],
        ];

        $hasil = array_values(array_filter($semua, function ($e) use ($filter) {
            if (!empty($filter['published']) && $e['status_event'] !== 'PUBLISHED') return false;
            if (!empty($filter['tag']) && $filter['tag'] !== 'Semua' && $e['nama_category'] !== $filter['tag']) return false;
            if (!empty($filter['city']) && $filter['city'] !== 'Semua Kota' && $e['kabupaten'] !== $filter['city']) return false;
            if (!empty($filter['q'])) {
                $q = mb_strtolower($filter['q']);
                $gabung = mb_strtolower($e['nama_event'] . ' ' . $e['nama_tempat'] . ' ' . $e['nama_desa'] . ' ' . $e['kabupaten']);
                if (!str_contains($gabung, $q)) return false;
            }
            return true;
        }));

        return $hasil;
    }

    public static function event(int $id): ?array
    {
        foreach (self::events() as $e) {
            if ($e['id'] === $id) return $e;
        }
        return null;
    }

    /** Cari tiket + event pemiliknya */
    public static function ticket(int $ticketId): ?array
    {
        foreach (self::events() as $e) {
            foreach ($e['tickets'] as $t) {
                if ($t['id'] === $ticketId) return ['event' => $e, 'ticket' => $t];
            }
        }
        return null;
    }

    public static function faqs(): array
    {
        return [
            ['pertanyaan' => 'Apakah bisa bayar di tempat?', 'jawaban' => 'Bisa, pilih metode Bayar di Tempat saat checkout.'],
            ['pertanyaan' => 'Apakah event gratis tetap punya tiket?', 'jawaban' => 'Ya, event gratis tetap menerbitkan tiket dengan harga 0.'],
            ['pertanyaan' => 'Siapa yang memverifikasi event?', 'jawaban' => 'Event diverifikasi Admin BG atau dapat divalidasi otomatis oleh sistem.'],
        ];
    }

    public static function paymentMethods(): array
    {
        return [
            ['id' => 1, 'nama' => 'QRIS', 'tipe' => 'QRIS', 'icon' => 'wallet', 'ket' => 'QR mockup'],
            ['id' => 2, 'nama' => 'BCA Mobile Banking', 'tipe' => 'MBANKING', 'icon' => 'credit-card', 'ket' => 'Instruksi transfer'],
            ['id' => 3, 'nama' => 'Bayar di Tempat', 'tipe' => 'COD', 'icon' => 'banknote', 'ket' => 'Bayar di lokasi'],
            ['id' => 4, 'nama' => 'Mandiri Mobile Banking', 'tipe' => 'MBANKING', 'icon' => 'credit-card', 'ket' => 'Instruksi transfer'],
        ];
    }

    public static function paymentMethod(int $id): ?array
    {
        foreach (self::paymentMethods() as $m) {
            if ($m['id'] === $id) return $m;
        }
        return null;
    }

    public static function testimonials(): array
    {
        return [
            ['nama' => 'Naufal User', 'event' => 'Festival 17 Agustus Desa', 'rating' => 5, 'teks' => 'Eventnya menarik dan informasinya jelas.'],
            ['nama' => 'Naufal User', 'event' => 'Pengajian Akbar Jumat Berkah', 'rating' => 5, 'teks' => 'Pengajian mudah ditemukan lewat map.'],
        ];
    }

    public static function users(): array
    {
        // Password semua akun demo: "password"
        return [
            'user@village.test' => ['nama_awal' => 'Naufal', 'nama_akhir' => 'User', 'email' => 'user@village.test', 'nama_role' => 'USER'],
            'organizer@village.test' => ['nama_awal' => 'Rafi', 'nama_akhir' => 'Organizer', 'email' => 'organizer@village.test', 'nama_role' => 'PENYELENGGARA'],
            'admin@village.test' => ['nama_awal' => 'Admin', 'nama_akhir' => 'BG', 'email' => 'admin@village.test', 'nama_role' => 'ADMIN_BG'],
        ];
    }

    public static function myTickets(): array
    {
        return [
            ['nama_event' => 'Kerja Bakti RW 02', 'nama_tiket' => 'Tiket Kerja Bakti', 'kode_tiket' => 'TV-08AE1484-1', 'tanggal' => '2026-06-02', 'status' => 'VALID'],
            ['nama_event' => 'Bazar UMKM Desa', 'nama_tiket' => 'Tiket Bazar Umum', 'kode_tiket' => 'TV-1871675C-1', 'tanggal' => '2026-06-02', 'status' => 'BELUM_BAYAR'],
        ];
    }

    public static function transactions(): array
    {
        return [
            ['id' => 3, 'tanggal' => '2026-06-02 18:29:09', 'status' => 'GRATIS', 'total' => 0, 'nama_event' => 'Kerja Bakti RW 02', 'nama_tiket' => 'Tiket Kerja Bakti', 'jumlah' => 1, 'metode' => 3, 'kode' => 'PAY-0003'],
            ['id' => 2, 'tanggal' => '2026-06-02 18:22:06', 'status' => 'PENDING', 'total' => 20000, 'nama_event' => 'Bazar UMKM Desa', 'nama_tiket' => 'Tiket Bazar Umum', 'jumlah' => 2, 'metode' => 1, 'kode' => 'PAY-0002'],
        ];
    }

    public static function dashboardStats(): array
    {
        return [
            ['label' => 'Total Acara', 'nilai' => '6', 'sub' => '5 tayang, 1 menunggu'],
            ['label' => 'Tiket Terjual', 'nilai' => '1.130', 'sub' => 'semua acara'],
            ['label' => 'Pendapatan', 'nilai' => 'Rp 9,4 jt', 'sub' => 'estimasi'],
            ['label' => 'Pengguna', 'nilai' => '8', 'sub' => 'terdaftar'],
        ];
    }
}
__TV_EOF__
echo "  ✔ app/Data/VillageData.php"
mkdir -p "app/Http/Controllers"
cat > "app/Http/Controllers/AuthController.php" <<'__TV_EOF__'
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
__TV_EOF__
echo "  ✔ app/Http/Controllers/AuthController.php"
mkdir -p "app/Http/Controllers"
cat > "app/Http/Controllers/DashboardController.php" <<'__TV_EOF__'
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
__TV_EOF__
echo "  ✔ app/Http/Controllers/DashboardController.php"
mkdir -p "app/Http/Controllers"
cat > "app/Http/Controllers/PageController.php" <<'__TV_EOF__'
<?php

namespace App\Http\Controllers;

use App\Data\VillageData;
use Illuminate\Http\Request;

class PageController extends Controller
{
    public function splash()
    {
        $stats = [['100+', 'Event'], ['50+', 'Desa'], ['10K+', 'Pengguna']];
        return view('pages.splash', compact('stats'));
    }

    public function role()
    {
        $roles = [
            ['judul' => 'Pengguna Biasa', 'icon' => 'users', 'warna' => '#c85c00', 'to' => route('register'),
             'desc' => 'Temukan dan daftar event menarik di desamu. Beli tiket dan simpan kenangan.'],
            ['judul' => 'Penyelenggara Acara', 'icon' => 'building-2', 'warna' => '#1d4ed8', 'to' => route('register', ['role' => 'PENYELENGGARA']),
             'desc' => 'Buat dan kelola event desa. Pantau tiket, transaksi, dan tim pengelolamu.'],
        ];
        return view('pages.role', compact('roles'));
    }

    public function home()
    {
        return view('pages.home', [
            'events' => VillageData::events(['published' => true]),
            'categories' => VillageData::categories(),
            'testimonials' => VillageData::testimonials(),
        ]);
    }

    public function events(Request $request)
    {
        $tag = $request->query('tag', 'Semua');
        $city = $request->query('city', 'Semua Kota');
        $q = trim((string) $request->query('q', ''));

        $events = VillageData::events(['published' => true, 'tag' => $tag, 'city' => $city, 'q' => $q]);

        return view('pages.events.index', [
            'events' => $events,
            'categories' => VillageData::categories(),
            'cities' => VillageData::cities(),
            'tag' => $tag, 'city' => $city, 'q' => $q,
        ]);
    }

    public function eventShow(int $id)
    {
        $event = VillageData::event($id);
        abort_if(!$event, 404);

        return view('pages.events.show', [
            'event' => $event,
            'testimonials' => array_values(array_filter(
                VillageData::testimonials(), fn ($t) => $t['event'] === $event['nama_event']
            )),
        ]);
    }

    public function faq()
    {
        return view('pages.faq', [
            'faqs' => VillageData::faqs(),
            'kategori' => ['Umum', 'Tiket', 'Pembayaran', 'Event', 'Akun', 'Lainnya'],
        ]);
    }

    public function faqSubmit(Request $request)
    {
        if (!session('user')) {
            return redirect()->route('login')->with('error', 'Login dulu untuk mengirim pertanyaan.');
        }
        $request->validate(['pertanyaan' => 'required|min:5', 'kategori' => 'required']);
        return redirect()->route('faq')->with('success', 'Pertanyaan terkirim! Admin akan segera membalas.');
    }

    public function map()
    {
        return view('pages.map', ['events' => VillageData::events(['published' => true])]);
    }
}
__TV_EOF__
echo "  ✔ app/Http/Controllers/PageController.php"
mkdir -p "app/Http/Controllers"
cat > "app/Http/Controllers/UserController.php" <<'__TV_EOF__'
<?php

namespace App\Http\Controllers;

use App\Data\VillageData;
use Illuminate\Http\Request;

class UserController extends Controller
{
    private function perluLogin()
    {
        return redirect()->route('login')->with('error', 'Login dulu untuk melanjutkan.');
    }

    public function profile(Request $request)
    {
        if (!session('user')) return $this->perluLogin();

        return view('pages.user.profile', [
            'tab' => $request->query('tab', 'tickets'),
            'tickets' => VillageData::myTickets(),
            'transactions' => array_merge(session('transactions', []), VillageData::transactions()),
        ]);
    }

    public function checkout(Request $request, int $ticketId)
    {
        if (!session('user')) return $this->perluLogin();

        $found = VillageData::ticket($ticketId);
        abort_if(!$found, 404);

        return view('pages.user.checkout', [
            'event' => $found['event'],
            'ticket' => $found['ticket'],
            'qty' => max(1, (int) $request->query('qty', 1)),
            'methods' => VillageData::paymentMethods(),
            'user' => session('user'),
        ]);
    }

    public function checkoutStore(Request $request, int $ticketId)
    {
        if (!session('user')) return $this->perluLogin();

        $data = $request->validate([
            'nama_pendaftar' => 'required',
            'email' => 'required|email',
            'no_hp' => 'required',
            'catatan' => 'nullable',
            'qty' => 'required|integer|min:1',
            'id_payment_method' => 'required|integer',
        ]);

        $found = VillageData::ticket($ticketId);
        abort_if(!$found, 404);

        $semua = session('transactions', []);
        $id = 100 + count($semua) + 1;
        $total = $found['ticket']['harga'] * $data['qty'];

        array_unshift($semua, [
            'id' => $id, 'tanggal' => now()->toDateTimeString(),
            'status' => $total == 0 ? 'GRATIS' : 'PENDING', 'total' => $total,
            'nama_event' => $found['event']['nama_event'], 'nama_tiket' => $found['ticket']['nama_tiket'],
            'jumlah' => (int) $data['qty'], 'metode' => (int) $data['id_payment_method'],
            'kode' => 'PAY-' . str_pad($id, 4, '0', STR_PAD_LEFT),
            'pendaftar' => $data,
        ]);
        session(['transactions' => $semua]);

        return redirect()->route('invoice.show', $id)->with('success', 'Pendaftaran tersimpan, lanjut ke invoice');
    }

    public function invoice(int $id)
    {
        if (!session('user')) return $this->perluLogin();

        $semua = array_merge(session('transactions', []), VillageData::transactions());
        $trx = collect($semua)->firstWhere('id', $id);
        abort_if(!$trx, 404);

        return view('pages.user.invoice', [
            'trx' => $trx,
            'metode' => VillageData::paymentMethod($trx['metode']),
            'pendaftar' => $trx['pendaftar'] ?? [
                'nama_pendaftar' => trim(session('user.nama_awal') . ' ' . session('user.nama_akhir')),
                'email' => session('user.email'), 'no_hp' => '-',
            ],
        ]);
    }
}
__TV_EOF__
echo "  ✔ app/Http/Controllers/UserController.php"
mkdir -p "app/Providers"
cat > "app/Providers/AppServiceProvider.php" <<'__TV_EOF__'
<?php

namespace App\Providers;

use App\Data\VillageData;
use Illuminate\Support\Facades\Blade;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        //
    }

    public function boot(): void
    {
        // Directive Blade kustom: @rupiah($angka) dan @tanggal($tgl)
        Blade::directive('rupiah', fn ($exp) => "<?php echo \\App\\Data\\VillageData::rupiah($exp); ?>");
        Blade::directive('tanggal', fn ($exp) => "<?php echo \\App\\Data\\VillageData::tanggal($exp); ?>");
    }
}
__TV_EOF__
echo "  ✔ app/Providers/AppServiceProvider.php"
mkdir -p "routes"
cat > "routes/web.php" <<'__TV_EOF__'
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
__TV_EOF__
echo "  ✔ routes/web.php"
mkdir -p "resources/views/components"
cat > "resources/views/components/empty.blade.php" <<'__TV_EOF__'
@props(['icon' => '📭', 'title' => 'Belum ada data', 'desc' => null])

<div class="empty-state">
    <div class="empty-state-icon">{{ $icon }}</div>
    <div style="font-weight:800;color:var(--text-muted)">{{ $title }}</div>
    @if ($desc)
        <div style="font-size:.85rem;margin-top:.25rem">{{ $desc }}</div>
    @endif
</div>
__TV_EOF__
echo "  ✔ resources/views/components/empty.blade.php"
mkdir -p "resources/views/components"
cat > "resources/views/components/event-card.blade.php" <<'__TV_EOF__'
@props(['event'])

@php
    $hargaTermurah = collect($event['tickets'])->min('harga') ?? 0;
@endphp

<a href="{{ route('events.show', $event['id']) }}" class="event-card" style="display:block">
    <img src="{{ asset('assets/' . rawurlencode($event['image'])) }}" alt="{{ $event['nama_event'] }}">
    <div class="event-card-body">
        <span class="badge">{{ $event['nama_category'] }}</span>
        <div class="event-card-title" style="margin-top:.55rem">{{ $event['nama_event'] }}</div>
        <div class="event-card-meta">
            <span><i data-lucide="calendar" class="ic-12"></i> @tanggal($event['tanggal_mulai'], 'j M Y')</span>
            <span><i data-lucide="map-pin" class="ic-12"></i> {{ $event['nama_tempat'] }}</span>
        </div>
        <div class="event-card-footer">
            @if ($event['jenis_event'] === 'GRATIS')
                <span class="event-price">GRATIS</span>
            @else
                <span class="event-price">Mulai @rupiah($hargaTermurah)</span>
            @endif
            <span class="badge badge-gray">Detail</span>
        </div>
    </div>
</a>
__TV_EOF__
echo "  ✔ resources/views/components/event-card.blade.php"
mkdir -p "resources/views/components"
cat > "resources/views/components/status-badge.blade.php" <<'__TV_EOF__'
@props(['status', 'type' => 'tiket'])

@php
    $peta = [
        'tiket' => ['VALID' => 'badge-green', 'USED' => 'badge-gray', 'BAYAR_DI_TEMPAT' => 'badge', 'BELUM_BAYAR' => 'badge-red', 'CANCELLED' => 'badge-red'],
        'transaksi' => ['PAID' => 'badge-green', 'GRATIS' => 'badge-green', 'PENDING' => 'badge', 'COD_PENDING' => 'badge', 'FAILED' => 'badge-red', 'EXPIRED' => 'badge-red'],
        'event' => ['PUBLISHED' => 'badge-green', 'PENDING' => 'badge', 'REJECTED' => 'badge-red'],
    ];
    $kelas = $peta[$type][$status] ?? 'badge-gray';
@endphp

<span class="badge {{ $kelas }}">{{ str_replace('_', ' ', $status) }}</span>
__TV_EOF__
echo "  ✔ resources/views/components/status-badge.blade.php"
mkdir -p "resources/views/components"
cat > "resources/views/components/testimonial-section.blade.php" <<'__TV_EOF__'
@props(['title' => 'Testimoni', 'subtitle' => null, 'items' => []])

@php
    $rataRata = count($items) ? round(collect($items)->avg('rating'), 1) : 0;
@endphp

<section class="testimonial-section">
    <div class="section-head testimonial-head">
        <div>
            <div class="section-kicker"><i data-lucide="message-square-quote" class="ic-14"></i> Ulasan</div>
            <h2 class="section-title">{{ $title }}</h2>
            @if ($subtitle)
                <p class="section-subtitle">{{ $subtitle }}</p>
            @endif
        </div>

        @if (count($items) > 0)
            <div class="rating-summary-card">
                <div class="rating-summary-icon"><i data-lucide="star"></i></div>
                <div>
                    <div class="rating-summary-score">{{ $rataRata }}/5</div>
                    <div class="rating-summary-text">{{ count($items) }} ulasan</div>
                </div>
            </div>
        @endif
    </div>

    @forelse ($items as $t)
        @if ($loop->first)
            <div class="testimonial-grid">
        @endif

        <article class="testimonial-card">
            <div class="testimonial-quote-icon"><i data-lucide="quote" class="ic-14"></i></div>
            <div class="testimonial-top">
                <div class="testimonial-avatar"><i data-lucide="user"></i></div>
                <div>
                    <h3>{{ $t['nama'] }}</h3>
                    <p>{{ $t['event'] }}</p>
                </div>
            </div>
            <div class="rating-stars">
                @for ($i = 1; $i <= 5; $i++)
                    <i data-lucide="star" class="rating-star ic-14 {{ $i <= $t['rating'] ? 'active' : '' }}"></i>
                @endfor
            </div>
            <p class="testimonial-text">{{ $t['teks'] }}</p>
        </article>

        @if ($loop->last)
            </div>
        @endif
    @empty
        <div class="card testimonial-empty">
            <i data-lucide="message-circle"></i>
            <div>
                <h3>Belum ada testimoni</h3>
                <p>Jadilah yang pertama memberi ulasan setelah mengikuti acara.</p>
            </div>
        </div>
    @endforelse
</section>
__TV_EOF__
echo "  ✔ resources/views/components/testimonial-section.blade.php"
mkdir -p "resources/views/layouts"
cat > "resources/views/layouts/app.blade.php" <<'__TV_EOF__'
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
__TV_EOF__
echo "  ✔ resources/views/layouts/app.blade.php"
mkdir -p "resources/views/pages/auth"
cat > "resources/views/pages/auth/login.blade.php" <<'__TV_EOF__'
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
__TV_EOF__
echo "  ✔ resources/views/pages/auth/login.blade.php"
mkdir -p "resources/views/pages/auth"
cat > "resources/views/pages/auth/register.blade.php" <<'__TV_EOF__'
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
__TV_EOF__
echo "  ✔ resources/views/pages/auth/register.blade.php"
mkdir -p "resources/views/pages/dashboard"
cat > "resources/views/pages/dashboard/_stats.blade.php" <<'__TV_EOF__'
{{-- Partial kartu statistik dashboard --}}
<div class="dash-stats">
    @foreach ($stats as $s)
        <div class="stat-card">
            <div class="stat-card-label" style="margin-bottom:.4rem">{{ $s['label'] }}</div>
            <div class="stat-card-value">{{ $s['nilai'] }}</div>
            <div class="stat-card-sub">{{ $s['sub'] }}</div>
        </div>
    @endforeach
</div>
__TV_EOF__
echo "  ✔ resources/views/pages/dashboard/_stats.blade.php"
mkdir -p "resources/views/pages/dashboard"
cat > "resources/views/pages/dashboard/admin.blade.php" <<'__TV_EOF__'
@extends('layouts.app')

@section('title', 'Dashboard Admin')

@section('content')
<div class="container" style="padding-top:1.5rem;padding-bottom:3rem">
    <h1 style="font-weight:900;font-size:clamp(1.4rem,4vw,2rem);margin-bottom:.35rem">Dashboard Admin</h1>
    <p class="muted" style="margin-bottom:1.5rem;font-size:.9rem">Ringkasan sistem dan verifikasi acara The Village</p>

    @include('pages.dashboard._stats', ['stats' => $stats])

    <div class="admin-card">
        <div class="admin-card-header"><span class="admin-card-title">Verifikasi Acara</span></div>
        <div class="responsive-table">
            <table class="admin-table">
                <thead>
                    <tr><th>Acara</th><th>Kategori</th><th>Tanggal</th><th>Status</th><th>Aksi</th></tr>
                </thead>
                <tbody>
                    @forelse ($events as $e)
                        <tr>
                            <td style="font-weight:700">{{ $e['nama_event'] }}</td>
                            <td>{{ $e['nama_category'] }}</td>
                            <td>@tanggal($e['tanggal_mulai'], 'j M Y')</td>
                            <td>
                                @if ($e['status_event'] === 'PUBLISHED')
                                    <span class="admin-badge green">Terbit</span>
                                @elseif ($e['status_event'] === 'PENDING')
                                    <span class="admin-badge orange">Menunggu</span>
                                @else
                                    <span class="admin-badge red">Ditolak</span>
                                @endif
                            </td>
                            <td>
                                @if ($e['status_event'] === 'PENDING')
                                    <button type="button" class="btn btn-success btn-sm">Setujui</button>
                                    <button type="button" class="btn btn-danger btn-sm">Tolak</button>
                                @else
                                    <a href="{{ route('events.show', $e['id']) }}" class="btn btn-ghost btn-sm" style="color:#1a1714">Lihat</a>
                                @endif
                            </td>
                        </tr>
                    @empty
                        <tr><td colspan="5" style="text-align:center">Belum ada acara.</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
__TV_EOF__
echo "  ✔ resources/views/pages/dashboard/admin.blade.php"
mkdir -p "resources/views/pages/dashboard"
cat > "resources/views/pages/dashboard/organizer.blade.php" <<'__TV_EOF__'
@extends('layouts.app')

@section('title', 'Dashboard Penyelenggara')

@section('content')
<div class="container" style="padding-top:1.5rem;padding-bottom:3rem">
    <div class="section-head">
        <div>
            <h1 style="font-weight:900;font-size:clamp(1.4rem,4vw,2rem);margin-bottom:.35rem">Dashboard Penyelenggara</h1>
            <p class="muted" style="font-size:.9rem">Halo, {{ session('user.nama_awal') }}! Kelola acara dan pantau penjualan tiketmu.</p>
        </div>
        <button type="button" class="btn btn-primary"><i data-lucide="plus" class="ic-18"></i> Buat Acara</button>
    </div>

    @include('pages.dashboard._stats', ['stats' => $stats])

    <div class="admin-card">
        <div class="admin-card-header"><span class="admin-card-title">Acara Saya</span></div>
        <div class="responsive-table">
            <table class="admin-table">
                <thead>
                    <tr><th>Acara</th><th>Lokasi</th><th>Tiket</th><th>Status</th></tr>
                </thead>
                <tbody>
                    @forelse ($events as $e)
                        <tr>
                            <td style="font-weight:700">{{ $e['nama_event'] }}</td>
                            <td>{{ $e['nama_tempat'] }}</td>
                            <td>
                                @if (count($e['tickets']) > 0)
                                    {{ count($e['tickets']) }} jenis
                                @else
                                    <span class="admin-badge gray">Belum ada</span>
                                @endif
                            </td>
                            <td>
                                <span class="admin-badge {{ $e['status_event'] === 'PUBLISHED' ? 'green' : 'orange' }}">
                                    {{ $e['status_event'] === 'PUBLISHED' ? 'Terbit' : 'Menunggu' }}
                                </span>
                            </td>
                        </tr>
                    @empty
                        <tr><td colspan="4" style="text-align:center">Kamu belum membuat acara.</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
__TV_EOF__
echo "  ✔ resources/views/pages/dashboard/organizer.blade.php"
mkdir -p "resources/views/pages/events"
cat > "resources/views/pages/events/index.blade.php" <<'__TV_EOF__'
@extends('layouts.app')

@section('title', 'Semua Acara')

@section('content')
<div class="container" style="padding-top:1.5rem;padding-bottom:3rem">
    <div style="margin-bottom:1.5rem">
        <h1 style="font-weight:900;font-size:clamp(1.5rem,4vw,2.2rem);margin-bottom:.25rem">Semua Acara</h1>
        <p class="muted" style="font-size:.9rem">Temukan acara sesuai kategori dan kota</p>
    </div>

    {{-- Form pencarian & filter kota --}}
    <form action="{{ route('events.index') }}" method="GET" style="display:flex;gap:.75rem;flex-wrap:wrap;margin-bottom:1.5rem;align-items:center">
        @if ($tag !== 'Semua')
            <input type="hidden" name="tag" value="{{ $tag }}">
        @endif

        <div style="flex:1;min-width:210px;display:flex;align-items:center;gap:.5rem;background:var(--panel2);border:1px solid var(--border);border-radius:12px;padding:.55rem .9rem">
            <i data-lucide="search" class="ic-14 dim"></i>
            <input name="q" value="{{ $q }}" placeholder="Cari acara atau lokasi…" style="background:none;border:none;outline:none;color:var(--text);flex:1;font-size:.9rem">
        </div>

        <select name="city" class="input" style="width:auto;min-width:160px">
            <option value="Semua Kota">Semua Kota</option>
            @foreach ($cities as $kota)
                <option value="{{ $kota }}" @selected($city === $kota)>{{ $kota }}</option>
            @endforeach
        </select>

        <button type="submit" class="btn btn-primary btn-sm" style="min-height:44px">Terapkan</button>
    </form>

    {{-- Chip kategori --}}
    <div style="display:flex;gap:.5rem;flex-wrap:wrap;margin-bottom:1.5rem">
        <a href="{{ route('events.index', array_filter(['q' => $q, 'city' => $city !== 'Semua Kota' ? $city : null])) }}"
           class="chip-link {{ $tag === 'Semua' ? 'active' : '' }}">Semua</a>
        @foreach ($categories as $cat)
            <a href="{{ route('events.index', array_filter(['tag' => $cat['nama'], 'q' => $q, 'city' => $city !== 'Semua Kota' ? $city : null])) }}"
               class="chip-link {{ $tag === $cat['nama'] ? 'active' : '' }}">{{ $cat['nama'] }}</a>
        @endforeach
    </div>

    <div class="dim" style="font-size:.82rem;margin-bottom:1rem">{{ count($events) }} acara ditemukan</div>

    @forelse ($events as $event)
        @if ($loop->first)
            <div class="events-grid">
        @endif

        <x-event-card :event="$event" />

        @if ($loop->last)
            </div>
        @endif
    @empty
        <x-empty icon="🔍" title="Acara tidak ditemukan" desc="Coba ubah filter atau kata kunci pencarian" />
    @endforelse
</div>
@endsection
__TV_EOF__
echo "  ✔ resources/views/pages/events/index.blade.php"
mkdir -p "resources/views/pages/events"
cat > "resources/views/pages/events/show.blade.php" <<'__TV_EOF__'
@extends('layouts.app')

@section('title', $event['nama_event'])

@section('content')
<div class="container" style="padding-top:1.5rem;padding-bottom:3rem">
    <a href="{{ route('events.index') }}" class="back-link"><i data-lucide="arrow-left" class="ic-14"></i> Kembali ke daftar acara</a>

    <div class="detail-layout">
        {{-- Kiri: informasi acara --}}
        <div>
            <img class="detail-hero-img" src="{{ asset('assets/' . rawurlencode($event['image'])) }}" alt="{{ $event['nama_event'] }}">

            <div class="card" style="margin-top:1.25rem;overflow:hidden">
                <div class="detail-section">
                    <div style="display:flex;gap:.5rem;flex-wrap:wrap;margin-bottom:.75rem">
                        <span class="badge"><i data-lucide="tag" class="ic-12"></i> {{ $event['nama_category'] }}</span>
                        <x-status-badge :status="$event['status_event']" type="event" />
                        <span class="badge">{{ $event['jenis_event'] === 'BERBAYAR' ? 'Berbayar' : 'Gratis' }}</span>
                    </div>
                    <h1 style="font-weight:900;font-size:clamp(1.3rem,4vw,2rem);line-height:1.2;margin-bottom:.75rem">{{ $event['nama_event'] }}</h1>
                    @if (!empty($event['organizer_name']))
                        <p class="muted" style="font-size:.88rem">oleh <span style="color:var(--orange);font-weight:700">{{ $event['organizer_name'] }}</span></p>
                    @endif
                </div>

                <div class="detail-section">
                    <h2 class="row" style="font-weight:900;font-size:1rem;margin-bottom:.75rem">
                        <i data-lucide="calendar" class="ic-14" style="color:var(--orange)"></i> Detail Acara
                    </h2>
                    <div style="display:grid;gap:.65rem">
                        <div style="display:flex;gap:.75rem">
                            <i data-lucide="calendar" class="ic-14 dim" style="margin-top:3px"></i>
                            <div>
                                <div class="dim" style="font-size:.8rem">Tanggal</div>
                                <div style="font-weight:700;font-size:.9rem">
                                    @tanggal($event['tanggal_mulai'])
                                    @if ($event['tanggal_selesai'] !== $event['tanggal_mulai'])
                                        — @tanggal($event['tanggal_selesai'])
                                    @endif
                                </div>
                            </div>
                        </div>
                        <div style="display:flex;gap:.75rem">
                            <i data-lucide="map-pin" class="ic-14 dim" style="margin-top:3px"></i>
                            <div>
                                <div class="dim" style="font-size:.8rem">Lokasi</div>
                                <div style="font-weight:700;font-size:.9rem">{{ $event['nama_tempat'] }}</div>
                                <div class="muted" style="font-size:.82rem">{{ $event['nama_desa'] }}, {{ $event['kabupaten'] }}</div>
                            </div>
                        </div>
                        @if ($event['max_peserta'] > 0)
                            <div style="display:flex;gap:.75rem">
                                <i data-lucide="users" class="ic-14 dim" style="margin-top:3px"></i>
                                <div>
                                    <div class="dim" style="font-size:.8rem">Kapasitas</div>
                                    <div style="font-weight:700;font-size:.9rem">{{ $event['max_peserta'] }} peserta</div>
                                </div>
                            </div>
                        @endif
                    </div>
                </div>

                @if (!empty($event['deskripsi']))
                    <div class="detail-section">
                        <h2 style="font-weight:900;font-size:1rem;margin-bottom:.75rem">Tentang Acara</h2>
                        <p class="muted" style="line-height:1.7;font-size:.9rem">{{ $event['deskripsi'] }}</p>
                    </div>
                @endif

                <div class="detail-section">
                    <h2 class="row" style="font-weight:900;font-size:1rem;margin-bottom:.75rem">
                        <i data-lucide="map-pin" class="ic-14" style="color:var(--orange)"></i> Lokasi
                    </h2>
                    <div style="border-radius:12px;overflow:hidden;background:var(--panel2);height:180px">
                        <iframe src="https://www.google.com/maps?q={{ urlencode($event['nama_tempat'] . ' ' . $event['kabupaten']) }}&output=embed"
                                width="100%" height="180" style="border:0;display:block" allowfullscreen loading="lazy"
                                referrerpolicy="no-referrer-when-downgrade" title="Lokasi acara"></iframe>
                    </div>
                    <p class="muted" style="font-size:.82rem;margin-top:.5rem">{{ $event['map_popup_desc'] }}</p>
                </div>
            </div>
        </div>

        {{-- Kanan: panel tiket --}}
        <div style="display:flex;flex-direction:column;gap:1rem">
            <form class="card" style="padding:1.25rem" method="GET" action="{{ route('checkout.show', ['ticketId' => '__ID__']) }}" id="formTiket">
                <h3 style="font-weight:900;font-size:1rem;margin-bottom:1rem">Pilih Tiket</h3>

                @forelse ($event['tickets'] as $t)
                    @if ($loop->first)
                        <div style="display:grid;gap:.75rem;margin-bottom:1rem">
                    @endif

                    <label class="ticket-option">
                        <input type="radio" name="tiket" value="{{ $t['id'] }}" data-harga="{{ $t['harga'] }}" data-stok="{{ $t['qty'] }}" @checked($loop->first)>
                        <div style="display:flex;justify-content:space-between;align-items:flex-start">
                            <div>
                                <div class="ticket-name">{{ $t['nama_tiket'] }}</div>
                                <div class="dim" style="font-size:.74rem;margin-top:.15rem">{{ $t['nama_kategori'] }}</div>
                            </div>
                            <div style="text-align:right">
                                <div class="ticket-price">@rupiah($t['harga'])</div>
                                <div class="dim" style="font-size:.72rem">Sisa: {{ $t['qty'] }}</div>
                            </div>
                        </div>
                    </label>

                    @if ($loop->last)
                        </div>
                    @endif
                @empty
                    <div class="dim" style="text-align:center;padding:1.5rem 0;font-size:.88rem">Tiket belum tersedia</div>
                @endforelse

                @if (count($event['tickets']) > 0)
                    <div style="margin-bottom:1rem">
                        <label class="muted" style="font-size:.8rem;font-weight:700;display:block;margin-bottom:.5rem">Jumlah</label>
                        <div class="qty-control">
                            <button type="button" class="qty-btn" id="qtyMin">−</button>
                            <input type="hidden" name="qty" id="qtyInput" value="1">
                            <span class="qty-value" id="qtyText">1</span>
                            <button type="button" class="qty-btn" id="qtyPlus">+</button>
                        </div>
                    </div>

                    <div style="background:var(--panel2);border-radius:10px;padding:.75rem;margin-bottom:1rem;font-size:.85rem;display:flex;justify-content:space-between">
                        <span class="muted">Total</span>
                        <span id="totalText" style="font-weight:900;color:var(--orange);font-size:1rem"></span>
                    </div>

                    @if (session('user'))
                        <button type="submit" class="btn btn-primary" style="width:100%;min-height:48px">
                            <i data-lucide="shopping-cart" class="ic-18"></i> Pesan Sekarang
                        </button>
                    @else
                        <a href="{{ route('login') }}" class="btn btn-primary" style="width:100%;min-height:48px">
                            <i data-lucide="log-in" class="ic-18"></i> Masuk untuk Memesan
                        </a>
                    @endif
                @endif
            </form>

            <div class="card muted" style="padding:1.25rem;font-size:.82rem">
                <div class="row" style="font-weight:800;margin-bottom:.5rem;color:var(--text)">
                    <i data-lucide="info" class="ic-14" style="color:var(--orange)"></i> Info Pembelian
                </div>
                <div style="line-height:1.7">
                    • Tiket dikirim langsung ke profil kamu<br>
                    • Tunjukkan kode tiket saat masuk lokasi<br>
                    • Pembayaran diproses secara aman
                </div>
            </div>
        </div>
    </div>

    <div style="margin-top:2.5rem">
        <x-testimonial-section
            title="Testimoni & Rating Acara"
            subtitle="Ulasan dari warga yang sudah mengikuti atau menilai acara ini."
            :items="$testimonials" />
    </div>
</div>
@endsection

@push('scripts')
<script>
    (function () {
        var form = document.getElementById('formTiket');
        if (!form) return;
        var radios = form.querySelectorAll('input[name="tiket"]');
        if (!radios.length) return;
        var qty = 1;
        var baseAction = form.getAttribute('action');
        var qtyInput = document.getElementById('qtyInput');
        var qtyText = document.getElementById('qtyText');
        var totalText = document.getElementById('totalText');

        function terpilih() { return form.querySelector('input[name="tiket"]:checked'); }
        function rupiah(n) { return n === 0 ? 'GRATIS' : 'Rp ' + n.toLocaleString('id-ID'); }

        function render() {
            var r = terpilih();
            var stok = parseInt(r.dataset.stok, 10);
            if (qty > stok) qty = stok;
            qtyInput.value = qty;
            qtyText.textContent = qty;
            totalText.textContent = rupiah(parseInt(r.dataset.harga, 10) * qty);
            form.setAttribute('action', baseAction.replace('__ID__', r.value));
        }

        radios.forEach(function (r) { r.addEventListener('change', render); });
        document.getElementById('qtyMin').addEventListener('click', function () { qty = Math.max(1, qty - 1); render(); });
        document.getElementById('qtyPlus').addEventListener('click', function () { qty += 1; render(); });
        render();
    })();
</script>
@endpush
__TV_EOF__
echo "  ✔ resources/views/pages/events/show.blade.php"
mkdir -p "resources/views/pages"
cat > "resources/views/pages/faq.blade.php" <<'__TV_EOF__'
@extends('layouts.app')

@section('title', 'Bantuan & FAQ')

@section('content')
<div class="container" style="padding-top:2rem;padding-bottom:3rem;display:grid;gap:2rem">
    <div style="text-align:center">
        <h1 style="font-weight:900;font-size:clamp(1.5rem,4vw,2.2rem);margin-bottom:.4rem">Bantuan &amp; FAQ</h1>
        <p class="muted">Temukan jawaban untuk pertanyaan umum tentang The Village</p>
    </div>

    <div style="display:grid;gap:.65rem">
        @forelse ($faqs as $faq)
            <div class="faq-item">
                <button type="button" class="faq-q">
                    <span>{{ $faq['pertanyaan'] }}</span>
                    <i data-lucide="chevron-down" class="ic-18 muted"></i>
                </button>
                <div class="faq-a">{{ $faq['jawaban'] }}</div>
            </div>
        @empty
            <x-empty title="Belum ada FAQ tersedia" />
        @endforelse
    </div>

    <div class="card" style="padding:1.75rem;max-width:600px;margin:0 auto;width:100%">
        <h3 style="font-weight:900;font-size:1.1rem;margin-bottom:.35rem">Punya pertanyaan lain?</h3>
        <p class="muted" style="font-size:.88rem;margin-bottom:1.25rem">Pertanyaanmu akan dijawab oleh tim admin.</p>

        <form action="{{ route('faq.submit') }}" method="POST" style="display:grid;gap:1rem">
            @csrf
            <div>
                <label class="input-label">Kategori</label>
                <select name="kategori" class="input">
                    @foreach ($kategori as $k)
                        <option value="{{ $k }}" @selected(old('kategori') === $k)>{{ $k }}</option>
                    @endforeach
                </select>
            </div>
            <div>
                <label class="input-label">Pertanyaan</label>
                <textarea name="pertanyaan" class="input" rows="3" required placeholder="Tulis pertanyaanmu di sini…" style="resize:vertical">{{ old('pertanyaan') }}</textarea>
                @error('pertanyaan') <div class="err">{{ $message }}</div> @enderror
            </div>
            <button type="submit" class="btn btn-primary" style="justify-self:start">
                <i data-lucide="send" class="ic-14"></i> Kirim Pertanyaan
            </button>
        </form>
    </div>
</div>
@endsection
__TV_EOF__
echo "  ✔ resources/views/pages/faq.blade.php"
mkdir -p "resources/views/pages"
cat > "resources/views/pages/home.blade.php" <<'__TV_EOF__'
@extends('layouts.app')

@section('title', 'Beranda')

@section('content')
<div class="container" style="padding-top:1.5rem">

    {{-- Hero --}}
    <div class="hero-section" style="margin-bottom:2rem">
        <div class="hero-content">
            <div class="row" style="margin-bottom:1rem">
                <i data-lucide="flame" class="ic-14" style="color:var(--orange)"></i>
                <span style="font-size:.82rem;font-weight:800;color:var(--orange);letter-spacing:.1em;text-transform:uppercase">Acara Desa Terkini</span>
            </div>
            <h1 class="hero-title">Temukan Acara <span>Terbaik</span> di Desamu</h1>
            <p class="muted" style="margin-top:.75rem;max-width:460px;font-size:1rem">
                Acara warga, bazar UMKM, pengajian, kerja bakti, dan kegiatan desa lainnya.
            </p>

            <form action="{{ route('events.index') }}" method="GET" style="display:flex;gap:.5rem;margin-top:1.5rem;max-width:420px">
                <div style="flex:1;display:flex;align-items:center;gap:.5rem;background:rgba(255,255,255,.08);border:1px solid rgba(200,92,0,.25);border-radius:12px;padding:.6rem .9rem">
                    <i data-lucide="search" class="ic-14 dim"></i>
                    <input name="q" placeholder="Cari acara…" style="background:none;border:none;outline:none;color:var(--text);flex:1;font-size:.9rem">
                </div>
                <button type="submit" class="btn btn-primary">Cari</button>
            </form>
        </div>
    </div>

    {{-- Kategori --}}
    <section style="margin-bottom:2rem">
        <div class="section-head"><h2 class="section-title">Kategori Acara</h2></div>
        <div class="category-strip">
            <a href="{{ route('events.index') }}" class="cat-chip active">
                <span class="cat-icon"><i data-lucide="tag" class="ic-18"></i></span>
                <span>Semua</span>
            </a>
            @foreach ($categories as $cat)
                <a href="{{ route('events.index', ['tag' => $cat['nama']]) }}" class="cat-chip">
                    <span class="cat-icon"><i data-lucide="{{ $cat['icon'] }}" class="ic-18"></i></span>
                    <span>{{ $cat['nama'] }}</span>
                </a>
            @endforeach
        </div>
    </section>

    {{-- Acara mendatang --}}
    <section style="margin-bottom:3rem">
        <div class="section-head">
            <h2 class="section-title">Acara Mendatang</h2>
            <div class="row" style="flex-wrap:wrap;justify-content:flex-end">
                <button type="button" class="scroll-nav-btn" data-target="#eventScroll" data-scroll="-320" aria-label="Sebelumnya">
                    <i data-lucide="arrow-left" class="ic-14"></i>
                </button>
                <button type="button" class="scroll-nav-btn" data-target="#eventScroll" data-scroll="320" aria-label="Berikutnya">
                    <i data-lucide="arrow-right" class="ic-14"></i>
                </button>
                <a href="{{ route('events.index') }}" class="row" style="color:var(--orange);font-weight:800;font-size:.88rem">
                    Lihat semua <i data-lucide="arrow-right" class="ic-14"></i>
                </a>
            </div>
        </div>

        @if (count($events) > 0)
            <div class="event-scroll" id="eventScroll">
                @foreach ($events as $event)
                    <x-event-card :event="$event" />
                @endforeach
            </div>
        @else
            <x-empty title="Belum ada acara" desc="Acara akan segera hadir" />
        @endif
    </section>

    {{-- Testimoni --}}
    <x-testimonial-section
        title="Testimoni Warga"
        subtitle="Rating dan ulasan yang masuk dari peserta acara desa."
        :items="$testimonials" />

    {{-- CTA --}}
    <div class="card" style="padding:2rem;margin-bottom:3rem;display:flex;align-items:center;justify-content:space-between;gap:1.5rem;flex-wrap:wrap;border-radius:16px">
        <div>
            <h3 style="font-weight:900;font-size:1.3rem;margin-bottom:.4rem">Punya acara desa yang ingin dipromosikan?</h3>
            <p class="muted" style="font-size:.9rem">Daftarkan sebagai penyelenggara dan kelola acaramu dengan mudah.</p>
        </div>
        <a href="{{ route('register', ['role' => 'PENYELENGGARA']) }}" class="btn btn-primary">
            Daftar Penyelenggara <i data-lucide="arrow-right" class="ic-18"></i>
        </a>
    </div>
</div>
@endsection
__TV_EOF__
echo "  ✔ resources/views/pages/home.blade.php"
mkdir -p "resources/views/pages"
cat > "resources/views/pages/map.blade.php" <<'__TV_EOF__'
@extends('layouts.app')

@section('title', 'Peta Acara')

@section('content')
<div class="container" style="padding-top:1.5rem;padding-bottom:3rem">
    <h1 style="font-weight:900;font-size:clamp(1.4rem,4vw,2rem);margin-bottom:.35rem">Peta Acara</h1>
    <p class="muted" style="margin-bottom:1.5rem;font-size:.9rem">Temukan event berdasarkan lokasi di sekitarmu</p>

    <div style="display:grid;gap:1.25rem">
        <div style="border-radius:16px;overflow:hidden;border:1px solid var(--border);height:400px">
            <iframe src="https://www.google.com/maps?q=Bandung,+Jawa+Barat&output=embed"
                    width="100%" height="400" style="border:0;display:block" allowfullscreen loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade" title="Peta Bandung"></iframe>
        </div>

        <div>
            <h2 style="font-weight:900;font-size:1.1rem;margin-bottom:1rem">Titik Lokasi Event ({{ count($events) }})</h2>
            <div style="display:grid;gap:.65rem">
                @forelse ($events as $ev)
                    <a href="{{ route('events.show', $ev['id']) }}" class="card card-glow" style="padding:1rem;display:flex;gap:.85rem;align-items:center">
                        <div style="width:40px;height:40px;border-radius:50%;background:var(--orange-dim);color:var(--orange);display:grid;place-items:center;flex-shrink:0">
                            <i data-lucide="map-pin" class="ic-18"></i>
                        </div>
                        <div style="flex:1;min-width:0">
                            <div style="font-weight:800;font-size:.92rem">{{ $ev['nama_event'] }}</div>
                            <div class="muted" style="font-size:.78rem;display:flex;gap:.75rem;margin-top:.2rem;flex-wrap:wrap">
                                <span class="row"><i data-lucide="map-pin" class="ic-12"></i> {{ $ev['nama_tempat'] }}</span>
                                <span class="row"><i data-lucide="calendar" class="ic-12"></i> @tanggal($ev['tanggal_mulai'], 'j M Y')</span>
                            </div>
                        </div>
                        <span class="badge">{{ $ev['nama_category'] }}</span>
                    </a>
                @empty
                    <x-empty title="Belum ada event di peta" />
                @endforelse
            </div>
        </div>
    </div>
</div>
@endsection
__TV_EOF__
echo "  ✔ resources/views/pages/map.blade.php"
mkdir -p "resources/views/pages"
cat > "resources/views/pages/role.blade.php" <<'__TV_EOF__'
@extends('layouts.app')

@section('title', 'Pilih Peran')
@section('fullscreen', true)

@section('content')
<div class="fullscreen-center">
    <div style="width:min(700px,100%);text-align:center">
        <a href="{{ route('splash') }}" class="back-link"><i data-lucide="arrow-left" class="ic-14"></i> Kembali</a>

        <h1 style="font-size:clamp(1.5rem,5vw,2.5rem);font-weight:900;margin-bottom:.5rem">Bergabung sebagai apa?</h1>
        <p class="muted" style="margin-bottom:2rem">Pilih peranmu di The Village</p>

        <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(260px,1fr));gap:1rem">
            @foreach ($roles as $r)
                <a href="{{ $r['to'] }}" class="card card-glow" style="padding:2rem 1.5rem;display:block;transition:all .2s">
                    <div style="width:72px;height:72px;border-radius:50%;background:{{ $r['warna'] }}22;color:{{ $r['warna'] }};display:grid;place-items:center;margin:0 auto 1rem">
                        <i data-lucide="{{ $r['icon'] }}" class="ic-36"></i>
                    </div>
                    <div style="font-weight:900;font-size:1.15rem;margin-bottom:.5rem">{{ $r['judul'] }}</div>
                    <div class="muted" style="font-size:.85rem;line-height:1.6">{{ $r['desc'] }}</div>
                </a>
            @endforeach
        </div>

        <p class="dim" style="margin-top:1.5rem;font-size:.85rem">
            Sudah punya akun?
            <a href="{{ route('login') }}" style="color:var(--orange);font-weight:700">Masuk di sini</a>
        </p>
    </div>
</div>
@endsection
__TV_EOF__
echo "  ✔ resources/views/pages/role.blade.php"
mkdir -p "resources/views/pages"
cat > "resources/views/pages/splash.blade.php" <<'__TV_EOF__'
@extends('layouts.app')

@section('title', 'Selamat Datang')
@section('fullscreen', true)

@section('content')
<div class="splash-page" style="position:relative">
    <div class="splash-bg"></div>

    <div class="splash-wrap">
        <span style="font-size:.78rem;font-weight:800;letter-spacing:.2em;color:var(--text-dim);text-transform:uppercase;background:var(--panel2);padding:.35rem 1rem;border-radius:999px;border:1px solid var(--border)">
            Platform Acara Desa
        </span>
        <h1 class="splash-title">The Village</h1>
        <p class="splash-tagline">
            Jembatan Informasi Acara Desa.<br>Satu Desa, Ribuan Cerita.
        </p>
        <p class="splash-copy">Temukan, daftar, dan nikmati event desa terbaik di sekitarmu.</p>

        <div style="display:flex;flex-direction:column;align-items:center;gap:.75rem;margin-top:2rem">
            <a href="{{ route('home') }}" class="btn btn-primary" style="min-width:220px;font-size:1rem;min-height:50px;border-radius:12px">
                Mulai Jelajahi <i data-lucide="arrow-right" class="ic-18"></i>
            </a>
            @if (session('user'))
                <a href="{{ route('profile') }}" class="dim row" style="font-size:.88rem">
                    <i data-lucide="user" class="ic-14"></i> Halo, {{ session('user.nama_awal') }} — lihat tiketmu
                </a>
            @else
                <a href="{{ route('login') }}" class="dim row" style="font-size:.88rem">
                    <i data-lucide="log-in" class="ic-14"></i> Sudah punya akun? Masuk
                </a>
            @endif
        </div>
    </div>

    <div style="position:absolute;bottom:1.5rem;left:0;right:0;display:flex;justify-content:center;gap:2rem">
        @foreach ($stats as $stat)
            <div style="text-align:center">
                <div style="font-weight:900;color:var(--orange);font-size:1rem">{{ $stat[0] }}</div>
                <div class="dim" style="font-size:.72rem">{{ $stat[1] }}</div>
            </div>
        @endforeach
    </div>
</div>
@endsection
__TV_EOF__
echo "  ✔ resources/views/pages/splash.blade.php"
mkdir -p "resources/views/pages/user"
cat > "resources/views/pages/user/checkout.blade.php" <<'__TV_EOF__'
@extends('layouts.app')

@section('title', 'Pendaftaran Peserta')

@section('content')
<div class="container" style="padding-top:1.5rem;padding-bottom:3rem">
    <a href="{{ route('events.show', $event['id']) }}" class="back-link"><i data-lucide="arrow-left" class="ic-14"></i> Kembali</a>

    <div class="checkout-steps" style="margin-bottom:1.25rem">
        <div class="checkout-step active">1. Pendaftaran</div>
        <div class="checkout-step">2. Invoice</div>
        <div class="checkout-step">3. Tiket Saya</div>
    </div>

    <div class="checkout-layout">
        <form class="card" action="{{ route('checkout.store', $ticket['id']) }}" method="POST" style="padding:1.25rem;display:grid;gap:1rem">
            @csrf
            <input type="hidden" name="qty" value="{{ $qty }}">

            <div>
                <h1 style="font-weight:900;font-size:clamp(1.35rem,4vw,2rem);margin-bottom:.35rem">Pendaftaran Peserta</h1>
                <p class="muted" style="font-size:.9rem">Isi data peserta dulu sebelum masuk ke invoice pembayaran.</p>
            </div>

            <div class="form-grid-2">
                <div>
                    <label class="input-label"><i data-lucide="user" class="ic-12"></i> Nama Pendaftar</label>
                    <input class="input" name="nama_pendaftar" required
                           value="{{ old('nama_pendaftar', trim($user['nama_awal'] . ' ' . $user['nama_akhir'])) }}">
                    @error('nama_pendaftar') <div class="err">{{ $message }}</div> @enderror
                </div>
                <div>
                    <label class="input-label"><i data-lucide="mail" class="ic-12"></i> Email</label>
                    <input class="input" type="email" name="email" required value="{{ old('email', $user['email']) }}">
                    @error('email') <div class="err">{{ $message }}</div> @enderror
                </div>
                <div>
                    <label class="input-label"><i data-lucide="phone" class="ic-12"></i> Nomor HP</label>
                    <input class="input" name="no_hp" required value="{{ old('no_hp') }}" placeholder="08xxxxxxxxxx">
                    @error('no_hp') <div class="err">{{ $message }}</div> @enderror
                </div>
                <div>
                    <label class="input-label"><i data-lucide="clipboard-list" class="ic-12"></i> Catatan</label>
                    <input class="input" name="catatan" value="{{ old('catatan') }}" placeholder="Opsional">
                </div>
            </div>

            <div>
                <label class="input-label">Metode Pembayaran</label>
                <div class="payment-method-grid">
                    @foreach ($methods as $m)
                        <label class="payment-method-card">
                            <input type="radio" name="id_payment_method" value="{{ $m['id'] }}" data-nama="{{ $m['nama'] }}" @checked(old('id_payment_method', $methods[0]['id']) == $m['id'])>
                            <span><i data-lucide="{{ $m['icon'] }}" class="ic-18"></i></span>
                            <b>{{ $m['nama'] }}</b>
                            <small>{{ $m['ket'] }}</small>
                        </label>
                    @endforeach
                </div>
            </div>

            <button type="submit" class="btn btn-primary" style="width:100%;min-height:48px">Lanjut ke Invoice</button>
        </form>

        <aside class="card checkout-summary">
            <img src="{{ asset('assets/' . rawurlencode($event['image'])) }}" alt="{{ $event['nama_event'] }}">
            <div style="padding:1rem">
                <h2 style="font-weight:900;font-size:1rem;margin-bottom:.25rem">{{ $event['nama_event'] }}</h2>
                <p class="muted" style="font-size:.82rem;margin-bottom:1rem">{{ $ticket['nama_tiket'] }} × {{ $qty }}</p>
                <div class="summary-row"><span>Metode</span><b id="ringkasMetode">{{ $methods[0]['nama'] }}</b></div>
                <div class="summary-row"><span>Total</span><b class="orange">@rupiah($ticket['harga'] * $qty)</b></div>
            </div>
        </aside>
    </div>
</div>
@endsection

@push('scripts')
<script>
    document.querySelectorAll('input[name="id_payment_method"]').forEach(function (r) {
        r.addEventListener('change', function () {
            document.getElementById('ringkasMetode').textContent = r.dataset.nama;
        });
    });
</script>
@endpush
__TV_EOF__
echo "  ✔ resources/views/pages/user/checkout.blade.php"
mkdir -p "resources/views/pages/user"
cat > "resources/views/pages/user/invoice.blade.php" <<'__TV_EOF__'
@extends('layouts.app')

@section('title', 'Invoice #' . $trx['id'])

@section('content')
@php
    $lunas = in_array($trx['status'], ['PAID', 'GRATIS', 'COD_PAID']);
    $isQris = $metode['tipe'] === 'QRIS';
    $isCod = $metode['tipe'] === 'COD';
@endphp

<div class="container" style="padding-top:1.5rem;padding-bottom:3rem">
    <a href="{{ route('profile', ['tab' => 'transactions']) }}" class="back-link">
        <i data-lucide="arrow-left" class="ic-14"></i> Kembali ke transaksi
    </a>

    <div class="checkout-steps" style="margin-bottom:1.25rem">
        <div class="checkout-step done">1. Pendaftaran</div>
        <div class="checkout-step active">2. Invoice</div>
        <div class="checkout-step">3. Tiket Saya</div>
    </div>

    <div class="invoice-card">
        <div class="invoice-head">
            <div>
                <div class="footer-brand">The Village</div>
                <h1>Invoice #{{ $trx['id'] }}</h1>
                <p>@tanggal($trx['tanggal'])</p>
            </div>
            <span class="badge {{ $lunas ? 'badge-green' : ($isCod ? '' : 'badge-red') }}">{{ $trx['status'] }}</span>
        </div>

        <div class="invoice-grid">
            <section>
                <h3>Data Pendaftar</h3>
                <div class="invoice-box">
                    <div><span>Nama</span><b>{{ $pendaftar['nama_pendaftar'] ?? '-' }}</b></div>
                    <div><span>Email</span><b>{{ $pendaftar['email'] ?? '-' }}</b></div>
                    <div><span>No HP</span><b>{{ $pendaftar['no_hp'] ?? '-' }}</b></div>
                </div>

                <h3>Ringkasan Tiket</h3>
                <div class="invoice-box">
                    <div><span>Acara</span><b>{{ $trx['nama_event'] }}</b></div>
                    <div><span>Tiket</span><b>{{ $trx['nama_tiket'] }} × {{ $trx['jumlah'] }}</b></div>
                    <div><span>Total</span><b class="orange">@rupiah($trx['total'])</b></div>
                </div>
            </section>

            <section>
                <h3>Instruksi Pembayaran</h3>
                <div class="payment-instruction">
                    @if ($trx['total'] == 0)
                        <div class="free-invoice">
                            <i data-lucide="circle-check" class="ic-44"></i> Tiket gratis, tidak perlu pembayaran.
                        </div>
                    @elseif ($isQris)
                        <div>
                            <div class="mock-qris" style="margin:0 auto"><span>QRIS</span></div>
                            <p>Scan QRIS mockup ini lalu bayar sebesar <b>@rupiah($trx['total'])</b>.</p>
                            <small>Kode pembayaran: {{ $trx['kode'] }}</small>
                        </div>
                    @elseif ($isCod)
                        <div>
                            <i data-lucide="banknote" class="ic-44" style="margin:0 auto"></i>
                            <p>Bayar langsung di lokasi acara. Bawa invoice ini sebagai bukti pemesanan.</p>
                            <small>Kode pembayaran: {{ $trx['kode'] }}</small>
                        </div>
                    @else
                        <div>
                            <i data-lucide="credit-card" class="ic-44" style="margin:0 auto"></i>
                            <p>Transfer sebesar <b>@rupiah($trx['total'])</b> melalui {{ $metode['nama'] }}.</p>
                            <div class="virtual-account">8808-{{ str_replace('PAY-', '', $trx['kode']) }}</div>
                            <small>Kode pembayaran: {{ $trx['kode'] }}</small>
                        </div>
                    @endif
                </div>
            </section>
        </div>

        <div class="invoice-actions no-print">
            <button type="button" class="btn btn-ghost" onclick="window.print()">
                <i data-lucide="printer" class="ic-18"></i> Cetak Invoice
            </button>
            <a href="{{ route('profile') }}" class="btn btn-primary">
                <i data-lucide="ticket" class="ic-18"></i> Lihat Tiket Saya
            </a>
        </div>
    </div>
</div>
@endsection
__TV_EOF__
echo "  ✔ resources/views/pages/user/invoice.blade.php"
mkdir -p "resources/views/pages/user"
cat > "resources/views/pages/user/profile.blade.php" <<'__TV_EOF__'
@extends('layouts.app')

@section('title', 'Profil Saya')

@section('content')
<div class="container" style="padding-top:2rem;padding-bottom:3rem">

    {{-- Header profil --}}
    <div class="card" style="padding:1.5rem;margin-bottom:1.5rem;display:flex;gap:1.25rem;align-items:center;flex-wrap:wrap">
        <div style="width:72px;height:72px;border-radius:50%;background:var(--orange);color:#fff;display:grid;place-items:center;font-size:1.8rem;font-weight:900;flex-shrink:0">
            {{ strtoupper(substr(session('user.nama_awal'), 0, 1)) }}
        </div>
        <div style="flex:1">
            <h2 style="font-weight:900;font-size:1.3rem;margin-bottom:.25rem">{{ session('user.nama_awal') }} {{ session('user.nama_akhir') }}</h2>
            <div class="muted" style="font-size:.88rem">{{ session('user.email') }}</div>
            <span class="badge" style="margin-top:.5rem">{{ session('user.nama_role') }}</span>
        </div>
        <div style="display:flex;gap:1.5rem">
            <div style="text-align:center">
                <div style="font-weight:900;font-size:1.4rem;color:var(--orange)">{{ count($tickets) }}</div>
                <div class="dim" style="font-size:.75rem">Tiket</div>
            </div>
            <div style="text-align:center">
                <div style="font-weight:900;font-size:1.4rem;color:var(--orange)">{{ count($transactions) }}</div>
                <div class="dim" style="font-size:.75rem">Transaksi</div>
            </div>
        </div>
    </div>

    {{-- Tab (berupa link ?tab=...) --}}
    <div class="profile-tabs" style="margin-bottom:1.25rem">
        <a href="{{ route('profile', ['tab' => 'tickets']) }}" class="profile-tab {{ $tab === 'tickets' ? 'active' : '' }}">
            <i data-lucide="ticket" class="ic-14" style="display:inline-block;vertical-align:-2px"></i> Tiket Saya
        </a>
        <a href="{{ route('profile', ['tab' => 'transactions']) }}" class="profile-tab {{ $tab === 'transactions' ? 'active' : '' }}">
            <i data-lucide="bell" class="ic-14" style="display:inline-block;vertical-align:-2px"></i> Transaksi
        </a>
    </div>

    @if ($tab === 'tickets')
        @forelse ($tickets as $t)
            @if ($loop->first)
                <div style="display:grid;gap:.75rem">
            @endif

            @include('partials.ticket-card', ['t' => $t])

            @if ($loop->last)
                </div>
            @endif
        @empty
            <x-empty icon="🎫" title="Belum ada tiket" desc="Beli tiket event dan tiketmu muncul di sini" />
        @endforelse
    @else
        @forelse ($transactions as $trx)
            @if ($loop->first)
                <div class="card" style="overflow:hidden">
                    <div class="responsive-table">
                        <table class="profile-table">
                            <thead>
                                <tr><th>ID</th><th>Tanggal</th><th>Total</th><th>Status</th><th>Aksi</th></tr>
                            </thead>
                            <tbody>
            @endif

                                <tr>
                                    <td style="font-weight:700">#{{ $trx['id'] }}</td>
                                    <td>@tanggal($trx['tanggal'], 'j M Y')</td>
                                    <td style="font-weight:700;color:var(--orange)">@rupiah($trx['total'])</td>
                                    <td><x-status-badge :status="$trx['status']" type="transaksi" /></td>
                                    <td>
                                        <a href="{{ route('invoice.show', $trx['id']) }}" class="btn btn-ghost btn-sm">
                                            <i data-lucide="receipt-text" class="ic-14"></i> Invoice
                                        </a>
                                    </td>
                                </tr>

            @if ($loop->last)
                            </tbody>
                        </table>
                    </div>
                </div>
            @endif
        @empty
            <x-empty icon="📋" title="Belum ada transaksi" />
        @endforelse
    @endif
</div>
@endsection
__TV_EOF__
echo "  ✔ resources/views/pages/user/profile.blade.php"
mkdir -p "resources/views/partials"
cat > "resources/views/partials/flash.blade.php" <<'__TV_EOF__'
@if (session('success'))
    <div class="toast success">{{ session('success') }}</div>
@endif

@if (session('error'))
    <div class="toast error">{{ session('error') }}</div>
@endif
__TV_EOF__
echo "  ✔ resources/views/partials/flash.blade.php"
mkdir -p "resources/views/partials"
cat > "resources/views/partials/footer.blade.php" <<'__TV_EOF__'
<footer class="footer">
    <div class="container">
        <div class="footer-grid">
            <div>
                <div class="footer-brand">The Village</div>
                <p class="footer-text">
                    Jembatan Informasi Acara Desa.<br>
                    Temukan, daftar, dan nikmati event desa terbaik di sekitarmu.
                </p>
            </div>
            <div>
                <div class="footer-head">Jelajahi</div>
                <a class="footer-link" href="{{ route('home') }}">Beranda</a>
                <a class="footer-link" href="{{ route('events.index') }}">Semua Acara</a>
                <a class="footer-link" href="{{ route('map') }}">Peta Acara</a>
            </div>
            <div>
                <div class="footer-head">Akun</div>
                <a class="footer-link" href="{{ route('login') }}">Masuk</a>
                <a class="footer-link" href="{{ route('role') }}">Daftar</a>
                <a class="footer-link" href="{{ route('profile') }}">Tiket Saya</a>
            </div>
            <div>
                <div class="footer-head">Bantuan</div>
                <a class="footer-link" href="{{ route('faq') }}">FAQ</a>
                <a class="footer-link" href="{{ route('register', ['role' => 'PENYELENGGARA']) }}">Jadi Penyelenggara</a>
            </div>
        </div>
        <div class="footer-bottom">© {{ date('Y') }} The Village. Semua hak dilindungi.</div>
    </div>
</footer>
__TV_EOF__
echo "  ✔ resources/views/partials/footer.blade.php"
mkdir -p "resources/views/partials"
cat > "resources/views/partials/navbar.blade.php" <<'__TV_EOF__'
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
__TV_EOF__
echo "  ✔ resources/views/partials/navbar.blade.php"
mkdir -p "resources/views/partials"
cat > "resources/views/partials/ticket-card.blade.php" <<'__TV_EOF__'
{{-- Partial: satu baris tiket milik pengguna. Dipakai lewat @include('partials.ticket-card', ['t' => $t]) --}}
<div class="card" style="padding:1.1rem;display:flex;gap:1rem;flex-wrap:wrap;align-items:center">
    <div style="flex:1;min-width:200px">
        <div style="font-weight:800;font-size:.95rem;margin-bottom:.4rem">{{ $t['nama_event'] }}</div>
        <div class="muted" style="display:flex;gap:1rem;flex-wrap:wrap;font-size:.78rem">
            <span class="row"><i data-lucide="ticket" class="ic-12"></i> {{ $t['nama_tiket'] }}</span>
            <span class="row"><i data-lucide="hash" class="ic-12"></i> {{ $t['kode_tiket'] }}</span>
            <span class="row"><i data-lucide="calendar" class="ic-12"></i> @tanggal($t['tanggal'], 'j M Y')</span>
        </div>
    </div>
    <x-status-badge :status="$t['status']" type="tiket" />
</div>
__TV_EOF__
echo "  ✔ resources/views/partials/ticket-card.blade.php"
mkdir -p "public/css"
cat > "public/css/app.css" <<'__TV_EOF__'
/* ==========================================================
   The Village - app.css
   Dari src/index.css versi React (directive @tailwind/@layer dihapus)
   + mini-reset pengganti Tailwind preflight + helper untuk Blade
   ========================================================== */
h1,h2,h3,h4,h5,h6,p,figure,blockquote,dl,dd{margin:0}
ul,ol{list-style:none;margin:0;padding:0}
table{border-collapse:collapse}
button{background:transparent;border:0;padding:0;color:inherit;cursor:pointer}
svg{display:block}
.lucide{width:16px;height:16px;flex-shrink:0}
.ic-12{width:12px;height:12px}.ic-14{width:14px;height:14px}.ic-18{width:18px;height:18px}
.ic-36{width:36px;height:36px}.ic-44{width:44px;height:44px}
.row{display:flex;align-items:center;gap:.5rem}
.muted{color:var(--text-muted)}.dim{color:var(--text-dim)}
.hidden{display:none!important}


  :root {
    --bg: #191411;
    --panel: #25211f;
    --panel2: #2e2825;
    --border: rgba(200, 92, 0, 0.15);
    --orange: #c85c00;
    --orange-light: #e06a00;
    --orange-dim: rgba(200, 92, 0, 0.12);
    --text: #f0e8e0;
    --text-muted: #a89888;
    --text-dim: #7a6a60;
    --danger: #e05050;
    --success: #4caf78;
    --admin-bg: #f4f5f7;
    --admin-sidebar: #1e1a17;
    --admin-panel: #ffffff;
    --admin-text: #1a1714;
    --admin-muted: #6b7280;
  }
  html,
  body,
  #root {
    min-height: 100%;
    width: 100%;
    overflow-x: hidden;
  }
  body {
    margin: 0;
    background: var(--bg);
    color: var(--text);
    font-family:
      "Inter",
      system-ui,
      -apple-system,
      sans-serif;
    font-size: 15px;
    line-height: 1.6;
  }
  * {
    box-sizing: border-box;
  }
  button,
  input,
  select,
  textarea {
    font: inherit;
  }
  img {
    display: block;
    max-width: 100%;
  }
  a {
    color: inherit;
    text-decoration: none;
  }
  h1,
  h2,
  h3,
  h4,
  h5 {
    line-height: 1.2;
  }



  /* ── Layout ── */
  .container {
    width: 100%;
    max-width: 1200px;
    margin-inline: auto;
    padding-inline: 1rem;
  }
  @media (min-width: 640px) {
    .container {
      padding-inline: 1.5rem;
    }
  }

  /* ── Buttons ── */
  .btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
    min-height: 42px;
    border-radius: 10px;
    padding: 0.6rem 1.2rem;
    font-weight: 700;
    font-size: 0.9rem;
    transition: all 0.18s;
    border: none;
    cursor: pointer;
    white-space: nowrap;
  }
  .btn-primary {
    background: var(--orange);
    color: white;
  }
  .btn-primary:hover {
    background: var(--orange-light);
    transform: translateY(-1px);
  }
  .btn-ghost {
    background: var(--panel2);
    color: var(--text);
    border: 1px solid var(--border);
  }
  .btn-ghost:hover {
    background: var(--panel);
    border-color: var(--orange);
  }
  .btn-danger {
    background: var(--danger);
    color: white;
  }
  .btn-sm {
    min-height: 34px;
    padding: 0.4rem 0.85rem;
    font-size: 0.82rem;
    border-radius: 8px;
  }
  .btn-success {
    background: var(--success);
    color: white;
  }

  /* ── Forms ── */
  .input {
    width: 100%;
    min-height: 44px;
    background: var(--panel2);
    border: 1px solid var(--border);
    border-radius: 10px;
    color: var(--text);
    padding: 0.65rem 1rem;
    outline: none;
    transition:
      border-color 0.15s,
      box-shadow 0.15s;
  }
  .input:focus {
    border-color: var(--orange);
    box-shadow: 0 0 0 3px rgba(200, 92, 0, 0.15);
  }
  .input::placeholder {
    color: var(--text-dim);
  }
  .input-label {
    display: block;
    font-size: 0.82rem;
    font-weight: 700;
    color: var(--text-muted);
    margin-bottom: 0.4rem;
    letter-spacing: 0.03em;
    text-transform: uppercase;
  }
  select.input {
    cursor: pointer;
  }

  /* ── Cards ── */
  .card {
    background: var(--panel);
    border: 1px solid var(--border);
    border-radius: 14px;
  }
  .card-glow:hover {
    border-color: rgba(200, 92, 0, 0.4);
    box-shadow: 0 8px 32px rgba(200, 92, 0, 0.1);
  }

  /* ── Badge / Tag ── */
  .badge {
    display: inline-flex;
    align-items: center;
    gap: 0.3rem;
    background: var(--orange-dim);
    color: var(--orange);
    border: 1px solid rgba(200, 92, 0, 0.25);
    border-radius: 999px;
    padding: 0.22rem 0.7rem;
    font-size: 0.75rem;
    font-weight: 700;
  }
  .badge-green {
    background: rgba(76, 175, 120, 0.15);
    color: var(--success);
    border-color: rgba(76, 175, 120, 0.25);
  }
  .badge-red {
    background: rgba(224, 80, 80, 0.15);
    color: var(--danger);
    border-color: rgba(224, 80, 80, 0.25);
  }
  .badge-gray {
    background: rgba(122, 106, 96, 0.18);
    color: var(--text-muted);
    border-color: rgba(122, 106, 96, 0.2);
  }

  /* ── Navbar (public) ── */
  .navbar {
    position: sticky;
    top: 0;
    z-index: 100;
    background: rgba(25, 20, 17, 0.85);
    backdrop-filter: blur(20px) saturate(160%);
    -webkit-backdrop-filter: blur(20px) saturate(160%);
    border-bottom: 1px solid var(--border);
  }
  .nav-inner {
    display: flex;
    align-items: center;
    gap: 1rem;
    padding: 0.75rem 0;
    height: 64px;
  }
  .nav-logo {
    font-family: Georgia, serif;
    font-size: 1.35rem;
    font-weight: 800;
    color: var(--orange);
    letter-spacing: -0.02em;
  }
  .nav-search {
    flex: 1;
    max-width: 420px;
    display: flex;
    align-items: center;
    gap: 0.5rem;
    background: var(--panel2);
    border: 1px solid var(--border);
    border-radius: 10px;
    padding: 0.45rem 0.85rem;
  }
  .nav-search input {
    background: none;
    border: none;
    outline: none;
    color: var(--text);
    font-size: 0.88rem;
    width: 100%;
  }
  .nav-search input::placeholder {
    color: var(--text-dim);
  }
  .nav-links {
    display: flex;
    align-items: center;
    gap: 0.25rem;
    margin-left: auto;
  }
  .nav-link {
    border-radius: 8px;
    padding: 0.4rem 0.75rem;
    font-size: 0.88rem;
    font-weight: 600;
    color: var(--text-muted);
    transition: all 0.15s;
  }
  .nav-link:hover,
  .nav-link.active {
    background: var(--orange-dim);
    color: var(--orange);
  }
  .nav-icon-btn {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 40px;
    height: 40px;
    border-radius: 9px;
    background: var(--panel2);
    color: var(--text-muted);
    border: 1px solid var(--border);
    cursor: pointer;
    transition: all 0.15s;
  }
  .nav-icon-btn:hover {
    border-color: var(--orange);
    color: var(--orange);
  }
  .cart-badge {
    position: absolute;
    right: -5px;
    top: -5px;
    min-width: 18px;
    height: 18px;
    border-radius: 999px;
    background: var(--danger);
    color: white;
    font-size: 10px;
    font-weight: 900;
    display: grid;
    place-items: center;
    padding: 0 3px;
  }
  .profile-pill {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    background: var(--panel2);
    border: 1px solid var(--border);
    border-radius: 999px;
    padding: 0.25rem 0.75rem 0.25rem 0.25rem;
    cursor: pointer;
    transition: all 0.15s;
  }
  .profile-pill:hover {
    border-color: var(--orange);
  }
  .profile-avatar {
    width: 30px;
    height: 30px;
    border-radius: 999px;
    background: var(--orange);
    color: white;
    display: grid;
    place-items: center;
    font-weight: 900;
    font-size: 0.8rem;
  }
  .dropdown-menu {
    position: absolute;
    right: 0;
    top: calc(100% + 8px);
    background: var(--panel);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 0.5rem;
    min-width: 180px;
    box-shadow: 0 16px 40px rgba(0, 0, 0, 0.4);
    z-index: 200;
  }
  .dropdown-item {
    display: flex;
    align-items: center;
    gap: 0.6rem;
    padding: 0.65rem 0.85rem;
    border-radius: 8px;
    font-size: 0.88rem;
    font-weight: 600;
    color: var(--text-muted);
    transition: all 0.12s;
    cursor: pointer;
  }
  .dropdown-item:hover {
    background: var(--orange-dim);
    color: var(--text);
  }
  .dropdown-item.danger:hover {
    background: rgba(224, 80, 80, 0.12);
    color: var(--danger);
  }

  /* ── Toast ── */
  .toast {
    position: fixed;
    left: 50%;
    top: 1rem;
    z-index: 9999;
    transform: translateX(-50%);
    background: var(--orange);
    color: white;
    padding: 0.8rem 1.25rem;
    border-radius: 12px;
    font-weight: 700;
    font-size: 0.9rem;
    text-align: center;
    min-width: 260px;
    max-width: 90vw;
    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.4);
    animation: slideDown 0.25s ease;
  }
  .toast.error {
    background: var(--danger);
  }
  .toast.success {
    background: var(--success);
  }
  @keyframes slideDown {
    from {
      opacity: 0;
      transform: translateX(-50%) translateY(-16px);
    }
    to {
      opacity: 1;
      transform: translateX(-50%) translateY(0);
    }
  }

  /* ── Splash ── */
  .splash-page {
    min-height: 100vh;
    display: grid;
    place-items: center;
    background: var(--bg);
    padding: 1rem;
  }

  .splash-bg {
    position: absolute;
    inset: 0;
    opacity: 0.08;
    background: url("/assets/DesaWallpaper.jpg") center/cover;
    pointer-events: none;
  }
  .splash-title {
    font-family: Georgia, serif;
    font-size: clamp(3.5rem, 10vw, 6rem);
    font-weight: 800;
    color: var(--orange);
    line-height: 0.9;
    letter-spacing: -0.03em;
    position: relative;
  }
  .splash-tagline {
    font-size: clamp(1rem, 3vw, 1.5rem);
    text-align: center;
    color: var(--text-muted);
    margin-top: 1rem;
    position: relative;
    max-width: 600px;
  }
  .splash-copy {
    font-size: 0.95rem;
    color: var(--text-dim);
    margin-top: 0.5rem;
    position: relative;
    text-align: center;
  }

  /* ── Hero section ── */
  .hero-section {
    position: relative;
    overflow: hidden;
    border-radius: 16px;
    min-height: 400px;
    background:
      linear-gradient(
        90deg,
        rgba(25, 20, 17, 0.97) 40%,
        rgba(25, 20, 17, 0.55)
      ),
      url("/assets/image.png") center/cover;
    display: flex;
    align-items: center;
    padding: 2.5rem;
  }
  .hero-content {
    max-width: 560px;
    position: relative;
    z-index: 1;
  }
  .hero-title {
    font-size: clamp(2rem, 6vw, 4rem);
    font-weight: 900;
    line-height: 1;
    letter-spacing: -0.03em;
  }
  .hero-title span {
    color: var(--orange);
  }

  /* ── Event Card ── */
  .event-card {
    overflow: hidden;
    border-radius: 14px;
    background: var(--panel);
    border: 1px solid var(--border);
    transition: all 0.2s;
    cursor: pointer;
  }
  .event-card:hover {
    transform: translateY(-4px);
    border-color: rgba(200, 92, 0, 0.35);
    box-shadow: 0 12px 36px rgba(200, 92, 0, 0.12);
  }
  .event-card img {
    width: 100%;
    height: 180px;
    object-fit: cover;
  }
  .event-card-body {
    padding: 1rem;
  }
  .event-card-title {
    font-weight: 800;
    font-size: 0.98rem;
    line-height: 1.3;
    color: var(--text);
  }
  .event-card-meta {
    margin-top: 0.5rem;
    display: grid;
    gap: 0.3rem;
    font-size: 0.78rem;
    color: var(--text-muted);
  }
  .event-card-meta span {
    display: flex;
    align-items: center;
    gap: 0.4rem;
  }
  .event-card-footer {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-top: 0.75rem;
    padding-top: 0.75rem;
    border-top: 1px solid var(--border);
  }
  .event-price {
    font-size: 0.85rem;
    font-weight: 900;
    color: var(--orange);
  }

  /* ── Category strip ── */
  .category-strip {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.75rem;

    padding-bottom: 0.5rem;
    scroll-snap-type: x mandatory;
  }
  .category-strip::-webkit-scrollbar {
    display: none;
  }
  .cat-chip {
    flex: 0 0 auto;
    scroll-snap-align: start;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.4rem;
    background: var(--panel);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 0.75rem 1rem;
    font-size: 0.75rem;
    font-weight: 700;
    color: var(--text-muted);
    cursor: pointer;
    transition: all 0.15s;
    white-space: nowrap;
    min-width: 80px;
  }
  .cat-chip:hover,
  .cat-chip.active {
    background: var(--orange-dim);
    color: var(--orange);
    border-color: rgba(200, 92, 0, 0.3);
  }
  .cat-icon {
    width: 36px;
    height: 36px;
    border-radius: 999px;
    background: var(--panel2);
    display: grid;
    place-items: center;
    font-size: 1.1rem;
  }

  /* ── Event Grid / Scroll ── */
  .event-scroll {
    display: grid;
    grid-auto-flow: column;
    grid-auto-columns: minmax(260px, 80vw);
    gap: 1rem;
    overflow-x: auto;
    padding-bottom: 0.5rem;
    scroll-snap-type: x mandatory;
  }
  .event-scroll::-webkit-scrollbar {
    display: none;
  }
  .event-scroll > * {
    scroll-snap-align: start;
  }
  @media (min-width: 1024px) {
    .event-scroll {
      grid-auto-flow: row;
      grid-auto-columns: initial;
      grid-template-columns: repeat(4, minmax(0, 1fr));
      overflow: visible;
    }
  }
  @media (min-width: 640px) and (max-width: 1023px) {
    .event-scroll {
      grid-auto-columns: minmax(260px, 46vw);
    }
  }

  .events-grid {
    display: grid;
    gap: 1rem;
  }
  @media (min-width: 480px) {
    .events-grid {
      grid-template-columns: repeat(2, minmax(0, 1fr));
    }
  }
  @media (min-width: 768px) {
    .events-grid {
      grid-template-columns: repeat(3, minmax(0, 1fr));
    }
  }
  @media (min-width: 1100px) {
    .events-grid {
      grid-template-columns: repeat(4, minmax(0, 1fr));
    }
  }

  /* ── Section heading ── */
  .section-head {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 1rem;
    margin-bottom: 1.25rem;
  }
  .section-title {
    font-size: clamp(1.1rem, 3vw, 1.5rem);
    font-weight: 900;
  }

  /* ── Empty state ── */
  .empty-state {
    text-align: center;
    padding: 3rem 1rem;
    color: var(--text-dim);
  }
  .empty-state-icon {
    font-size: 3rem;
    margin-bottom: 0.75rem;
    opacity: 0.4;
  }

  /* ── Profile page ── */
  .profile-tabs {
    display: flex;
    gap: 0.35rem;
    background: var(--panel2);
    border-radius: 12px;
    padding: 0.35rem;
  }
  .profile-tab {
    flex: 1;
    border-radius: 9px;
    padding: 0.6rem 0.75rem;
    font-size: 0.82rem;
    font-weight: 700;
    text-align: center;
    color: var(--text-muted);
    transition: all 0.15s;
    cursor: pointer;
  }
  .profile-tab.active {
    background: var(--orange);
    color: white;
  }

  /* ── Dashboard (Admin/Organizer) ── */
  .dash-page {
    min-height: 100vh;
    background: var(--admin-bg);
  }
  .dash-layout {
    display: grid;
  }
  @media (min-width: 1024px) {
    .dash-layout {
      grid-template-columns: 260px 1fr;
    }
  }
  .dash-sidebar {
    display: none;
    background: var(--admin-sidebar);
    color: white;
    height: 100vh;
    position: sticky;
    top: 0;
    overflow-y: auto;
    padding: 1.5rem 1rem;
  }
  @media (min-width: 1024px) {
    .dash-sidebar {
      display: flex;
      flex-direction: column;
    }
  }
  .sidebar-logo {
    font-family: Georgia, serif;
    font-size: 1.3rem;
    font-weight: 800;
    color: var(--orange);
    margin-bottom: 2rem;
  }
  .sidebar-section {
    font-size: 0.68rem;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.1em;
    color: rgba(255, 255, 255, 0.3);
    padding: 0.5rem 0.75rem;
    margin-top: 0.75rem;
  }
  .sidebar-item {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    padding: 0.7rem 0.85rem;
    border-radius: 10px;
    font-size: 0.88rem;
    font-weight: 600;
    color: rgba(255, 255, 255, 0.6);
    cursor: pointer;
    transition: all 0.15s;
    margin-bottom: 0.1rem;
  }
  .sidebar-item:hover {
    background: rgba(255, 255, 255, 0.06);
    color: white;
  }
  .sidebar-item.active {
    background: var(--orange);
    color: white;
  }
  .dash-main {
    min-height: 100vh;
  }
  .dash-topbar {
    background: white;
    border-bottom: 1px solid #e5e7eb;
    padding: 1rem 1.5rem;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 1rem;
    position: sticky;
    top: 0;
    z-index: 50;
  }
  .dash-title {
    font-size: 1.2rem;
    font-weight: 900;
    color: var(--admin-text);
  }
  .stat-card {
    background: white;
    border-radius: 12px;
    padding: 1.25rem;
    border: 1px solid #e5e7eb;
  }
  .stat-card-label {
    font-size: 0.78rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.07em;
    color: var(--admin-muted);
  }
  .stat-card-value {
    font-size: 2rem;
    font-weight: 900;
    color: var(--admin-text);
    line-height: 1.1;
  }
  .stat-card-sub {
    font-size: 0.8rem;
    color: var(--admin-muted);
    margin-top: 0.25rem;
  }
  .stat-card-icon {
    width: 44px;
    height: 44px;
    border-radius: 10px;
    display: grid;
    place-items: center;
  }
  .admin-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 0.88rem;
  }
  .admin-table th {
    text-align: left;
    font-size: 0.75rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.07em;
    color: var(--admin-muted);
    padding: 0.75rem 1rem;
    border-bottom: 1px solid #e5e7eb;
    background: #f9fafb;
  }
  .admin-table td {
    padding: 0.85rem 1rem;
    border-bottom: 1px solid #f0f0f0;
    color: var(--admin-text);
    vertical-align: middle;
  }
  .admin-table tr:last-child td {
    border-bottom: none;
  }
  .admin-table tr:hover td {
    background: #fafafa;
  }
  .admin-badge {
    display: inline-flex;
    align-items: center;
    border-radius: 6px;
    padding: 0.2rem 0.6rem;
    font-size: 0.72rem;
    font-weight: 800;
  }
  .admin-badge.green {
    background: #dcfce7;
    color: #16a34a;
  }
  .admin-badge.orange {
    background: #ffedd5;
    color: #c2410c;
  }
  .admin-badge.red {
    background: #fee2e2;
    color: #dc2626;
  }
  .admin-badge.gray {
    background: #f3f4f6;
    color: #6b7280;
  }
  .admin-badge.blue {
    background: #dbeafe;
    color: #1d4ed8;
  }
  .admin-card {
    background: white;
    border-radius: 14px;
    border: 1px solid #e5e7eb;
    overflow: hidden;
  }
  .admin-card-header {
    padding: 1.1rem 1.25rem;
    border-bottom: 1px solid #f0f0f0;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  .admin-card-title {
    font-size: 0.95rem;
    font-weight: 800;
    color: var(--admin-text);
  }
  .responsive-table {
    overflow-x: auto;
  }
  .responsive-table table {
    min-width: 640px;
  }

  .dash-mobile-bar {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0.9rem 1rem;
    background: var(--admin-sidebar);
  }
  @media (min-width: 1024px) {
    .dash-mobile-bar {
      display: none;
    }
  }
  .mobile-menu-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 0.5rem;
  }
  .mobile-menu-item {
    display: flex;
    align-items: center;
    gap: 0.6rem;
    padding: 0.8rem;
    border-radius: 10px;
    font-size: 0.85rem;
    font-weight: 700;
    background: rgba(255, 255, 255, 0.06);
    color: rgba(255, 255, 255, 0.75);
    cursor: pointer;
    transition: all 0.15s;
  }
  .mobile-menu-item.active {
    background: var(--orange);
    color: white;
  }

  /* ── Footer ── */
  .footer {
    background: #120f0d;
    border-top: 1px solid var(--border);
    padding: 2.5rem 0 1.5rem;
  }
  .footer-grid {
    display: grid;
    gap: 2rem;
  }
  @media (min-width: 768px) {
    .footer-grid {
      grid-template-columns: 1.5fr 1fr 1fr 1fr;
    }
  }
  .footer-brand {
    font-family: Georgia, serif;
    font-size: 1.4rem;
    font-weight: 800;
    color: var(--orange);
  }
  .footer-text {
    font-size: 0.83rem;
    color: var(--text-dim);
    line-height: 1.7;
    margin-top: 0.5rem;
  }
  .footer-head {
    font-weight: 800;
    font-size: 0.85rem;
    color: var(--text);
    margin-bottom: 0.75rem;
  }
  .footer-link {
    display: block;
    font-size: 0.82rem;
    color: var(--text-dim);
    padding: 0.2rem 0;
    transition: color 0.12s;
  }
  .footer-link:hover {
    color: var(--orange);
  }
  .footer-bottom {
    border-top: 1px solid var(--border);
    margin-top: 2rem;
    padding-top: 1rem;
    text-align: center;
    font-size: 0.78rem;
    color: var(--text-dim);
  }

  .modal-overlay {
    position: fixed;
    inset: 0;
    background: rgba(0, 0, 0, 0.7);
    z-index: 500;
    display: grid;
    place-items: center;
    padding: 1rem;
    backdrop-filter: blur(6px);
  }
  .modal-card {
    background: var(--panel);
    border: 1px solid var(--border);
    border-radius: 18px;
    padding: 1.75rem;
    width: min(500px, 100%);
    max-height: 90vh;
    overflow-y: auto;
  }
  .modal-title {
    font-size: 1.2rem;
    font-weight: 900;
    margin-bottom: 1.25rem;
  }

  .detail-layout {
    display: grid;
    gap: 1.5rem;
  }
  @media (min-width: 900px) {
    .detail-layout {
      grid-template-columns: 1fr 360px;
      align-items: start;
    }
  }
  .detail-hero-img {
    width: 100%;
    aspect-ratio: 16/7;
    object-fit: cover;
    border-radius: 16px;
  }
  .detail-section {
    padding: 1.25rem;
    border-bottom: 1px solid var(--border);
  }
  .detail-section:last-child {
    border-bottom: none;
  }
  .ticket-option {
    width: 100%;
    text-align: left;
    background: var(--panel2);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 1rem;
    cursor: pointer;
    transition: all 0.15s;
  }
  .ticket-option:hover,
  .ticket-option.selected {
    border-color: var(--orange);
    background: var(--orange-dim);
  }
  .ticket-name {
    font-weight: 800;
    color: var(--text);
  }
  .ticket-price {
    font-size: 0.9rem;
    color: var(--orange);
    font-weight: 700;
    margin-top: 0.25rem;
  }
  .ticket-perk {
    font-size: 0.78rem;
    color: var(--text-muted);
    margin-top: 0.4rem;
  }
  .qty-control {
    display: flex;
    align-items: center;
    gap: 1rem;
    background: var(--panel2);
    border-radius: 10px;
    padding: 0.4rem;
    width: max-content;
  }
  .qty-btn {
    width: 32px;
    height: 32px;
    border-radius: 8px;
    background: var(--panel);
    border: 1px solid var(--border);
    color: var(--text);
    display: grid;
    place-items: center;
    cursor: pointer;
    transition: all 0.12s;
  }
  .qty-btn:hover {
    border-color: var(--orange);
    color: var(--orange);
  }
  .qty-value {
    font-weight: 800;
    min-width: 24px;
    text-align: center;
  }


/* ── Tambahan UI The Village ── */
.dropdown-menu,
.select-card-menu,
.mobile-menu-card {
  animation: floatCardIn 0.22s ease both;
  transform-origin: top right;
}
@keyframes floatCardIn {
  from {
    opacity: 0;
    transform: translateY(-10px) scale(0.97);
  }
  to {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
}

.mobile-menu-wrap {
  position: absolute;
  left: 1rem;
  right: 1rem;
  top: calc(100% + 0.65rem);
  z-index: 250;
}
.mobile-menu-card {
  background: rgba(37, 33, 31, 0.96);
  border: 1px solid rgba(200, 92, 0, 0.22);
  border-radius: 18px;
  padding: 0.85rem;
  box-shadow:
    0 24px 70px rgba(0, 0, 0, 0.48),
    0 0 0 1px rgba(255, 255, 255, 0.03) inset;
  backdrop-filter: blur(18px);
}
.mobile-menu-search {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  margin-bottom: 0.75rem;
  background: var(--panel2);
  border-radius: 12px;
  padding: 0.65rem 0.85rem;
  border: 1px solid var(--border);
}
.mobile-menu-search input {
  background: none;
  border: none;
  outline: none;
  color: var(--text);
  font-size: 0.9rem;
  flex: 1;
}
.mobile-menu-grid-links {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 0.55rem;
}
.mobile-menu-link {
  display: flex;
  align-items: center;
  gap: 0.55rem;
  padding: 0.8rem;
  border-radius: 12px;
  background: var(--panel2);
  color: var(--text-muted);
  font-weight: 800;
  font-size: 0.88rem;
  border: 1px solid var(--border);
  transition: all 0.16s ease;
}
.mobile-menu-link.active {
  background: var(--orange-dim);
  color: var(--orange);
  border-color: rgba(200, 92, 0, 0.42);
}
.navbar .container {
  position: relative;
}

.select-card {
  position: relative;
  min-width: 160px;
}
.select-card-button {
  width: 100%;
  min-height: 44px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 0.8rem;
  background: var(--panel2);
  border: 1px solid var(--border);
  border-radius: 12px;
  color: var(--text);
  padding: 0.65rem 0.9rem;
  font-weight: 800;
  font-size: 0.9rem;
  cursor: pointer;
  transition: all 0.16s ease;
}
.select-card-button:hover,
.select-card-button.active {
  border-color: var(--orange);
  box-shadow: 0 0 0 3px rgba(200, 92, 0, 0.12);
}
.select-chevron {
  transition: transform 0.16s ease;
  color: var(--text-dim);
}
.select-chevron.open {
  transform: rotate(180deg);
  color: var(--orange);
}
.select-card-menu {
  position: absolute;
  top: calc(100% + 0.5rem);
  right: 0;
  width: max(100%, 190px);
  background: rgba(37, 33, 31, 0.98);
  border: 1px solid rgba(200, 92, 0, 0.26);
  border-radius: 14px;
  padding: 0.45rem;
  z-index: 260;
  box-shadow: 0 22px 60px rgba(0, 0, 0, 0.45);
  max-height: 260px;
  overflow-y: auto;
}
.select-card-menu::-webkit-scrollbar {
  width: 6px;
}
.select-card-menu::-webkit-scrollbar-thumb {
  background: rgba(200, 92, 0, 0.45);
  border-radius: 99px;
}
.select-card-option {
  width: 100%;
  border: none;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 0.6rem;
  background: transparent;
  color: var(--text-muted);
  padding: 0.65rem 0.75rem;
  border-radius: 10px;
  text-align: left;
  cursor: pointer;
  font-weight: 700;
  transition: all 0.14s ease;
}
.select-card-option:hover,
.select-card-option.selected {
  background: var(--orange-dim);
  color: var(--orange);
}

.event-scroll {
  grid-auto-columns: minmax(260px, 82vw) !important;
  grid-auto-flow: column !important;
  grid-template-columns: none !important;
  overflow-x: auto !important;
  overflow-y: visible;
  padding: 0.25rem 0.2rem 0.8rem;
}
@media (min-width: 640px) {
  .event-scroll {
    grid-auto-columns: minmax(280px, 38vw) !important;
  }
}
@media (min-width: 1024px) {
  .event-scroll {
    grid-auto-columns: 290px !important;
  }
}

.events-page-list {
  position: relative;
}
@media (max-width: 639px) {
  .events-page-list.has-fade {
    max-height: 1120px;
    overflow-y: auto;
    padding-right: 0.15rem;
    border-radius: 16px;
  }
  .events-page-list.has-fade::after {
    content: "";
    position: sticky;
    display: block;
    bottom: 0;
    left: 0;
    right: 0;
    height: 82px;
    pointer-events: none;
    background: linear-gradient(to bottom, rgba(25, 20, 17, 0), var(--bg));
    margin-top: -82px;
  }
  .events-grid {
    grid-template-columns: 1fr !important;
  }
}

.footer-brand,
.footer-bottom {
  text-transform: none;
}

/* ── Perbaikan layout umum ── */
#root {
  min-height: 100vh;
}
.page-shell {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  background: var(--bg);
}
.page-main {
  flex: 1 0 auto;
}
.back-link {
  display: inline-flex;
  align-items: center;
  gap: 0.4rem;
  background: none;
  border: none;
  color: var(--text-muted);
  cursor: pointer;
  margin-bottom: 1.25rem;
  font-size: 0.88rem;
  font-weight: 700;
}
.back-link:hover {
  color: var(--orange);
}

/* ── Tombol geser carousel ── */
.scroll-nav-btn {
  width: 38px;
  height: 38px;
  border-radius: 999px;
  border: 1px solid var(--border);
  background: var(--panel2);
  color: var(--orange);
  display: grid;
  place-items: center;
  cursor: pointer;
  transition: all 0.16s ease;
}
.scroll-nav-btn:hover {
  background: var(--orange);
  color: #fff;
  transform: translateY(-1px);
}

/* ── Custom select untuk dashboard supaya tidak keluar dropdown putih bawaan browser ── */
.admin-select-card {
  min-width: 100%;
}
.admin-select-card .select-card-button {
  min-height: 44px;
  background: #fff;
  color: var(--admin-text);
  border-color: #e5e7eb;
  font-weight: 700;
  box-shadow: none;
}
.admin-select-card .select-card-button span {
  color: var(--admin-text);
}
.admin-select-card .select-card-menu {
  left: 0;
  right: auto;
  background: #fff;
  border-color: #e5e7eb;
  box-shadow: 0 18px 45px rgba(15, 23, 42, 0.16);
}
.admin-select-card .select-card-option {
  color: var(--admin-muted);
}
.admin-select-card .select-card-option:hover,
.admin-select-card .select-card-option.selected {
  background: #fff7ed;
  color: var(--orange);
}
.admin-select-compact {
  min-width: 150px;
}
.admin-select-compact .select-card-button {
  min-height: 36px;
  font-size: 0.82rem;
}

/* Fallback untuk select native yang masih tersisa */
select.input,
select {
  appearance: none;
  -webkit-appearance: none;
}
select option {
  background: var(--panel);
  color: var(--text);
}

/* ── Tabel profil publik, jangan pakai warna admin yang hitam di tema gelap ── */
.profile-table {
  width: 100%;
  border-collapse: collapse;
  min-width: 720px;
  font-size: 0.88rem;
}
.profile-table th {
  text-align: left;
  font-size: 0.75rem;
  font-weight: 800;
  text-transform: uppercase;
  letter-spacing: 0.07em;
  color: var(--text-muted);
  padding: 0.85rem 1rem;
  border-bottom: 1px solid var(--border);
  background: var(--panel2);
}
.profile-table td {
  padding: 0.95rem 1rem;
  border-bottom: 1px solid var(--border);
  color: var(--text);
  vertical-align: middle;
}
.profile-table tr:last-child td {
  border-bottom: none;
}
.profile-table tr:hover td {
  background: rgba(255, 255, 255, 0.02);
}

/* ── Checkout / pendaftaran / invoice ── */
.checkout-steps {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 0.5rem;
}
.checkout-step {
  border-radius: 12px;
  background: var(--panel2);
  border: 1px solid var(--border);
  color: var(--text-muted);
  padding: 0.7rem 0.85rem;
  font-size: 0.82rem;
  font-weight: 800;
  text-align: center;
}
.checkout-step.active,
.checkout-step.done {
  background: var(--orange-dim);
  color: var(--orange);
  border-color: rgba(200, 92, 0, 0.32);
}
.checkout-layout {
  display: grid;
  gap: 1rem;
}
@media (min-width: 920px) {
  .checkout-layout {
    grid-template-columns: minmax(0, 1fr) 360px;
    align-items: start;
  }
}
.form-grid-2 {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1rem;
}
@media (min-width: 700px) {
  .form-grid-2 {
    grid-template-columns: repeat(2, minmax(0, 1fr));
  }
}
.input-label {
  display: flex;
  align-items: center;
  gap: 0.35rem;
}
.payment-method-grid {
  display: grid;
  gap: 0.65rem;
  grid-template-columns: 1fr;
}
@media (min-width: 700px) {
  .payment-method-grid {
    grid-template-columns: repeat(3, minmax(0, 1fr));
  }
}
.payment-method-card {
  border: 1px solid var(--border);
  background: var(--panel2);
  color: var(--text);
  border-radius: 14px;
  padding: 0.9rem;
  display: grid;
  gap: 0.25rem;
  text-align: left;
  cursor: pointer;
  transition: all 0.16s ease;
}
.payment-method-card span {
  color: var(--orange);
}
.payment-method-card small {
  color: var(--text-dim);
}
.payment-method-card.active {
  background: var(--orange-dim);
  border-color: var(--orange);
  box-shadow: 0 0 0 3px rgba(200, 92, 0, 0.13);
}
.checkout-summary {
  overflow: hidden;
  position: sticky;
  top: 88px;
}
.checkout-summary img {
  width: 100%;
  height: 170px;
  object-fit: cover;
}
.summary-row,
.invoice-box div {
  display: flex;
  justify-content: space-between;
  gap: 1rem;
  padding: 0.65rem 0;
  border-bottom: 1px solid var(--border);
}
.summary-row:last-child,
.invoice-box div:last-child {
  border-bottom: none;
}
.summary-row span,
.invoice-box span {
  color: var(--text-muted);
}
.orange {
  color: var(--orange) !important;
}

.invoice-card {
  background: var(--panel);
  border: 1px solid var(--border);
  border-radius: 18px;
  padding: 1.25rem;
  overflow: hidden;
}
.invoice-head {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  gap: 1rem;
  padding-bottom: 1rem;
  border-bottom: 1px solid var(--border);
}
.invoice-head h1 {
  font-size: clamp(1.2rem, 4vw, 1.8rem);
  margin: 0.35rem 0 0;
  font-weight: 900;
}
.invoice-head p {
  color: var(--text-muted);
  margin: 0.15rem 0 0;
  font-size: 0.86rem;
}
.invoice-grid {
  display: grid;
  gap: 1.25rem;
  margin-top: 1.25rem;
}
@media (min-width: 900px) {
  .invoice-grid {
    grid-template-columns: 1fr 360px;
  }
}
.invoice-grid h3 {
  font-size: 0.95rem;
  font-weight: 900;
  margin: 0 0 0.75rem;
}
.invoice-box {
  background: var(--panel2);
  border: 1px solid var(--border);
  border-radius: 14px;
  padding: 0.35rem 0.9rem;
  margin-bottom: 1rem;
}
.payment-instruction {
  background: var(--panel2);
  border: 1px solid var(--border);
  border-radius: 16px;
  padding: 1.25rem;
  min-height: 260px;
  display: grid;
  place-items: center;
  text-align: center;
  color: var(--text-muted);
}
.payment-instruction svg {
  color: var(--orange);
}
.payment-instruction p {
  margin: 0.75rem 0 0.35rem;
  line-height: 1.6;
}
.payment-instruction small {
  color: var(--text-dim);
}
.mock-qris {
  width: 190px;
  height: 190px;
  background:
    linear-gradient(90deg, #111 10px, transparent 10px) 0 0/24px 24px,
    linear-gradient(#111 10px, transparent 10px) 0 0/24px 24px,
    #fff;
  border: 10px solid #fff;
  outline: 1px solid var(--border);
  border-radius: 12px;
  display: grid;
  place-items: center;
  color: #111;
  font-weight: 900;
  box-shadow: 0 12px 30px rgba(0, 0, 0, 0.3);
}
.virtual-account {
  background: #fff7ed;
  color: #9a3412;
  border: 1px dashed rgba(200, 92, 0, 0.45);
  border-radius: 12px;
  padding: 0.75rem 1rem;
  font-weight: 900;
  letter-spacing: 0.06em;
  margin: 0.4rem 0;
}
.free-invoice {
  color: var(--success);
  display: grid;
  place-items: center;
  gap: 0.6rem;
  font-weight: 900;
}
.invoice-actions {
  display: flex;
  gap: 0.75rem;
  justify-content: flex-end;
  flex-wrap: wrap;
  margin-top: 1.25rem;
  padding-top: 1rem;
  border-top: 1px solid var(--border);
}

@media print {
  body {
    background: white !important;
    color: #111 !important;
  }
  .navbar,
  .footer,
  .no-print,
  .back-link,
  .checkout-steps {
    display: none !important;
  }
  .page-shell,
  .page-main,
  .container {
    display: block !important;
    min-height: auto !important;
    padding: 0 !important;
    max-width: none !important;
  }
  .invoice-card {
    border: none !important;
    background: white !important;
    color: #111 !important;
  }
  .invoice-box,
  .payment-instruction {
    background: white !important;
    color: #111 !important;
    border-color: #ddd !important;
  }
}

/* versi final: dropdown dashboard juga dibuat gelap/floating, bukan putih bawaan browser */
.admin-select-card .select-card-button {
  background: #2e2825;
  color: #f0e8e0;
  border-color: rgba(200, 92, 0, 0.28);
}
.admin-select-card .select-card-button span {
  color: #f0e8e0;
}
.admin-select-card .select-card-menu {
  background: rgba(37, 33, 31, 0.98);
  border-color: rgba(200, 92, 0, 0.32);
  box-shadow: 0 22px 60px rgba(0, 0, 0, 0.36);
}
.admin-select-card .select-card-option {
  color: #a89888;
}
.admin-select-card .select-card-option:hover,
.admin-select-card .select-card-option.selected {
  background: rgba(200, 92, 0, 0.14);
  color: #e06a00;
}

.cat-chip {
  min-width: 135px;
  height: 88px;
  padding: 14px 16px;
  border-radius: 12px;
  border: 1px solid rgba(214, 96, 0, 0.35);
  background: #241f1c;
  color: #c9beb6;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 10px;
  cursor: pointer;
  transition: 0.25s ease;
  flex-shrink: 0;
}

.cat-chip:hover,
.cat-chip.active {
  border-color: #d66000;
  background: rgba(214, 96, 0, 0.15);
  color: #ffffff;
  transform: translateY(-2px);
}

.cat-icon {
  width: 38px;
  height: 38px;
  border-radius: 999px;
  background: rgba(255, 255, 255, 0.05);
  color: #d66000;
  display: flex;
  align-items: center;
  justify-content: center;
}

.cat-chip.active .cat-icon {
  background: #d66000;
  color: #ffffff;
}

.cat-chip span:last-child {
  font-size: 0.82rem;
  font-weight: 700;
  text-align: center;
}

/* ==========================================================
   FIX FINAL - StyledSelect floating card dashboard
   Pakai bersama StyledSelect_FIXED.jsx.
   Tujuannya: menu tidak ikut turun ke layout/tabel, tidak putih bawaan browser,
   dan tetap menempel ke tombol select walau parent punya overflow.
   ========================================================== */
.admin-card,
.team-add-card,
.team-form-grid,
.team-form-field {
  overflow: visible !important;
}

.team-add-card {
  position: relative;
  z-index: 30;
}

.team-form-grid {
  position: relative;
  z-index: 35;
}

.team-form-grid > *,
.team-form-field {
  min-width: 0;
}

.select-card {
  position: relative;
  width: 100%;
  min-width: 0;
}

.select-card-button {
  width: 100%;
  min-width: 0;
}

.select-card-label,
.select-card-button span {
  min-width: 0;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.select-card-menu-portal {
  position: fixed !important;
  right: auto !important;
  padding: 0.45rem;
  border-radius: 14px;
  border: 1px solid rgba(200, 92, 0, 0.32);
  background: rgba(37, 33, 31, 0.98);
  box-shadow: 0 22px 60px rgba(0, 0, 0, 0.42);
  overflow-y: auto;
  animation: selectPortalIn 0.16s ease both;
}

.select-card-menu-portal::-webkit-scrollbar {
  width: 6px;
}

.select-card-menu-portal::-webkit-scrollbar-thumb {
  background: rgba(200, 92, 0, 0.45);
  border-radius: 999px;
}

.select-card-menu-portal .select-card-option {
  width: 100%;
  border: none;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 0.6rem;
  background: transparent;
  color: #a89888;
  padding: 0.65rem 0.75rem;
  border-radius: 10px;
  text-align: left;
  cursor: pointer;
  font-weight: 800;
  transition: all 0.14s ease;
}

.select-card-menu-portal .select-card-option:hover,
.select-card-menu-portal .select-card-option.selected {
  background: rgba(200, 92, 0, 0.14);
  color: #e06a00;
}

.admin-select-card {
  min-width: 0 !important;
  width: 100%;
  z-index: 40;
}

.admin-select-card .select-card-button {
  min-height: 44px;
  background: #2e2825 !important;
  color: #f0e8e0 !important;
  border-color: rgba(200, 92, 0, 0.28) !important;
  font-weight: 800;
  box-shadow: none;
}

.admin-select-card .select-card-button:hover,
.admin-select-card .select-card-button.active {
  border-color: #c85c00 !important;
  box-shadow: 0 0 0 3px rgba(200, 92, 0, 0.12) !important;
}

.admin-select-card .select-card-button span,
.admin-select-card .select-chevron {
  color: #f0e8e0 !important;
}

.admin-select-card .select-chevron.open {
  color: #e06a00 !important;
}

.admin-select-card-menu {
  background: rgba(37, 33, 31, 0.98) !important;
  border-color: rgba(200, 92, 0, 0.32) !important;
  box-shadow: 0 24px 70px rgba(0, 0, 0, 0.46) !important;
}

.admin-select-card-menu .select-card-option {
  color: #a89888 !important;
}

.admin-select-card-menu .select-card-option:hover,
.admin-select-card-menu .select-card-option.selected {
  background: rgba(200, 92, 0, 0.14) !important;
  color: #e06a00 !important;
}

@keyframes selectPortalIn {
  from {
    opacity: 0;
    transform: translateY(-6px) scale(0.98);
  }
  to {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
}

/* Biar strip kategori tidak bikin halaman melebar */
.category-strip {
  width: 100%;
  max-width: 100%;
  justify-content: flex-start !important;
  overflow-x: auto;
  overflow-y: hidden;
  -webkit-overflow-scrolling: touch;
}

.cat-chip {
  flex: 0 0 135px;
  max-width: 135px;
  scroll-snap-align: start;
}

/* ==========================================================
   TESTIMONI & RATING - Home dan Detail Acara
   ========================================================== */
.section-kicker {
  display: inline-flex;
  align-items: center;
  gap: 0.45rem;
  margin-bottom: 0.4rem;
  color: var(--orange);
  font-size: 0.78rem;
  font-weight: 900;
  letter-spacing: 0.08em;
  text-transform: uppercase;
}
.section-subtitle {
  margin: 0.35rem 0 0;
  color: var(--text-muted);
  font-size: 0.9rem;
  max-width: 560px;
}
.testimonial-section {
  margin-bottom: 3rem;
}
.testimonial-head {
  align-items: flex-end;
}
.rating-summary-card {
  min-width: 185px;
  display: flex;
  align-items: center;
  gap: 0.8rem;
  padding: 0.85rem 1rem;
  border-radius: 16px;
  background: var(--panel);
  border: 1px solid var(--border);
}
.rating-summary-icon {
  width: 42px;
  height: 42px;
  border-radius: 14px;
  display: grid;
  place-items: center;
  background: var(--orange-dim);
  color: var(--orange);
}
.rating-summary-score {
  color: var(--text);
  font-size: 1.35rem;
  font-weight: 950;
  line-height: 1;
}
.rating-summary-text {
  margin-top: 0.2rem;
  color: var(--text-dim);
  font-size: 0.76rem;
  font-weight: 700;
}
.rating-stars {
  display: inline-flex;
  align-items: center;
  gap: 0.16rem;
  color: var(--text-dim);
}
.rating-star {
  color: rgba(168, 152, 136, 0.42);
}
.rating-star.active {
  color: var(--orange);
  fill: currentColor;
}
.testimonial-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 1rem;
}
.testimonial-card {
  position: relative;
  min-height: 210px;
  overflow: hidden;
  border-radius: 16px;
  padding: 1.2rem;
  background:
    radial-gradient(circle at top right, rgba(200, 92, 0, 0.16), transparent 35%),
    var(--panel);
  border: 1px solid var(--border);
  transition: all 0.18s ease;
}
.testimonial-card:hover {
  transform: translateY(-3px);
  border-color: rgba(200, 92, 0, 0.36);
  box-shadow: 0 16px 40px rgba(0, 0, 0, 0.18);
}
.testimonial-quote-icon {
  position: absolute;
  right: 1rem;
  top: 1rem;
  width: 34px;
  height: 34px;
  border-radius: 999px;
  display: grid;
  place-items: center;
  color: var(--orange);
  background: rgba(200, 92, 0, 0.12);
}
.testimonial-top {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  padding-right: 2.2rem;
  margin-bottom: 0.85rem;
}
.testimonial-avatar {
  width: 42px;
  height: 42px;
  border-radius: 999px;
  display: grid;
  place-items: center;
  flex-shrink: 0;
  background: var(--panel2);
  color: var(--orange);
  border: 1px solid var(--border);
}
.testimonial-top h3 {
  color: var(--text);
  font-size: 0.95rem;
  font-weight: 900;
  margin: 0;
}
.testimonial-top p {
  margin: 0.18rem 0 0;
  color: var(--text-dim);
  font-size: 0.78rem;
  font-weight: 700;
}
.testimonial-text {
  margin: 0.85rem 0 0;
  color: var(--text-muted);
  font-size: 0.9rem;
  line-height: 1.65;
}
.testimonial-empty {
  display: flex;
  align-items: center;
  gap: 1rem;
  padding: 1.25rem;
  color: var(--text-muted);
}
.testimonial-empty svg {
  color: var(--orange);
  flex-shrink: 0;
}
.testimonial-empty h3 {
  margin: 0 0 0.2rem;
  color: var(--text);
  font-size: 1rem;
  font-weight: 900;
}
.testimonial-empty p {
  margin: 0;
  color: var(--text-muted);
  font-size: 0.86rem;
}

/* ==========================================================
   CATEGORY DESKTOP RAPI TANPA SCROLL
   Mobile tetap horizontal karena layar sempit.
   ========================================================== */
.category-strip {
  width: 100%;
  max-width: 100%;
  display: flex;
  align-items: stretch;
  justify-content: flex-start !important;
  gap: 0.75rem;
  overflow-x: auto;
  overflow-y: hidden;
  padding-bottom: 0.5rem;
  scroll-snap-type: x mandatory;
  -webkit-overflow-scrolling: touch;
}
.category-strip::-webkit-scrollbar {
  display: none;
}
.cat-chip {
  flex: 0 0 135px;
  max-width: 135px;
  min-width: 135px;
  scroll-snap-align: start;
}
@media (min-width: 900px) {
  .category-strip {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(135px, 1fr));
    overflow: visible;
    padding-bottom: 0;
  }
  .cat-chip {
    width: 100%;
    min-width: 0;
    max-width: none;
    flex: initial;
  }
}
@media (max-width: 640px) {
  .testimonial-head {
    align-items: flex-start;
  }
  .rating-summary-card {
    width: 100%;
  }
  .testimonial-grid {
    grid-template-columns: 1fr;
  }
}


/* ==========================================================
   FIX V5 - Kategori bulat satu baris + input dashboard terbaca
   ========================================================== */
.category-strip {
  width: 100% !important;
  max-width: 100% !important;
  display: flex !important;
  flex-wrap: nowrap !important;
  align-items: flex-start !important;
  justify-content: flex-start !important;
  gap: 1rem !important;
  overflow-x: auto !important;
  overflow-y: hidden !important;
  padding: 0.15rem 0 0.75rem !important;
  scroll-snap-type: x mandatory !important;
  -webkit-overflow-scrolling: touch !important;
}
.category-strip::-webkit-scrollbar {
  display: none !important;
}
.cat-chip {
  flex: 0 0 92px !important;
  width: 92px !important;
  min-width: 92px !important;
  max-width: 92px !important;
  height: auto !important;
  padding: 0 !important;
  border: none !important;
  border-radius: 0 !important;
  background: transparent !important;
  color: var(--text-muted) !important;
  box-shadow: none !important;
  display: flex !important;
  flex-direction: column !important;
  align-items: center !important;
  justify-content: flex-start !important;
  gap: 0.55rem !important;
  scroll-snap-align: start !important;
  white-space: normal !important;
  text-align: center !important;
  transform: none !important;
}
.cat-icon {
  width: 58px !important;
  height: 58px !important;
  min-width: 58px !important;
  border-radius: 999px !important;
  display: grid !important;
  place-items: center !important;
  background: var(--panel) !important;
  border: 1px solid rgba(200, 92, 0, 0.28) !important;
  color: var(--orange) !important;
  transition: all 0.18s ease !important;
}
.cat-chip span:last-child {
  max-width: 92px !important;
  font-size: 0.74rem !important;
  line-height: 1.2 !important;
  font-weight: 800 !important;
  color: inherit !important;
  text-align: center !important;
}
.cat-chip:hover,
.cat-chip.active {
  background: transparent !important;
  color: #fff !important;
  border-color: transparent !important;
  transform: none !important;
}
.cat-chip:hover .cat-icon,
.cat-chip.active .cat-icon {
  background: var(--orange) !important;
  color: #fff !important;
  border-color: var(--orange) !important;
  box-shadow: 0 10px 28px rgba(200, 92, 0, 0.26) !important;
  transform: translateY(-2px) !important;
}
@media (min-width: 1024px) {
  .category-strip {
    gap: 0.95rem !important;
  }
  .cat-chip {
    flex-basis: 98px !important;
    width: 98px !important;
    min-width: 98px !important;
    max-width: 98px !important;
  }
  .cat-chip span:last-child {
    max-width: 98px !important;
  }
}

/* Input dashboard/admin: jangan sampai tulisan putih di background putih */
.dash-page input,
.dash-page textarea,
.dash-page select,
.admin-card input,
.admin-card textarea,
.admin-card select,
.stat-card input,
.stat-card textarea,
.stat-card select {
  background-color: #ffffff !important;
  color: var(--admin-text) !important;
  border-color: #e5e7eb !important;
  caret-color: var(--orange) !important;
}
.dash-page input::placeholder,
.dash-page textarea::placeholder,
.admin-card input::placeholder,
.admin-card textarea::placeholder {
  color: #9ca3af !important;
  opacity: 1 !important;
}
.dash-page input:focus,
.dash-page textarea:focus,
.admin-card input:focus,
.admin-card textarea:focus {
  outline: none !important;
  border-color: var(--orange) !important;
  box-shadow: 0 0 0 3px rgba(200, 92, 0, 0.12) !important;
}
.dash-page input[type="date"]::-webkit-calendar-picker-indicator {
  opacity: 0.65;
  cursor: pointer;
}

/* StyledSelect dashboard tetap gelap/floating, tapi teksnya jelas */
.admin-select-card .select-card-button {
  background: #2e2825 !important;
  color: #f0e8e0 !important;
  border-color: rgba(200, 92, 0, 0.32) !important;
}
.admin-select-card .select-card-button span,
.admin-select-card .select-card-label {
  color: #f0e8e0 !important;
}
.admin-select-card-menu {
  background: rgba(37, 33, 31, 0.98) !important;
  border-color: rgba(200, 92, 0, 0.32) !important;
}
.admin-select-card-menu .select-card-option {
  color: #d8cec7 !important;
}
.admin-select-card-menu .select-card-option:hover,
.admin-select-card-menu .select-card-option.selected {
  background: rgba(200, 92, 0, 0.14) !important;
  color: #e06a00 !important;
}


/* ==========================================================
   FIX V6 - Kategori bulat: desktop/laptop 1 baris tanpa scroll, HP scroll
   ========================================================== */
@media (min-width: 768px) {
  .category-strip {
    display: flex !important;
    flex-wrap: nowrap !important;
    align-items: flex-start !important;
    justify-content: space-between !important;
    gap: 0.65rem !important;
    overflow-x: visible !important;
    overflow-y: visible !important;
    padding: 0.15rem 0 0.75rem !important;
    scroll-snap-type: none !important;
  }

  .cat-chip {
    flex: 1 1 0 !important;
    width: auto !important;
    min-width: 0 !important;
    max-width: none !important;
  }

  .cat-icon {
    width: 54px !important;
    height: 54px !important;
    min-width: 54px !important;
  }

  .cat-chip span:last-child {
    width: 100% !important;
    max-width: 100% !important;
    font-size: 0.7rem !important;
    line-height: 1.18 !important;
    white-space: normal !important;
    overflow-wrap: anywhere !important;
  }
}

@media (max-width: 767px) {
  .category-strip {
    display: flex !important;
    flex-wrap: nowrap !important;
    justify-content: flex-start !important;
    overflow-x: auto !important;
    overflow-y: hidden !important;
    gap: 1rem !important;
    scroll-snap-type: x mandatory !important;
  }

  .cat-chip {
    flex: 0 0 92px !important;
    width: 92px !important;
    min-width: 92px !important;
    max-width: 92px !important;
  }
}

/* Dashboard input/select safety terakhir: semua teks input harus terbaca */
.dash-page input,
.dash-page textarea,
.dash-page select,
.admin-card input,
.admin-card textarea,
.admin-card select {
  background: #ffffff !important;
  color: #1a1714 !important;
  -webkit-text-fill-color: #1a1714 !important;
}

.dash-page input::placeholder,
.dash-page textarea::placeholder,
.admin-card input::placeholder,
.admin-card textarea::placeholder {
  color: #9ca3af !important;
  -webkit-text-fill-color: #9ca3af !important;
}

/* ── Upload picker gambar event dari folder komputer ── */
.upload-picker {
  width: 100%;
  display: grid;
  grid-template-columns: 180px 1fr;
  gap: 1rem;
  align-items: stretch;
  background: #ffffff;
  border: 1px solid #e5e7eb;
  border-radius: 16px;
  padding: 0.85rem;
}

.upload-picker-preview {
  width: 100%;
  min-height: 130px;
  border-radius: 14px;
  overflow: hidden;
  background: #f3f4f6;
  border: 1px dashed #d1d5db;
  display: grid;
  place-items: center;
}

.upload-picker-preview img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.upload-picker-empty {
  display: grid;
  place-items: center;
  gap: 0.45rem;
  color: #9ca3af;
  font-size: 0.82rem;
  font-weight: 700;
  text-align: center;
}

.upload-picker-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 1rem;
  min-width: 0;
}

.upload-picker-title {
  margin: 0;
  color: var(--admin-text);
  font-size: 0.98rem;
  font-weight: 900;
}

.upload-picker-desc {
  margin: 0.25rem 0 0;
  color: var(--admin-muted);
  font-size: 0.84rem;
  line-height: 1.5;
}

.upload-picker-file {
  margin: 0.45rem 0 0;
  color: var(--orange);
  font-size: 0.78rem;
  font-weight: 800;
  word-break: break-all;
}

.upload-picker-btn {
  min-height: 42px;
  border-radius: 10px;
  border: none;
  background: var(--orange);
  color: #ffffff;
  padding: 0.65rem 1rem;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 0.45rem;
  font-size: 0.86rem;
  font-weight: 800;
  cursor: pointer;
  white-space: nowrap;
  transition: 0.18s ease;
}

.upload-picker-btn:hover {
  background: var(--orange-light);
  transform: translateY(-1px);
}

@media (max-width: 640px) {
  .upload-picker {
    grid-template-columns: 1fr;
  }

  .upload-picker-preview {
    min-height: 180px;
  }

  .upload-picker-content {
    align-items: flex-start;
    flex-direction: column;
  }

  .upload-picker-btn {
    width: 100%;
  }
}

/* ── Tambahan khusus versi Blade ── */
.payment-method-card{position:relative}
.payment-method-card input{position:absolute;opacity:0;pointer-events:none}
.payment-method-card:has(input:checked){background:var(--orange-dim);border-color:var(--orange);box-shadow:0 0 0 3px rgba(200,92,0,.13)}
.ticket-option:has(input:checked){border-color:var(--orange);background:var(--orange-dim)}
.ticket-option{position:relative;display:block}
.ticket-option input{position:absolute;opacity:0;pointer-events:none}
.chip-link{display:inline-block;border:1px solid var(--border);background:var(--panel2);color:var(--text-muted);border-radius:999px;padding:.4rem .9rem;font-size:.82rem;font-weight:700}
.chip-link.active,.chip-link:hover{border-color:var(--orange);background:var(--orange-dim);color:var(--orange)}
.faq-item{border:1px solid var(--border);border-radius:12px;overflow:hidden}
.faq-q{width:100%;display:flex;justify-content:space-between;align-items:center;gap:1rem;padding:1rem 1.25rem;background:var(--panel);text-align:left;font-weight:700;color:var(--text);font-size:.95rem}
.faq-item.open .faq-q{background:var(--orange-dim)}
.faq-a{display:none;padding:0 1.25rem 1.25rem;color:var(--text-muted);font-size:.9rem;line-height:1.7;background:var(--panel)}
.faq-item.open .faq-a{display:block}
.err{color:var(--danger);font-size:.78rem;margin-top:.3rem}
.fullscreen-center{min-height:100vh;display:grid;place-items:center;padding:1rem;background:var(--bg)}
.splash-wrap{position:relative;display:flex;flex-direction:column;align-items:center;gap:.5rem}
.dash-stats{display:grid;gap:1rem;grid-template-columns:repeat(auto-fit,minmax(200px,1fr));margin-bottom:1.5rem}
.page-main .admin-card{margin-bottom:1.5rem}

/* ── Navbar responsif (dulu inline di komponen React) ── */
.nav-burger{display:none}
@media (max-width: 820px){
  .nav-links,.nav-search{display:none}
  .nav-burger{display:flex;margin-left:auto}
}
.profile-wrap{position:relative}
__TV_EOF__
echo "  ✔ public/css/app.css"
mkdir -p "public/js"
cat > "public/js/app.js" <<'__TV_EOF__'
document.addEventListener('DOMContentLoaded', function () {
  // Ikon Lucide (pengganti lucide-react)
  if (window.lucide) lucide.createIcons();

  // Toast hilang otomatis
  document.querySelectorAll('.toast').forEach(function (t) {
    setTimeout(function () { t.remove(); }, 3500);
  });

  // Toggle menu (dropdown profil & menu mobile)
  document.querySelectorAll('[data-toggle]').forEach(function (btn) {
    btn.addEventListener('click', function (e) {
      e.stopPropagation();
      var el = document.querySelector(btn.dataset.toggle);
      if (el) el.classList.toggle('hidden');
    });
  });
  document.addEventListener('click', function () {
    document.querySelectorAll('[data-closeable]').forEach(function (el) { el.classList.add('hidden'); });
  });

  // Accordion FAQ
  document.querySelectorAll('.faq-q').forEach(function (q) {
    q.addEventListener('click', function () { q.parentElement.classList.toggle('open'); });
  });

  // Tombol geser carousel
  document.querySelectorAll('[data-scroll]').forEach(function (b) {
    b.addEventListener('click', function () {
      var t = document.querySelector(b.dataset.target);
      if (t) t.scrollBy({ left: parseInt(b.dataset.scroll, 10), behavior: 'smooth' });
    });
  });
});
__TV_EOF__
echo "  ✔ public/js/app.js"

echo "▶ Mengatur .env (session file, nama aplikasi)..."
if [ -f .env ]; then
  sed -i.bak 's/^SESSION_DRIVER=.*/SESSION_DRIVER=file/' .env
  sed -i.bak 's/^APP_NAME=.*/APP_NAME="The Village"/' .env
  rm -f .env.bak
fi

mkdir -p public/assets
if [ -n "$1" ] && [ -d "$1" ]; then
  echo "▶ Menyalin gambar dari: $1"
  cp -R "$1"/. public/assets/
  echo "  ✔ gambar tersalin"
else
  echo "⚠ Folder gambar tidak diberikan. Salin isi UI/public/assets ke public/assets secara manual."
fi

php artisan optimize:clear >/dev/null 2>&1 || true

echo ""
echo "✅ Selesai! Jalankan:  php artisan serve   lalu buka http://127.0.0.1:8000"
echo "   Cek route:          php artisan route:list"
