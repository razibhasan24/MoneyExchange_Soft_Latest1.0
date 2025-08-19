@extends('layouts.master')
@section('page-title', 'Create Order')
@section('pages')

<style>
.imageaa {
    display: flex;
    width: 550px;
    height: 150px;
}

body {
    background-color: #f5f7fa;
}

.header_all {
    background-color: #ffffff;
    color: black;
    padding: 20px;
    margin-top: 15px;
}

.company-section {
    background-color: #ffffff;
    border-radius: 6px;
    padding: 20px;
}

.form-section {
    background-color: white;
    padding: 30px;
    border-radius: 8px;
    margin-top: -32px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

table td,
table th {
    vertical-align: middle;
}

.btn-primary {
    background-color: #198754;
    border-color: #198754;
}

.btn-primary:hover {
    background-color: #157347;
}
</style>

<div style="max-width: 70vw; margin: 0 auto;" class="container my-5 py-3">
    <header class="header_all">
        <div class="container d-flex align-items-center justify-content-between">
            <div class="imageaa">
                <img src="{{ asset('assets/img/logos/mex_logo.png') }}" alt="logo">
            </div>
            <div class="text-end m-title">
                <h1>Global Money Exchange</h1>
                <p><strong>Address:</strong> 123 Business Street, Dhaka, Bangladesh</p>
                <p><strong>Email:</strong> support@fastsend.com</p>
                <p><strong>Phone:</strong> +880 1234-567890</p>
                <p>Fast • Secure • Worldwide Transfers</p>
            </div>
        </div>
    </header>

    <div class="row g-2 mt-4">
        <div class="col-md-6">
            <div class="company-section h-80">
                <h4 class="text-primary">Company A: FastSend Ltd.</h4>
                <p><strong>Service:</strong> Money Transfer To:</p>
                <p><strong>Address:</strong> 123 Business Street, Dhaka, Bangladesh</p>
                <p><strong>Email:</strong> support@fastsend.com</p>
                <p><strong>Phone:</strong> +880 1234-567890</p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="company-section h-80">
                <h4 class="text-success">Company B: EuroPay Ltd.</h4>
                <p><strong>Service:</strong> Money Transfer Form:</p>
                <p><strong>Address:</strong> 45 Commerce Avenue, London, UK</p>
                <p><strong>Email:</strong> contact@europay.co.uk</p>
                <p><strong>Phone:</strong> +44 20 1234 5678</p>
            </div>
        </div>
    </div>
</div>

<!-- Form Section -->
<div class="container form-section" style="max-width: 1165px !important;">
    <h3 class="mb-4">Create New Order</h3>
    <form id="orderForm">
        <div class="row mb-3">
            <div class="col-md-4">
                <label class="form-label">Customer</label>
                <select class="form-select" name="customer_id" required>
                    <option value="">Select Customer</option>
                    <option value="1">John Doe</option>
                    <option value="2">Jane Smith</option>
                </select>
            </div>
            <div class="col-md-4">
                <label class="form-label">Order Date</label>
                <input type="date" class="form-control" name="order_date" required>
            </div>
            <div class="col-md-4">
                <label class="form-label">Status</label>
                <select class="form-select" name="status_id" required>
                    <option value="1">Pending</option>
                    <option value="2">Completed</option>
                </select>
            </div>
            <div class="col-md-4">
                <label class="form-label">Paid Amount</label>
                <input type="number" class="form-control" name="paid_amount" required>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-4">
                <label class="form-label">Order Total</label>
                <input type="number" class="form-control" id="order_total" name="order_total" readonly>
            </div>
            <div class="col-md-4">
                <label class="form-label">Remarks</label>
                <textarea class="form-control" name="remarks" rows="1"></textarea>
            </div>
        </div>

        <hr>
        <h5>Order details Item</h5>

        <div class="row mb-3">
            <div class="col-md-2">
                <select name="currency_code" id="currency_code" class="form-control">
                    <option value="">Select Code</option>
                    @foreach ($currencies as $currency)
                    <option value="{{ $currency->id }}">{{ $currency->currency_name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-2">
                <input type="number" id="qty" class="form-control" placeholder="Qty">
            </div>
            <div class="col-md-2">
                <input type="number" id="rate" class="form-control" placeholder="Rate">
            </div>
            <div class="col-md-2">
                <input type="number" id="vat" class="form-control" placeholder="VAT">
            </div>
            <div class="col-md-2">
                <input type="number" id="item_total" class="form-control" placeholder="Total" readonly>
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-primary w-100" id="addItemBtn">Add</button>
            </div>
        </div>

        <table class="table table-bordered" id="itemsTable">
            <thead class="table-light">
                <tr>
                    <th>Currency</th>
                    <th>Qty</th>
                    <th>Rate</th>
                    <th>VAT</th>
                    <th>Total</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>

        <div class="text-end mt-4">
            <button type="submit" class="btn btn-success px-4">Submit Order</button>
        </div>
    </form>
</div>
<script>
document.addEventListener("DOMContentLoaded", function() {
    let items = [];

    function updateItemTotal() {
        const qty = parseFloat(document.getElementById("qty").value) || 0;
        const rate = parseFloat(document.getElementById("rate").value) || 0;
        const vat = parseFloat(document.getElementById("vat").value) || 0;
        const total = (qty * rate - vat).toFixed(2);
        document.getElementById("item_total").value = total;
    }

    document.getElementById("qty").addEventListener("input", updateItemTotal);
    document.getElementById("rate").addEventListener("input", updateItemTotal);
    document.getElementById("vat").addEventListener("input", updateItemTotal);

    document.getElementById("addItemBtn").addEventListener("click", () => {
        const currencySelect = document.getElementById("currency_code");
        const currency_id = currencySelect.value;
        const currency_name = currencySelect.options[currencySelect.selectedIndex].text;
        const qty = parseFloat(document.getElementById("qty").value);
        const rate = parseFloat(document.getElementById("rate").value);
        const vat = parseFloat(document.getElementById("vat").value);
        const total = qty * rate - vat;

        if (!currency_id || isNaN(qty) || isNaN(rate)) {
            alert("Fill all item fields");
            return;
        }

        items.push({
            currency_id,
            currency_name,
            qty,
            rate,
            vat,
            total
        });

        renderItems();
        updateOrderTotal();

        document.getElementById("qty").value = "";
        document.getElementById("rate").value = "";
        document.getElementById("vat").value = "";
        document.getElementById("item_total").value = "";
    });

    function renderItems() {
        const tbody = document.querySelector("#itemsTable tbody");
        tbody.innerHTML = "";

        items.forEach((item, index) => {
            tbody.innerHTML += `
                <tr>
                    <td>${item.currency_name}</td>
                    <td>${item.qty}</td>
                    <td>${item.rate}</td>
                    <td>${item.vat}</td>
                    <td>${item.total.toFixed(2)}</td>
                    <td><button type="button" class="btn btn-danger btn-sm" onclick="removeItem(${index})">Remove</button></td>
                </tr>
            `;
        });
    }

    window.removeItem = function(index) {
        items.splice(index, 1);
        renderItems();
        updateOrderTotal();
    }

    function updateOrderTotal() {
        const total = items.reduce((sum, item) => sum + item.total, 0);
        document.getElementById("order_total").value = total.toFixed(2);
    }

    document.getElementById("orderForm").addEventListener("submit", async function(e) {
        e.preventDefault();

        const formData = new FormData(this);
        const data = Object.fromEntries(formData.entries());
        data.order_total = parseFloat(data.order_total);
        data.items = items;

        try {
            const response = await fetch(
                "http://razib.intelsofts.com/projects/laravel/mex/public/api/orders", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify(data),
                });

            const contentType = response.headers.get("content-type");

            if (!response.ok) {
                const errorText = await response.text();
                throw new Error(`Server error: ${errorText}`);
            }

            if (contentType && contentType.includes("application/json")) {
                const result = await response.json();
                alert("Order submitted successfully!");
                // Redirect to orders index page instead of reload
                window.location.href = "{{ route('orders.index') }}";
            } else {
                const text = await response.text();
                throw new Error(`Expected JSON but got: ${text}`);
            }

        } catch (error) {
            alert("Error submitting order: " + error.message);
            console.error(error);
        }
    });

});
</script>


@endsection