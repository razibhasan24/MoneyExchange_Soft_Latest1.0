@extends('layouts.master')
@section('page-title', 'Purchase Details')
@section('pages')

<style>
    .main-header {
        background-color: #ffffff;
        color: black;
        font-size: medium;
        padding: 15px 20px;
        border-radius: 0px;
        margin-bottom: 0;
        display: flex;
        justify-content: center;
    }

    .section-body {
        background-color: #ffffff;
        padding: 15px;
        border-radius: 0 0 5px 5px;
        box-shadow: 0 0 5px rgba(178, 176, 176, 0.1);
    }

    .table th,
    .table td {
        vertical-align: middle;
    }

    .form-control,
    .btn {
        font-size: 14px;
    }

    body {
        background-color: #f5f7fa;
        /* padding: 15px; */
        /* background-color: #f8f9fa; */
    }

    .header_all {
        background-color: #ffffff;
        color: black;
        padding: 20px;
        margin-top: 15px;
        text-align: space end;
    }

    .company-section {
        background-color: #ffffff;
        border-radius: 6px;
        /* box-shadow: 0 0 10px #292626; */
        padding: 20px;
        margin-bottom: 20px;

    }

    .footer {
        background-color: #ffffff;
        color: black;
        padding: 20px 0;
    }

    .footer a {
        color: #ddd;
        text-decoration: none;
    }

    .footer a:hover {
        text-decoration: underline;
    }

    .imageaa {
        display: flex;
        width: 550px;
        height: 150px;
    }
</style>

<div style="max-width: 70vw; margin: 0 auto;" class="container my-5 py-3">

    <!-- Header -->
    <header class="header_all">
        <div class="container d-flex align-items-center justify-content-between">
            <!-- Logo -->
            <div class="imageaa">
                <img src="{{ asset('assets/img/logos/mex_logo.png') }}" alt="logo">
            </div>

            <!-- Company Info -->
            <div class="text-end">
                <h1>Global Money Exchange</h1>
                <p><strong>Address:</strong> 123 Business Street, Dhaka, Bangladesh</p>
                <p><strong>Email:</strong> support@fastsend.com</p>
                <p><strong>Phone:</strong> +880 1234-567890</p>
                <p>Fast • Secure • Worldwide Transfers</p>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="main-header mt-4">
        <h4 class="m-0">Purchase Details - #{{ $purchase->id }}</h4>
    </div>

    <div class="section-body">
        <!-- Master Info -->
        <div class="row mb-3">
            <div class="col-md-3">
                <label class="form-label">Agent Name:</label>
                <p class="form-control">{{ $purchase->agent->name ?? 'N/A' }}</p>
            </div>
            <div class="col-md-3">
                <label class="form-label">Status:</label>
                <p class="form-control">{{ $purchase->status->name ?? 'N/A' }}</p>
            </div>
            <div class="col-md-3">
                <label class="form-label">Purchase Date:</label>
                <p class="form-control">{{ \Carbon\Carbon::parse($purchase->purchase_date)->format('d M Y') }}</p>
            </div>
            <div class="col-md-3">
                <label class="form-label">Total:</label>
                <p class="form-control">{{ number_format($purchase->purchase_total, 2) }}</p>
            </div>
        </div>

        <div class="mb-3">
            <label class="form-label">Remarks:</label>
            <p class="form-control">{{ $purchase->remarks }}</p>
        </div>

        <hr>

        <!-- Items Table -->
        <h5 class="text-primary">Item Details</h5>
        <div class="table-responsive">
            <table class="table table-bordered table-sm">
                <thead class="table-light">
                    <tr>
                        <th>#</th>
                        <th>Currency</th>
                        <th>Qty</th>
                        <th>Rate</th>
                        <th>VAT</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($purchase->details as $index => $detail)
                    <tr>
                        <td>{{ $index + 1 }}</td>
                        <td>{{ $detail->currency->currency_name ?? 'N/A' }}</td>
                        <td>{{ $detail->qty }}</td>
                        <td>{{ number_format($detail->rate, 2) }}</td>
                        <td>{{ number_format($detail->vat, 2) }}</td>
                        <td>{{ number_format($detail->total, 2) }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        <div class="text-end mt-4">
            <a href="{{ route('purchases.index') }}" class="btn btn-secondary">Back to List</a>
        </div>
    </div>

    <!-- Footer -->
    <footer class="text-center mt-5">
        <div class="container">
            <p class="mb-1">&copy; 2025 Global Money Exchange. All Rights Reserved.</p>
            <div>
                <a href="#">Privacy Policy</a> |
                <a href="#">Terms of Service</a> |
                <a href="#">Support</a>
            </div>
        </div>
    </footer>

</div>

@endsection
