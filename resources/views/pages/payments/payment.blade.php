@extends('layouts.master')
@section('page-title', 'Edit Payment')
@section('pages')


<div class="bg-gray-100 text-gray-800">

    <div class="min-h-screen flex items-center justify-center">
        <div class="bg-white shadow-lg rounded-lg p-8 w-full max-w-md">
            <div class="mb-6 text-center">
                <h2 class="text-2xl font-bold text-blue-600">Stripe Payment</h2>
                <p class="text-sm text-gray-500">Pay securely using Stripe Checkout</p>
            </div>

            <div class="mb-4">
                <p class="text-lg font-semibold">Product: <span class="text-gray-700">Laravel Stripe Integration</span>
                </p>
                <p class="text-lg font-semibold">Price: <span class="text-green-600">$50.00</span></p>
            </div>

            <form action="{{ route('checkout') }}" method="GET">
                <button type="submit"
                    class="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-4 rounded">
                    Pay with Stripe
                </button>
            </form>

            <div class="mt-6 text-center">
                <p class="text-xs text-gray-400">Test mode enabled. Use card: <span class="font-mono">4242 4242 4242
                        4242</span></p>
            </div>
        </div>
    </div>

</div>

@endsection