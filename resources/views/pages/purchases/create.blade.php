@extends('layouts.master')
@section('page-title', 'Create Purchase')
@section('pages')

{{-- <div class="container">
        <style>
            body {
                background-color: #f5f7fa;
            }

            .header_all {
                background-color: #ffffff;
                color: black;
                padding: 20px;
                margin-top: 40px;
                text-align:space end;
            }

            .company-section {
                background-color: #ffffff;
                border-radius: 6px;
                box-shadow: 0 0 10px #ffffff;
                padding: 20px;
                margin-bottom: 30px;
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
        </style>


        <!-- ========== Header ========== -->
        <!-- ========== Header with Logo ========== -->
        <header class="header_all">
            <div class="container d-flex align-items-center justify-content-between flex-wrap">
                <!-- Logo -->
                <div>
                    <img src="https://via.placeholder.com/80x60?text=Logo" alt="Company Logo" style="max-height: 60px;">
                </div>

                <!-- Company Info -->
                <div class="text-end ">
                    <h1>Global Money Exchange</h1>
                    <p><strong>Address:</strong> 123 Business Street, Dhaka, Bangladesh</p>
                    <p><strong>Email:</strong> support@fastsend.com</p>
                    <p><strong>Phone:</strong> +880 1234-567890</p>
                    <p>Fast • Secure • Worldwide Transfers</p>
                </div>
            </div>
        </header>


        <!-- ========== Main Content ========== -->

        <!-- ========== Main Content ========== -->


        <!-- Side-by-side Companies -->
        <div class="row g-2">
            <!-- Company A -->
            <div class="col-md-6">
                <div class="company-section h-100">
                    <h4 class="text-primary">Company A: FastSend Ltd.</h4>
                    <p><strong>Service:</strong> Money Transfer To:</p>
                    <p><strong>Address:</strong> 123 Business Street, Dhaka, Bangladesh</p>
                    <p><strong>Email:</strong> support@fastsend.com</p>
                    <p><strong>Phone:</strong> +880 1234-567890</p>
                </div>
            </div>

            <!-- Company B -->
            <div class="col-md-6">
                <div class="company-section h-100">
                    <h4 class="text-success">Company B: EuroPay Ltd.</h4>
                    <p><strong>Service:</strong> Money Transfer Form:</p>
                    <p><strong>Address:</strong> 45 Commerce Avenue, London, UK</p>
                    <p><strong>Email:</strong> contact@europay.co.uk</p>
                    <p><strong>Phone:</strong> +44 20 1234 5678</p>
                </div>
            </div>
        </div>




        <!-- ========== Footer ========== -->
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

    </div> --}}


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
<!-- ========== Header ========== -->
<!-- ========== Header with Logo ========== -->
<header class="header_all">
    <div class="container d-flex align-items-center justify-content-between">
        <!-- Logo -->
        <div class="imageaa">
            <img src="{{ asset('assets/img/logos/mex_logo.png') }}" alt="logo">
            {{-- <img src="https://via.placeholder.com/80x60?text=Logo" alt="Company Logo" style="max-height: 60px;"> --}}
        </div>

        <!-- Company Info -->
        <div class="text-end m-title ">
            <!-- <h1>Global Money Exchange</h1> -->
            <h1>Global Money Exchange</h2>
            <p><strong>Address:</strong> 123 Business Street, Dhaka, Bangladesh</p>
            <p><strong>Email:</strong> support@fastsend.com</p>
            <p><strong>Phone:</strong> +880 1234-567890</p>
            <p>Fast • Secure • Worldwide Transfers</p>
        </div>
    </div>
</header>


<!-- ========== Main Content ========== -->

<!-- ========== Main Content ========== -->


<!-- Side-by-side Companies -->
<div class="row g-2 mt-4">
    <!-- Company A -->
    <div class="col-md-6">
        <div class="company-section h-80">
            <h4 class="text-primary">Company A: FastSend Ltd.</h4>
            <p><strong>Service:</strong> Money Transfer To:</p>
            <p><strong>Address:</strong> 123 Business Street, Dhaka, Bangladesh</p>
            <p><strong>Email:</strong> support@fastsend.com</p>
            <p><strong>Phone:</strong> +880 1234-567890</p>
        </div>
    </div>

    <!-- Company B -->
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

<div class="main-header">
    <h4 class="m-0 margin-top-10px">Create Purchase - Money Exchange</h4>
</div>

<!-- Body -->
<div class="section-body">
    <form id="purchaseForm">
        <!-- Master Fields -->
        <div class="row mb-3">
            <div class="col-md-3">
                <label class="form-label">Agent ID</label>
                {{-- <input type="number" id="agent_id" class="form-control" required> --}}
                <select name="agent_id" id="agent_id" class="form-control">
                    <option value="">Select Agent</option>
                    @foreach ($agents as $agent)
                    <option value="{{ $agent->id }}">{{ $agent->name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-3">
                <label class="form-label">Status ID</label>
                {{-- <input type="number" id="status_id" class="form-control" required> --}}
                <select name="Status_id" id="status_id" class="form-control">
                    <option value="">Select Status</option>
                    @foreach ($statuses as $status)
                    <option value="{{ $status->id }}">{{ $status->name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-3">
                <label class="form-label">Purchase Date</label>
                <input type="date" id="purchase_date" class="form-control" required>
            </div>
            <div class="col-md-3">
                <label class="form-label">Purchase Total</label>
                <input type="number" disabled id="purchase_total" class="form-control" step="0.01" required>
            </div>
        </div>
        <div class="mb-3">
            <label class="form-label">Remarks</label>
            <textarea id="remarks" class="form-control" rows="2"></textarea>
        </div>

        <hr>

        <!-- Add Items Header -->
        <h5 class="text-primary mb-2">Add Items</h5>
        <div class="row g-2 mb-3">
            <div class="col-md-2">
                <select name="currency_code" id="currency_code" class="form-control">
                    <option value="">Select Code</option>
                    @foreach ($currencies as $currency)
                    <option value="{{$currency->id}}">{{$currency->currency_name}}</option>
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
                <input type="number" id="vat" class="form-control" placeholder="VAT" value="0">
            </div>
            <div class="col-md-2">
                <input type="number" id="total" class="form-control" placeholder="Total" readonly>
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-primary w-100" onclick="addItem()">Add Item</button>
            </div>
        </div>

        <!-- Items Table -->
        <div class="table-responsive">
            <table class="table table-bordered table-sm">
                <thead class="table-light">
                    <tr>
                        <th>Currency Code</th>
                        <th>Qty</th>
                        <th>Rate</th>
                        <th>VAT</th>
                        <th>Total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="itemsTableBody"></tbody>
            </table>
        </div>

        <div class="text-end">
            <button type="submit" class="btn btn-success">Save Purchase</button>
        </div>
    </form>
</div>


<!-- ========== Footer ========== -->
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

<script>
    const items = [];

    // Auto calculate total on input
    document.getElementById('qty').addEventListener('input', calculateTotal);
    document.getElementById('rate').addEventListener('input', calculateTotal);
    document.getElementById('vat').addEventListener('input', calculateTotal);

    function calculateTotal() {
        const qty = parseFloat(document.getElementById('qty').value) || 0;
        const rate = parseFloat(document.getElementById('rate').value) || 0;
        const vat = parseFloat(document.getElementById('vat').value) || 0;
        const total = (qty * rate) - vat;
        document.getElementById('total').value = total.toFixed(2);
    }

    function addItem() {
        const currencyEl = document.getElementById('currency_code');
        const currency_id = currencyEl.value;
        const currency_name = currencyEl.options[currencyEl.selectedIndex].text;
        const qty = parseFloat(document.getElementById('qty').value) || 0;
        const rate = parseFloat(document.getElementById('rate').value) || 0;
        const vat = parseFloat(document.getElementById('vat').value) || 0;
        const total = parseFloat(document.getElementById('total').value) || 0;

        if (!currency_code || qty <= 0 || rate <= 0) {
            alert("Please enter valid item details.");
            return;
        }

        const item = {
            currency_id,
            currency_name,
            qty,
            rate,
            vat,
            total
        };
        items.push(item);
        renderItems();

        // Reset input
        document.getElementById('currency_code').value = '';
        document.getElementById('qty').value = '';
        document.getElementById('rate').value = '';
        document.getElementById('vat').value = '0';
        document.getElementById('total').value = '';
    }

    function renderItems() {
        const tbody = document.getElementById('itemsTableBody');
        const totalInput=document.getElementById('purchase_total');
        let totalAmount=0;
        tbody.innerHTML = '';
        items.forEach((item, index) => {
            totalAmount +=item.total;
            
            const row = `
        <tr>
          <td>${item.currency_name}</td>
          <td>${item.qty}</td>
          <td>${item.rate}</td>
          <td>${item.vat}</td>
          <td>${item.total.toFixed(2)}</td>
          <td><button type="button" class="btn btn-danger btn-sm" onclick="deleteItem(${index})">Delete</button></td>
        </tr>
      `;
            tbody.innerHTML += row;
        });
        totalInput.value=totalAmount;
    }

    function deleteItem(index) {
        items.splice(index, 1);
        renderItems();
    }

    // Submit
    document.getElementById('purchaseForm').addEventListener('submit', async function(e) {
        e.preventDefault();

        const data = {
            agent_id: document.getElementById('agent_id').value,
            status_id: document.getElementById('status_id').value,
            purchase_date: document.getElementById('purchase_date').value,
            remarks: document.getElementById('remarks').value,
            purchase_total: document.getElementById('purchase_total').value,
            items: items
        };
        console.log(data);
        try {
            const res = await fetch('http://127.0.0.1:8000/api/purchases', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            });

            if (res.ok) {
                alert("Purchase saved successfully!");
                window.location.assign("{{ route('purchases.index') }}");
            } else {
                alert("Failed to save purchase.");
            }
        } catch (err) {
            console.error(err);
            alert("Error saving purchase.");
        }
    });
</script>
</div>







@endsection