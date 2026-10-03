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
