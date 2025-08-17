@extends('layouts.master')
@section('page-title', $mode == 'edit' ? 'Edit MoneyStock' : 'Create MoneyStock')
@section('pages')

<div class="page-inner">
    <!-- Page Header -->
    <div class="card bg-info mb-4 p-3">
        <div class="d-flex justify-content-between align-items-center">
            <h3 class="text-white m-0">{{ $mode == 'edit' ? 'Edit MoneyStock' : 'Create MoneyStock' }}</h3>
            <a href="{{ route('money_stocks.index') }}" class="btn btn-light btn-sm">
                <i class="fa fa-arrow-left mr-1"></i> Back
            </a>
        </div>
    </div>

    <div class="card p-4 shadow-sm">
        <form method="POST"
            action="{{ $mode == 'edit' ? route('money_stocks.update', $moneyStock->id) : route('money_stocks.store') }}"
            enctype="multipart/form-data">
            @csrf
            @if ($mode == 'edit')
            @method('PUT')
            @endif

            <!-- Quantity -->
            <div class="form-group mb-3">
                <label for="qty" class="form-label font-weight-bold">Quantity <span class="text-danger">*</span></label>
                <input type="number" id="qty" name="qty" class="form-control @error('qty') is-invalid @enderror"
                    value="{{ old('qty', $moneyStock->qty) }}" placeholder="Enter quantity" required>
                @error('qty')
                <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <!-- Currency -->
            <div class="form-group mb-3">
                <label for="currency_id" class="form-label font-weight-bold">Currency <span
                        class="text-danger">*</span></label>
                <select name="currency_id" id="currency_id"
                    class="form-control @error('currency_id') is-invalid @enderror" required>
                    <option value="" disabled>Select currency</option>
                    @foreach ($currencies as $currency)
                    <option value="{{ $currency->id }}"
                        {{ (old('currency_id', $moneyStock->currency_id) == $currency->id) ? 'selected' : '' }}>
                        {{ $currency->currency_name }}
                    </option>
                    @endforeach
                </select>
                @error('currency_id')
                <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <!-- Photo -->
            <div class="form-group mb-4">
                <label for="photo" class="form-label font-weight-bold">Photo</label>
                <input type="file" id="photo" name="photo"
                    class="form-control-file @error('photo') is-invalid @enderror">
                @if ($mode == 'edit' && $moneyStock->photo)
                <div class="mt-3">
                    <img src="{{ asset('storage/' . $moneyStock->photo) }}" alt="Current Photo"
                        style="max-height: 150px; border-radius: 6px;">
                </div>
                @endif
                @error('photo')
                <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary">
                {{ $mode == 'edit' ? 'Update MoneyStock' : 'Create MoneyStock' }}
            </button>
        </form>
    </div>
</div>

@endsection