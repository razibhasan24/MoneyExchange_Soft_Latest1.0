 @extends('layouts.master')
 @section('page-title', 'Create Customer Invoice')
 @section('pages')
 <style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f5f5f5;
}

.main-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: black;
    padding: 20px;
}

.main-header img {
    max-height: 130px;
}

.container {
    background: #fff;
}

label {
    display: block;
    margin-bottom: 4px;
    font-weight: bold;
}

input,
select,
textarea {
    width: 100%;
    padding: 6px;
    margin-bottom: 12px;
}

.row {
    display: flex;
    flex-wrap: wrap;
}

.col-3 {
    flex: 1 1 calc(25% - 15px);
    margin-right: 10px;
}

.col-4 {
    flex: 1 1 calc(33.33% - 15px);
    margin-right: 10px;
}

.col-6 {
    flex: 1 1 calc(50% - 15px);
    margin-right: 10px;
}

.col-2 {
    flex: 1 1 calc(20% - 10px);
    margin-right: 10px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 15px;
}

table,
th,
td {
    border: 1px solid #003366;
}

th {
    background: #003366;
    color: #fff;
    padding: 8px;
}

td {
    padding: 8px;
}

.btn {
    background: #003366;
    color: #fff;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    margin-right: 10px;
}
 </style>

 <div style="max-width: 70vw; margin: 0 auto;" class="container my-5 py-3">
     <!-- ✅ HEADER -->
     <div class="main-header mb-3">
         <div><img src="{{ asset('assets/img/logos/money-exchange-logo.png') }}" alt="Logo"></div>
         <div style="text-align:right;">
             <p>Invoice Ltd.</p>
             <p>123 Invoice Road, Dhaka</p>
             <p>info@invoice.com</p>
         </div>
     </div>

     <!-- ✅ FORM HEADER -->
     <div class="container">
         <h2 class="mb-3 text-center">Create Customer Invoice</h2>

         <!-- ✅ Master Fields -->
         <div class="row">
             <div class="col-3">
                 <label>Customer</label>
                 <select id="customer_id">
                     <option value="">Select Customer</option>
                     @foreach ($customers as $customer)
                     <option value="{{ $customer->id }}">{{ $customer->name }}</option>
                     @endforeach
                 </select>
             </div>
             <div class="col-3">
                 <label>Invoice Date</label>
                 <input type="date" id="invoice_date">
             </div>
             <div class="col-3">
                 <label>Total Amount</label>
                 <input type="number" id="total_amount">
             </div>
             <div class="col-3">
                 <label>Status</label>
                 <select id="status">
                     <option value="">Select Status</option>
                     @foreach ($statuses as $status)
                     <option value="{{ $status->id }}">{{ $status->name }}</option>
                     @endforeach
                 </select>
             </div>
         </div>

         <!-- ✅ Details Fields -->
         <h3 class="mb-3 text-center">Add Invoice Detail</h3>
         <div class="row">
             <div class="col-2">
                 <label>Description</label>
                 <input type="text" id="description">
             </div>
             <div class="col-2">
                 <label>Qty</label>
                 <input type="number" id="qty">
             </div>
             <div class="col-2">
                 <label>Rate</label>
                 <input type="number" id="rate">
             </div>
             <div class="col-2">
                 <label>VAT (%)</label>
                 <input type="number" id="vat">
             </div>
             <div class="col-2" style="display:flex;align-items:center;margin-top:15px;">
                 <button class="btn btn-success w-100" id="addItemBtn">Add Item</button>
             </div>
         </div>

         <!-- ✅ Table -->
         <table>
             <thead>
                 <tr>
                     <th>Description</th>
                     <th>Quantity</th>
                     <th>Rate</th>
                     <th>VAT</th>
                     <th>Total</th>
                     <th>Action</th> <!-- Add this -->
                 </tr>
             </thead>
             <tbody id="itemsBody"></tbody>
         </table>

         <!-- ✅ Submit -->
         <div style="margin-top:20px;">
             <button class="btn btn-success" id="submitBtn">Save Invoice</button>
         </div>
     </div>

     <!-- ✅ JavaScript -->
     <script>
     let invoiceItems = [];
     let itemId = 1;

     document.getElementById('addItemBtn').addEventListener('click', function() {
         const description = document.getElementById('description').value;
         const qty = parseFloat(document.getElementById('qty').value);
         const rate = parseFloat(document.getElementById('rate').value);
         const vat = parseFloat(document.getElementById('vat').value);

         if (!description || isNaN(qty) || isNaN(rate) || isNaN(vat)) {
             alert("Please fill out all item fields.");
             return;
         }

         const total = (qty * rate) + ((qty * rate * vat) / 100);

         const item = {
             id: itemId++,
             description,
             qty,
             rate,
             vat,
             total
         };

         invoiceItems.push(item);

         document.getElementById('itemsBody').insertAdjacentHTML('beforeend', `
            <tr data-id="${item.id}">
                <td>${description}</td>
                <td>${qty}</td>
                <td>${rate}</td>
                <td>${vat}</td>
                <td>${total.toFixed(2)}</td>
                <td><button onclick="deleteItem(${item.id})" class="btn btn-danger btn-sm">Delete</button></td>
            </tr>
        `);

         // Clear fields
         document.getElementById('description').value = '';
         document.getElementById('qty').value = '';
         document.getElementById('rate').value = '';
         document.getElementById('vat').value = '';
     });

     function deleteItem(id) {
         invoiceItems = invoiceItems.filter(item => item.id !== id);
         const row = document.querySelector(`tr[data-id="${id}"]`);
         if (row) row.remove();
     }

     document.getElementById('submitBtn').addEventListener('click', async function() {
         const data = {
             customer_id: document.getElementById('customer_id').value,
             invoice_date: document.getElementById('invoice_date').value,
             total_amount: parseFloat(document.getElementById('total_amount').value),
             status: document.getElementById('status').value,
             items: invoiceItems
         };
         try {
             console.log(data);
             const response = await fetch(
                 'http://razib.intelsofts.com/projects/laravel/mex/public/api/invoices', {
                     method: 'POST',
                     headers: {
                         'Content-Type': 'application/json',
                         'Accept': 'application/json'
                     },
                     body: JSON.stringify(data)
                 });

             if (!response.ok) throw new Error(`Server error: ${response.status}`);

             const result = await response.json();
             alert('Invoice created successfully!');
             window.location.assign("{{ route('invoices.index') }}");

         } catch (error) {
             console.error('Error creating invoice:', error);
             alert('Error occurred while creating invoice.');
         }

     });
     </script>

 </div>
 @endsection