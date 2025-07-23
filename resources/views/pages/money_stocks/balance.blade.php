@extends('layouts.master')
@section('page-title', 'Create MoneyStock')
@section('pages')
<div class="page-inner">
    <!-- Page Header -->
    <div class="card bg-info mb-3 p-4">
        <div class="row">
            <div class="col-12 d-flex justify-content-between align-item-center ">
                <h3 class=" card-title text-white d-flex align-items-center  m-0">Create MoneyStock</h3>
                <a href="{{ route('money_stocks.index') }}" class="btn btn-light btn-sm" title="Back">
                    <i class="fa fa-arrow-left mr-1"></i> Back
                </a>
            </div>
        </div>
    </div>

    <div class="card">
        <table class="table">
            <tr>
                <th>#ID</th>
                <th>Currency</th>
                <th>Quantity</th>
            </tr>

            @foreach($groupedStocks as $stock)
            <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $stock['currency_name'] }} (ID:{{ $stock['currency_id'] }})</td>
                <td>{{ $stock['qty'] }}</td>
            </tr>
            @endforeach

        </table>
    </div>
</div>
@endsection