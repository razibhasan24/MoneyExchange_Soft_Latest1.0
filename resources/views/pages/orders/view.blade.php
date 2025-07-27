@extends('layouts.master')
@section('page-title', 'Order Details')
@section('pages')
    <div class="page-inner">
        <!-- Page Header -->
        <div class="card bg-info mb-3 p-4">
            <div class="row">
                <div class="col-12 d-flex justify-content-between align-items-center">
                    <h3 class="card-title text-white d-flex align-items-center m-0">
                         Order Details
                    </h3>
                    <div>
                        <a href="{{ route('orders.index') }}" class="btn btn-light btn-sm" title="Back">
                            <i class="fa fa-arrow-left mr-1"></i> Back
                        </a>
                        <a href="{{ route('orders.edit', $order->id) }}" class="btn btn-warning btn-sm" title="Edit">
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
                    <td>{{ $order->id ?? 'N/A' }}</td>
                </tr>                <tr>
                    <th>Customer id</th>
                    <td>{{ $order->customer->name ?? $order->customer_id }}</td>
                </tr>                <tr>
                    <th>Order date</th>
                    <td>{{ $order->order_date ?? 'N/A' }}</td>
                </tr>                <tr>
                    <th>Order total</th>
                    <td>{{ $order->order_total ?? 'N/A' }}</td>
                </tr>                <tr>
                    <th>Status id</th>
                    <td>{{ $order->status->name ?? $order->status_id }}</td>
                </tr>                <tr>
                    <th>Paid amount</th>
                    <td>{{ $order->paid_amount ?? 'N/A' }}</td>
                </tr>                <tr>
                    <th>Remarks</th>
                    <td>{{ $order->remarks ?? 'N/A' }}</td>
                </tr>                <tr>
                    <th>Created at</th>
                    <td>{{ $order->created_at ?? 'N/A' }}</td>
                </tr>                <tr>
                    <th>Updated at</th>
                    <td>{{ $order->updated_at ?? 'N/A' }}</td>
                </tr>                <tr>
                    <th>Created At</th>

                    <td>{{ $modelVar->created_at->format('M d, Y h:i A') }}</td>
                </tr>                <tr>
                    <th>Updated At</th>

                    <td>{{ $modelVar->updated_at->format('M d, Y h:i A') }}</td>
                </tr>
                        </tbody>
                    </table>
                </div>

                <div class="mt-4 d-flex justify-content-between">
                    <form action="{{ route('orders.destroy', $order->id) }}" method="POST">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this?')">
                            <i class="fas fa-trash mr-1"></i> Delete
                        </button>
                    </form>

                    @if(isset($order->status))
                        <span class="badge
                            @if($order->status == 'active') bg-success @endif
                            @if($order->status == 'inactive') bg-danger @endif
                            @if($order->status == 'pending') bg-warning @endif">
                            {{ ucfirst($order->status) }}
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