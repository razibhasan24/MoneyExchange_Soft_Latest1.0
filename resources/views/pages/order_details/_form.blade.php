@csrf
@if ($mode === 'edit')
    @method('PUT')
@endif

<div class="mb-2">
    <label>Order</label>
    <select name="order_id" class="form-select">
        <option value="">--- Select Order ---</option>
        @foreach ($orders as $option)
            <option value="{{ $option->id }}" {{ old('order_id', $orderDetail->order_id ?? '') == $option->id ? 'selected' : '' }}>{{ $option->name ?? $option->id }}</option>
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
    <label>Rate</label>
    <input type="text" name="rate" value="{{ old('rate', $orderDetail->rate ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Vat</label>
    <input type="text" name="vat" value="{{ old('vat', $orderDetail->vat ?? '') }}" class="form-control">
</div>
<button class="btn btn-info">{{ $mode === 'edit' ? 'Update' : 'Create' }}</button>