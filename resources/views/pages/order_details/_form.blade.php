@csrf
@if ($mode === 'edit')
    @method('PUT')
@endif

<div class="mb-2">
    <label>Purchase</label>
    <select name="purchase_id" class="form-select">
        <option value="">--- Select Purchase ---</option>
        @foreach ($purchases as $option)
            <option value="{{ $option->id }}" {{ old('purchase_id', $orderDetail->purchase_id ?? '') == $option->id ? 'selected' : '' }}>{{ $option->name ?? $option->id }}</option>
        @endforeach
    </select>
</div>
<div class="mb-2">
    <label>Currency</label>
    <select name="currency_id" class="form-select">
        <option value="">--- Select Currency ---</option>
        @foreach ($currencies as $option)
            <option value="{{ $option->id }}" {{ old('currency_id', $orderDetail->currency_id ?? '') == $option->id ? 'selected' : '' }}>{{ $option->name ?? $option->id }}</option>
        @endforeach
    </select>
</div>
<div class="mb-2">
    <label>Qty</label>
    <input type="text" name="qty" value="{{ old('qty', $orderDetail->qty ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Vat</label>
    <input type="text" name="vat" value="{{ old('vat', $orderDetail->vat ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Discount</label>
    <input type="text" name="discount" value="{{ old('discount', $orderDetail->discount ?? '') }}" class="form-control">
</div>
<button class="btn btn-info">{{ $mode === 'edit' ? 'Update' : 'Create' }}</button>