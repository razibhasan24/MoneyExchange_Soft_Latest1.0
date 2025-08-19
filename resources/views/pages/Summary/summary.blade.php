@extends('layouts.master')

@section('pages')

{{-- ✅ Custom CSS for Gradient Borders --}}
<style>
.gradient-border {
    border: 2px solid;
    border-image-slice: 1;
    border-image-source: linear-gradient(45deg, #007bff, #00c6ff);
    border-radius: 10px;
}

.card-title {
    font-weight: 600;
    font-size: 1rem;
}

.card-text {
    font-size: 1.5rem;
    font-weight: bold;
}
</style>

<div class="container py-4">
    <h2 class="mb-5 text-center text-uppercase text-primary fw-bold">📊 Databases Records Summary</h2>

    <div class="row g-4">

        {{-- Invoices --}}
        <div class="col-md-3 col-sm-6">
            <div class="card bg-white gradient-border shadow-sm mb-4">
                <div class="card-body text-center">
                    <h6 class="card-title text-primary">Invoices</h6>
                    <p class="card-text text-dark">{{ $invoiceCount }}</p>
                </div>
            </div>
        </div>

        {{-- Currencies --}}
        <div class="col-md-3 col-sm-6">
            <div class="card bg-white gradient-border shadow-sm mb-4">
                <div class="card-body text-center">
                    <h6 class="card-title text-info">Currencies</h6>
                    <p class="card-text text-dark">{{ $currencyCount }}</p>
                </div>
            </div>
        </div>

        {{-- Purchases --}}
        <div class="col-md-3 col-sm-6">
            <div class="card bg-white gradient-border shadow-sm mb-4">
                <div class="card-body text-center">
                    <h6 class="card-title text-success">Purchases</h6>
                    <p class="card-text text-dark">{{ $purchaseCount }}</p>
                </div>
            </div>
        </div>

        {{-- Orders --}}
        <div class="col-md-3 col-sm-6">
            <div class="card bg-white gradient-border shadow-sm mb-4">
                <div class="card-body text-center">
                    <h6 class="card-title text-warning">Orders</h6>
                    <p class="card-text text-dark">{{ $ordersCount }}</p>
                </div>
            </div>
        </div>

        {{-- Money Receipts --}}
        <div class="col-md-3 col-sm-6">
            <div class="card bg-white gradient-border shadow-sm mb-4">
                <div class="card-body text-center">
                    <h6 class="card-title text-secondary">Money Receipts</h6>
                    <p class="card-text text-dark">{{ $receiptsCount }}</p>
                </div>
            </div>
        </div>

        {{-- Customers --}}
        <div class="col-md-3 col-sm-6">
            <div class="card bg-white gradient-border shadow-sm mb-4">
                <div class="card-body text-center">
                    <h6 class="card-title text-dark">Customers</h6>
                    <p class="card-text text-dark">{{ $customerCount }}</p>
                </div>
            </div>
        </div>

        {{-- Transactions --}}
        <div class="col-md-3 col-sm-6">
            <div class="card bg-white gradient-border shadow-sm mb-4">
                <div class="card-body text-center">
                    <h6 class="card-title text-danger">Transactions</h6>
                    <p class="card-text text-dark">{{ $transactionCount }}</p>
                </div>
            </div>
        </div>

        {{-- Payments --}}
        <div class="col-md-3 col-sm-6">
            <div class="card bg-white gradient-border shadow-sm mb-4">
                <div class="card-body text-center">
                    <h6 class="card-title" style="color: #20c997;">Payments</h6>
                    <p class="card-text text-dark">{{ $paymentCount }}</p>
                </div>
            </div>
        </div>

    </div>
</div>

@endsection