@if (session('success'))
    <div class="toast success">{{ session('success') }}</div>
@endif

@if (session('error'))
    <div class="toast error">{{ session('error') }}</div>
@endif
