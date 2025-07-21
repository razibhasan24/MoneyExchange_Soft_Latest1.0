@extends('layouts.master')
@section('page-title', 'MoneyReceipt Details')
@section('pages')
    <div class="page-inner">
        <!-- Page Header -->
        <div class="card bg-info mb-3 p-4">
            <div class="row">
                <div class="col-12 d-flex justify-content-between align-items-center">
                    <h3 class="card-title text-white d-flex align-items-center m-0">
                         MoneyReceipt Details
                    </h3>
                    <div>
                        <a href="{{ route('money_receipts.index') }}" class="btn btn-light btn-sm" title="Back">
                            <i class="fa fa-arrow-left mr-1"></i> Back
                        </a>
                        <a href="{{ route('money_receipts.edit', $moneyReceipt->id) }}" class="btn btn-warning btn-sm" title="Edit">
                            <i class="fa fa-edit mr-1"></i> Edit
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover table-striped">
                        <tbody>
                                            <tr>
                    <th>Id</th>
                    <td>{{ $moneyReceipt->id ?? 'N/A' }}</td>
                </tr>                <tr>
                    <th>Receipt number</th>
                    <td>{{ $moneyReceipt->receipt_number ?? 'N/A' }}</td>
                </tr>                <tr>
                    <th>Transaction id</th>
                    <td>{{ $moneyReceipt->transaction->name ?? $moneyReceipt->transaction_id }}</td>
                </tr>                <tr>
                    <th>Customer id</th>
                    <td>{{ $moneyReceipt->customer->name ?? $moneyReceipt->customer_id }}</td>
                </tr>                <tr>
                    <th>Agent id</th>
                    <td>{{ $moneyReceipt->agent->name ?? $moneyReceipt->agent_id }}</td>
                </tr>                <tr>
                    <th>Total amount</th>
                    <td>{{ $moneyReceipt->total_amount ?? 'N/A' }}</td>
                </tr>                <tr>
                    <th>Payment method</th>
                    <td>{{ $moneyReceipt->payment_method ?? 'N/A' }}</td>
                </tr>                <tr>
                    <th>Status</th>
                    <td>{{ $moneyReceipt->status ?? 'N/A' }}</td>
                </tr>                <tr>
                    <th>Issued by</th>
                    <td>{{ $moneyReceipt->issued_by ?? 'N/A' }}</td>
                </tr>                <tr>
                    <th>Issued date</th>
                    <td>{{ $moneyReceipt->issued_date ?? 'N/A' }}</td>
                </tr>                <tr>
                    <th>Notes</th>
                    <td>{{ $moneyReceipt->notes ?? 'N/A' }}</td>
                </tr>                <tr>
                    <th>Created at</th>
                    <td>{{ $moneyReceipt->created_at ?? 'N/A' }}</td>
                </tr>                <tr>
                    <th>Updated at</th>
                    <td>{{ $moneyReceipt->updated_at ?? 'N/A' }}</td>
                </tr>                <tr>
                    <th>Created At</th>

                    <td>{{ $moneyReceipt->created_at->format('M d, Y h:i A') }}</td>
                </tr>                <tr>
                    <th>Updated At</th>

                    <td>{{ $moneyReceipt->updated_at->format('M d, Y h:i A') }}</td>
                </tr>
                        </tbody>
                    </table>
                </div>

                <div class="mt-4 d-flex justify-content-between">
                    <form action="{{ route('money_receipts.destroy', $moneyReceipt->id) }}" method="POST">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this?')">
                            <i class="fas fa-trash mr-1"></i> Delete
                        </button>
                    </form>

                    @if(isset($moneyReceipt->status))
                        <span class="badge
                            @if($moneyReceipt->status == 'active') bg-success @endif
                            @if($moneyReceipt->status == 'inactive') bg-danger @endif
                            @if($moneyReceipt->status == 'pending') bg-warning @endif">
                            {{ ucfirst($moneyReceipt->status) }}
                        </span>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection

@push('styles')
<style>
    .table th {
        width: 30%;
        background-color: #f8f9fa;
    }
    .img-thumbnail {
        max-height: 200px;
        object-fit: contain;
        background-color: #f8f9fa;
        border: 1px solid #dee2e6;
    }
    .badge {
        font-size: 0.85rem;
        padding: 0.5rem 0.75rem;
    }
    .bg-success {
        background-color: #28a745 !important;
    }
    .bg-danger {
        background-color: #dc3545 !important;
    }
    .bg-warning {
        background-color: #ffc107 !important;
        color: #212529;
    }
</style>
@endpush