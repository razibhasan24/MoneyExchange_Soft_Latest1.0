@extends('layouts.master')
@section('page-title', 'MoneyStock List')
@section('pages')

<div class="page-inner">
    <div class="card bg-info mb-3 p-4">
        <div class="row">
            <div class="col-12 d-flex justify-content-between align-item-center">
                <h3 class="card-title text-white m-0">MoneyStock List</h3>
                <a href="{{ route('money_stocks.create') }}" class="btn btn-light btn-sm" title="Create New MoneyStock">
                    <i class="fa fa-plus mr-1"></i> Create New MoneyStock
                </a>
            </div>
        </div>
    </div>

    <div class="card mb-3">
        <div class="table-responsive rounded-3">
            <table class="table table-hover">
                <thead class="table-primary">
                    <tr>
                        <th>Id</th>
                        <th>Currency</th>
                        <th>Qty</th>
                        <th>Transaction Type</th>
                        <th>Remarks</th>
                        <th>Purchase</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($moneyStocks as $stock)
                    <tr>
                        <td>{{ $stock->id }}</td>
                        <td>{{ optional($stock->currency)->currency_name ?? $stock->currency_id }}</td>
                        <td>{{ $stock->qty }}</td>
                        <td>{{ $stock->transaction_type }}</td>
                        <td>{{ $stock->remarks }}</td>
                        <td>{{ optional($stock->purchase)->name ?? $stock->purchase_id }}</td>
                        <td>
                            <a href="{{ route('money_stocks.show', $stock->id) }}" class="btn btn-sm btn-info">View</a>
                            <a href="{{ route('money_stocks.edit', $stock->id) }}"
                                class="btn btn-sm btn-warning">Edit</a>
                            <form action="{{ route('money_stocks.destroy', $stock->id) }}" method="POST"
                                style="display:inline;">
                                @csrf
                                @method('DELETE')
                                <button class="btn btn-sm btn-danger"
                                    onclick="return confirm('Are you sure?')">Delete</button>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        {{ $moneyStocks->links() }}
    </div>
</div>

@endsection