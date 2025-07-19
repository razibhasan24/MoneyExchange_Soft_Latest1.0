<?php

namespace App\Http\Controllers;

use App\Models\Company;
use Illuminate\Http\Request;


class CompanyController extends Controller
{
    public function index()
    {
        $companies = Company::orderBy('id','DESC')->paginate(10);
        return view('pages.companies.index', compact('companies'));
    }

    public function create()
    {

        return view('pages.companies.create', [
            'mode' => 'create',
            'company' => new Company(),

        ]);
    }

    public function store(Request $request)
    {
        $data = $request->all();
        if ($request->hasFile('photo')) {
            $data['photo'] = $request->file('photo')->store('uploads', 'public');
        }
        Company::create($data);
        return redirect()->route('companies.index')->with('success', 'Successfully created!');
    }

    public function show(Company $company)
    {
        return view('pages.companies.view', compact('company'));
    }

    public function edit(Company $company)
    {

        return view('pages.companies.edit', [
            'mode' => 'edit',
            'company' => $company,

        ]);
    }

    public function update(Request $request, Company $company)
    {
        $data = $request->all();
        if ($request->hasFile('photo')) {
            $data['photo'] = $request->file('photo')->store('uploads', 'public');
        }
        $company->update($data);
        return redirect()->route('companies.index')->with('success', 'Successfully updated!');
    }

    public function destroy(Company $company)
    {
        $company->delete();
        return redirect()->route('companies.index')->with('success', 'Successfully deleted!');
    }
}