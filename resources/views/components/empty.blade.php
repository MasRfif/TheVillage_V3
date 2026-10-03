@props(['icon' => '📭', 'title' => 'Belum ada data', 'desc' => null])

<div class="empty-state">
    <div class="empty-state-icon">{{ $icon }}</div>
    <div style="font-weight:800;color:var(--text-muted)">{{ $title }}</div>
    @if ($desc)
        <div style="font-size:.85rem;margin-top:.25rem">{{ $desc }}</div>
    @endif
</div>
