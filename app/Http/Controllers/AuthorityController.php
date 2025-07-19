<?php

namespace App\Http\Controllers;

use App\Models\Authority;
use Illuminate\Http\Request;


class AuthorityController extends Controller
{
    public function index()
    {
        $authorities = Authority::orderBy('id','DESC')->paginate(10);
        return view('pages.authorities.index', compact('authorities'));
    }

    public function create()
    {

        return view('pages.authorities.create', [
            'mode' => 'create',
            'authority' => new Authority(),

        ]);
    }

    public function store(Request $request)
    {
        $data = $request->all();
        if ($request->hasFile('photo')) {
            $data['photo'] = $request->file('photo')->store('uploads', 'public');
        }
        Authority::create($data);
        return redirect()->route('authorities.index')->with('success', 'Successfully created!');
    }

    public function show(Authority $authority)
    {
        return view('pages.authorities.view', compact('authority'));
    }

    public function edit(Authority $authority)
    {

        return view('pages.authorities.edit', [
            'mode' => 'edit',
            'authority' => $authority,

        ]);
    }

    public function update(Request $request, Authority $authority)
    {
        $data = $request->all();
        if ($request->hasFile('photo')) {
            $data['photo'] = $request->file('photo')->store('uploads', 'public');
        }
        $authority->update($data);
        return redirect()->route('authorities.index')->with('success', 'Successfully updated!');
    }

    public function destroy(Authority $authority)
    {
        $authority->delete();
        return redirect()->route('authorities.index')->with('success', 'Successfully deleted!');
    }
}