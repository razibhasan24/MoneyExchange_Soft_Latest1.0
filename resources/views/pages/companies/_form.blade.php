@csrf
@if ($mode === 'edit')
    @method('PUT')
@endif

<div class="mb-2">
    <label>Name</label>
    <input type="text" name="name" value="{{ old('name', $company->name ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Address</label>
    <input type="text" name="address" value="{{ old('address', $company->address ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Phone</label>
    <input type="text" name="phone" value="{{ old('phone', $company->phone ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Email</label>
    <input type="email" name="email" value="{{ old('email', $company->email ?? '') }}" class="form-control">
</div>
<div class="mb-2">
    <label>Status</label>
    <input type="text" name="status" value="{{ old('status', $company->status ?? '') }}" class="form-control">
</div>
<button class="btn btn-info">{{ $mode === 'edit' ? 'Update' : 'Create' }}</button>