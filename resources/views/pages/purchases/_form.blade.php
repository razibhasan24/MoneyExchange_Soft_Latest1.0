@csrf
@if ($mode === 'edit')
    @method('PUT')
@endif

<div class="mb-2">
    <label>Agent</label>
    <select name="agent_id" class="form-select">
        <option value="">--- Select Agent ---</option>
        @foreach ($agents as $option)
            <option value="{{ $option->id }}" {{ old('agent_id', $purchase->agent_id ?? '') == $option->id ? 'selected' : '' }}>{{ $option->name ?? $option->id }}</option>
        @endforeach
    </select>
</div>
<div class="mb-2">
    <label>Status</label>
    <select name="status_id" class="form-select">
        <option value="">--- Select Status ---</option>
        @foreach ($statuses as $option)
            <option value="{{ $option->id }}" {{ old('status_id', $purchase->status_id ?? '') == $option->id ? 'selected' : '' }}>{{ $option->name ?? $option->id }}</option>
        @endforeach
    </select>
</div>
<div class="mb-2">
    <label>Purchase_date</label>
    <input type="date" name="purchase_date" value="{{ old('purchase_date', $purchase->purchase_date ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Remarks</label>
    <input type="text" name="remarks" value="{{ old('remarks', $purchase->remarks ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Purchase_total</label>
    <input type="text" name="purchase_total" value="{{ old('purchase_total', $purchase->purchase_total ?? '') }}" class="form-control">
</div>
<button class="btn btn-info">{{ $mode === 'edit' ? 'Update' : 'Create' }}</button>