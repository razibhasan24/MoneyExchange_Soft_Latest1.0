@csrf
@if ($mode === 'edit')
    @method('PUT')
@endif

<div class="mb-2">
    <label>Currency</label>
    <select name="currency_id" class="form-select">
        <option value="">--- Select Currency ---</option>
        @foreach ($currencies as $option)
            <option value="{{ $option->id }}" {{ old('currency_id', $moneyStock->currency_id ?? '') == $option->id ? 'selected' : '' }}>{{ $option->name ?? $option->id }}</option>
        @endforeach
    </select>
</div>
<div class="mb-2">
    <label>Qty</label>
    <input type="text" name="qty" value="{{ old('qty', $moneyStock->qty ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Transaction_type</label>
    <input type="text" name="transaction_type" value="{{ old('transaction_type', $moneyStock->transaction_type ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Remarks</label>
    <input type="text" name="remarks" value="{{ old('remarks', $moneyStock->remarks ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Purchase</label>
    <select name="purchase_id" class="form-select">
        <option value="">--- Select Purchase ---</option>
        @foreach ($purchases as $option)
            <option value="{{ $option->id }}" {{ old('purchase_id', $moneyStock->purchase_id ?? '') == $option->id ? 'selected' : '' }}>{{ $option->name ?? $option->id }}</option>
        @endforeach
    </select>
</div>
<button class="btn btn-info">{{ $mode === 'edit' ? 'Update' : 'Create' }}</button>