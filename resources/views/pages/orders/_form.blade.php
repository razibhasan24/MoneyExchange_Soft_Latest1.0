@csrf
@if ($mode === 'edit')
    @method('PUT')
@endif

<div class="mb-2">
    <label>Customer</label>
    <select name="customer_id" class="form-select">
        <option value="">--- Select Customer ---</option>
        @foreach ($customers as $option)
            <option value="{{ $option->id }}" {{ old('customer_id', $order->customer_id ?? '') == $option->id ? 'selected' : '' }}>{{ $option->name ?? $option->id }}</option>
        @endforeach
    </select>
</div>
<div class="mb-2">
    <label>Order_date</label>
    <input type="date" name="order_date" value="{{ old('order_date', $order->order_date ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Order_total</label>
    <input type="text" name="order_total" value="{{ old('order_total', $order->order_total ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Status</label>
    <select name="status_id" class="form-select">
        <option value="">--- Select Status ---</option>
        @foreach ($statuses as $option)
            <option value="{{ $option->id }}" {{ old('status_id', $order->status_id ?? '') == $option->id ? 'selected' : '' }}>{{ $option->name ?? $option->id }}</option>
        @endforeach
    </select>
</div>
<div class="mb-2">
    <label>Remarks</label>
    <input type="text" name="remarks" value="{{ old('remarks', $order->remarks ?? '') }}" class="form-control">
</div>
<button class="btn btn-info">{{ $mode === 'edit' ? 'Update' : 'Create' }}</button>