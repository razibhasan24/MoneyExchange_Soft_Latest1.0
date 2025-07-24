@extends('layouts.master')

@section('page-title', 'View Money Receipt')

@section('pages')

<style>
    @media print {
        .no-print {
            display: none !important;
        }
    }

    .receipt-container {
        max-width: 70vw;
        margin: 30px auto;
        background: #fff;
        padding: 30px;
        box-shadow: 0 0 5px #ccc;
        font-family: Arial, sans-serif;
    }

    .main-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
    }

    .main-header img {
        max-height: 100px;
    }

    h2 {
        color: #003366;
        text-align: center;
        margin-bottom: 30px;
    }

    .info-section {
        margin-bottom: 20px;
    }

    .info-section label {
        font-weight: bold;
        display: inline-block;
        min-width: 150px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 25px;
    }

    th, td {
        border: 1px solid #003366;
        padding: 10px;
        text-align: center;
    }

    th {
        background-color: #003366;
        color: #fff;
    }
</style>

<div class="receipt-container" id="receipt-content">
    <!-- Header -->
    <div class="main-header">
        <div>
            <img src="{{ asset('assets/img/logos/money-exchange-logo.png') }}" alt="Logo">
        </div>
        <div style="text-align:right;">
            <p><strong>Money Exchange Company Ltd.</strong></p>
            <p>123 Exchange Road, Dhaka</p>
            <p>info@moneyexchange.com</p>
        </div>
    </div>

    <!-- Title -->
    <h2>Money Receipt</h2>

    <!-- Info Section -->
    <div class="info-section">
        <p><label>Receipt No:</label> {{ $receipt->receipt_number }}</p>
        <p><label>Transaction ID:</label> {{ $receipt->transaction->status ?? 'N/A' }}</p>
        <p><label>Customer:</label> {{ $receipt->customer->name ?? 'N/A' }}</p>
        <p><label>Agent:</label> {{ $receipt->agent->name ?? 'N/A' }}</p>
        <p><label>Total Amount:</label> {{ number_format($receipt->total_amount, 2) }}</p>
        <p><label>Payment Method:</label> {{ $receipt->paymentMethod->payment_method ?? 'N/A' }}</p>
        <p><label>Status:</label> {{ $receipt->status->name ?? 'N/A' }}</p>
        <p><label>Issued By:</label> {{ $receipt->issued_by }}</p>
        <p><label>Issued Date:</label> {{ \Carbon\Carbon::parse($receipt->issued_date)->format('d M Y') }}</p>
        <p><label>Notes:</label> {{ $receipt->notes ?? '-' }}</p>
    </div>

    <!-- Detail Table -->
    <table>
        <thead>
            <tr>
                <th>Currency Code</th>
                <th>Amount</th>
                <th>Exchange Rate</th>
                <th>Equivalent Amount</th>
                <th>Fee</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($receipt->details as $detail)
                <tr>
                    <td>{{ $detail->currency->currency_code ?? '-' }}</td>
                    <td>{{ number_format($detail->amount, 2) }}</td>
                    <td>{{ number_format($detail->exchange_rate, 2) }}</td>
                    <td>{{ number_format($detail->equivalent_amount, 2) }}</td>
                    <td>{{ number_format($detail->fee, 2) }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</div>

<!-- ✅ Print & PDF Buttons -->
<div class="no-print" style="text-align: center; margin-top: 30px;">
    <button onclick="window.print()" class="btn btn-primary">🖨️ Print</button>
    <a href="{{ route('receipts.download.pdf', $receipt->id) }}" class="btn btn-danger">⬇️ Download PDF</a>
</div>

@endsection
