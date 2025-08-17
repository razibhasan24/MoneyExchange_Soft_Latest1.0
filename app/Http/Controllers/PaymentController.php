<?php

// namespace App\Http\Controllers;

// use App\Models\Payment;
// use Illuminate\Http\Request;
// use App\Models\User;
// use App\Models\Transaction;


// class PaymentController extends Controller
// {
//     public function index()
//     {
//         $payments = Payment::orderBy('id','DESC')->paginate(10);
//         return view('pages.payments.index', compact('payments'));
//     }

//     public function create()
//     {
//         $users = \App\Models\User::all();
//         $transactions = \App\Models\Transaction::all();

//         return view('pages.payments.create', [
//             'mode' => 'create',
//             'payment' => new Payment(),
//             'users' => $users,
//             'transactions' => $transactions,

//         ]);
//     }

//     public function store(Request $request)
//     {
//         $data = $request->all();
//         if ($request->hasFile('photo')) {
//             $data['photo'] = $request->file('photo')->store('uploads', 'public');
//         }
//         Payment::create($data);
//         return redirect()->route('payments.index')->with('success', 'Successfully created!');
//     }

//     public function show(Payment $payment)
//     {
//         return view('pages.payments.view', compact('payment'));
//     }

//     public function edit(Payment $payment)
//     {
//         $users = \App\Models\User::all();
//         $transactions = \App\Models\Transaction::all();

//         return view('pages.payments.edit', [
//             'mode' => 'edit',
//             'payment' => $payment,
//             'users' => $users,
//             'transactions' => $transactions,

//         ]);
//     }

//     public function update(Request $request, Payment $payment)
//     {
//         $data = $request->all();
//         if ($request->hasFile('photo')) {
//             $data['photo'] = $request->file('photo')->store('uploads', 'public');
//         }
//         $payment->update($data);
//         return redirect()->route('payments.index')->with('success', 'Successfully updated!');
//     }

//     public function destroy(Payment $payment)
//     {
//         $payment->delete();
//         return redirect()->route('payments.index')->with('success', 'Successfully deleted!');
//     }
// }


namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Stripe\Stripe;
use Stripe\Checkout\Session;
use App\Models\Payment;
use Illuminate\Support\Facades\Auth;

class PaymentController extends Controller
{
    public function checkout()
    {
        Stripe::setApiKey(env('STRIPE_SECRET'));

        $checkout_session = Session::create([
            'payment_method_types' => ['card'],
            'line_items' => [[
                'price_data' => [
                    'currency' => 'usd',
                    'product_data' => [
                        'name' => 'Test Product',
                    ],
                    'unit_amount' => 5000, // $50.00
                ],
                'quantity' => 1,
            ]],
            'mode' => 'payment',
            'success_url' => route('payment.success') . '?session_id={CHECKOUT_SESSION_ID}',
            'cancel_url' => route('payment.cancel'),
        ]);

        return redirect($checkout_session->url);
    }

    public function success(Request $request)
    {
        Stripe::setApiKey(env('STRIPE_SECRET'));

        $session = Session::retrieve($request->get('session_id'));
        $customer = $session->customer;

        // Save to database
        Payment::create([
            'user_id' => Auth::id(),
            'amount' => $session->amount_total / 100,
            'currency' => $session->currency,
            'transaction_id' => $session->payment_intent,
            'payment_status' => 'success',
            'payment_date' => now(),
        ]);

        return "Payment Successful!";
    }

    public function cancel()
    {
        return "Payment Canceled!";
    }
    public function show()
    {
        return view('pages.payments.payment');
    }
}