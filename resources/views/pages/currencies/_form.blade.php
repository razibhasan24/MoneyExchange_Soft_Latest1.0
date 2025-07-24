@csrf
@if ($mode === 'edit')
    @method('PUT')
@endif

<div class="mb-2">
    <label>Currency_code</label>
    <input type="text" name="currency_code" value="{{ old('currency_code', $currency->currency_code ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Currency_name</label>
    <input type="text" name="currency_name" value="{{ old('currency_name', $currency->currency_name ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Symbol</label>
    <input type="text" name="symbol" value="{{ old('symbol', $currency->symbol ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Photo</label>
    @if(isset($currency->photo) && $currency->photo)
        <br><img src="{{ asset('storage/' . $currency->photo) }}" width="100">
    @endif
    <input type="file" name="photo" class="form-control">
</div>
<button class="btn btn-info">{{ $mode === 'edit' ? 'Update' : 'Create' }}</button>