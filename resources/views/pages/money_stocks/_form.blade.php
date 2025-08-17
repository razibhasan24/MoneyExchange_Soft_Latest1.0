@extends('layouts.master')
@section('page-title', $mode == 'edit' ? 'Edit MoneyStock' : 'Create MoneyStock')
@section('pages')

<div class="page-inner">
    <div class="card p-4">
        <h3>{{ $mode == 'edit' ? 'Edit MoneyStock' : 'Create MoneyStock' }}</h3>

        @if ($mode == 'edit')
        <form action="{{ route('money_stocks.update', $moneyStock->id) }}" method="POST" enctype="multipart/form-data">
            @method('PUT')
            @else
            <form action="{{ route('money_stocks.store') }}" method="POST" enctype="multipart/form-data">
                @endif
                @csrf

                <div class="form-group">
                    <label for="currency_id">Currency</label>
                    <select name="currency_id" id="currency_id" class="form-control">
                        @foreach ($currencies as $currency)
                        <option value="{{ $currency->id }}"
                            {{ old('currency_id', $moneyStock->currency_id) == $currency->id ? 'selected' : '' }}>
                            {{ $currency->currency_name }}
                        </option>
                        @endforeach
                    </select>
                </div>

                <div class="form-group">
                    <label for="qty">Quantity</label>
                    <input type="number" name="qty" id="qty" class="form-control"
                        value="{{ old('qty', $moneyStock->qty) }}" required>
                </div>

                <div class="form-group">
                    <label for="transaction_type">Transaction Type</label>
                    <input type="text" name="transaction_type" id="transaction_type" class="form-control"
                        value="{{ old('transaction_type', $moneyStock->transaction_type) }}">
                </div>

                <div class="form-group">
                    <label for="remarks">Remarks</label>
                    <textarea name="remarks" id="remarks"
                        class="form-control">{{ old('remarks', $moneyStock->remarks) }}</textarea>
                </div>

                <div class="form-group">
                    <label for="purchase_id">Purchase</label>
                    <select name="purchase_id" id="purchase_id" class="form-control">
                        @foreach ($purchases as $purchase)
                        <option value="{{ $purchase->id }}"
                            {{ old('purchase_id', $moneyStock->purchase_id) == $purchase->id ? 'selected' : '' }}>
                            {{ $purchase->name }}
                        </option>
                        @endforeach
                    </select>
                </div>

                <div class="form-group">
                    <label for="photo">Photo</label>
                    <input type="file" name="photo" id="photo" class="form-control-file">
                    @if ($mode == 'edit' && $moneyStock->photo)
                    <img src="{{ asset('storage/' . $moneyStock->photo) }}" alt="Photo" width="100" class="mt-2">
                    @endif
                </div>

                <button type="submit" class="btn btn-primary">{{ $mode == 'edit' ? 'Update' : 'Create' }}</button>
                <a href="{{ route('money_stocks.index') }}" class="btn btn-secondary">Cancel</a>
            </form>
    </div>
</div>

@endsection