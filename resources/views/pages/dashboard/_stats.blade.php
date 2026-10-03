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
