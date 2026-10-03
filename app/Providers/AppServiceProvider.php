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
