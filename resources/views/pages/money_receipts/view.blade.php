@extends('layouts.master')

@section('page-title', 'View Money Receipt')

@section('pages')

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3>Money Receipt #{{ $receipt->id }}</h3>
        <div>
            <button onclick="window.print()" class="btn btn-secondary">🖨️ Print</button>
        </div>
    </div>

    <!-- Master Info -->
    <div class="card mb-4">
        <div class="card-header bg-dark text-white">Receipt Summary</div>
        <div class="card-body">
            <p><strong>ID:</strong> {{ $receipt->id }}</p>
            <p><strong>Customer ID:</strong> {{ $receipt->customer_id }}</p>
            <p><strong>Remark:</strong> {{ $receipt->remark }}</p>
            <p><strong>Total:</strong> ${{ number_format($receipt->receipt_total, 2) }}</p>
            <p><strong>Discount:</strong> ${{ number_format($receipt->discount, 2) }}</p>
            <p><strong>VAT:</strong> ${{ number_format($receipt->vat, 2) }}</p>
            <p><strong>Created At:</strong> {{ $receipt->created_at->format('Y-m-d H:i') }}</p>
            <p><strong>Updated At:</strong> {{ $receipt->updated_at->format('Y-m-d H:i') }}</p>
        </div>
    </div>

    <!-- Receipt Details -->
    <div class="card">
        <div class="card-header bg-secondary text-white">Receipt Details</div>
        <div class="card-body p-0">
            <table class="table table-bordered mb-0">
                <thead class="bg-light">
                    <tr>
                        <th>#</th>
                        <th>Description</th>
                        <th>Amount</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($receipt->details as $index => $detail)
                        <tr>
                            <td>{{ $index + 1 }}</td>
                            <td>{{ $detail->description }}</td>
                            <td>${{ number_format($detail->amount, 2) }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>

@endsection
