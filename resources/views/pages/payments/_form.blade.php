@csrf
@if ($mode === 'edit')
    @method('PUT')
@endif

<div class="mb-2">
    <label>User</label>
    <select name="user_id" class="form-select">
        <option value="">--- Select User ---</option>
        @foreach ($users as $option)
            <option value="{{ $option->id }}" {{ old('user_id', $payment->user_id ?? '') == $option->id ? 'selected' : '' }}>{{ $option->name ?? $option->id }}</option>
        @endforeach
    </select>
</div>
<div class="mb-2">
    <label>Amount</label>
    <input type="text" name="amount" value="{{ old('amount', $payment->amount ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Currency</label>
    <input type="text" name="currency" value="{{ old('currency', $payment->currency ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Transaction</label>
    <select name="transaction_id" class="form-select">
        <option value="">--- Select Transaction ---</option>
        @foreach ($transactions as $option)
            <option value="{{ $option->id }}" {{ old('transaction_id', $payment->transaction_id ?? '') == $option->id ? 'selected' : '' }}>{{ $option->name ?? $option->id }}</option>
        @endforeach
    </select>
</div>
<div class="mb-2">
    <label>Payment_method</label>
    <input type="text" name="payment_method" value="{{ old('payment_method', $payment->payment_method ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Payment_status</label>
    <input type="text" name="payment_status" value="{{ old('payment_status', $payment->payment_status ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Payment_date</label>
    <input type="date" name="payment_date" value="{{ old('payment_date', $payment->payment_date ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Invoice_no</label>
    <input type="text" name="invoice_no" value="{{ old('invoice_no', $payment->invoice_no ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Description</label>
    <input type="text" name="description" value="{{ old('description', $payment->description ?? '') }}" class="form-control">
</div>
<button class="btn btn-info">{{ $mode === 'edit' ? 'Update' : 'Create' }}</button>