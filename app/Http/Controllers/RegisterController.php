<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    
    public function index()
    {
        return view('register.index', [
            'active' => 'login',
            'title' => 'Register',
        ]);
    }

    public function store(Request $request) 
    {
        // proses validasi data
        $validatedData = $request->validate([
            'name' => 'required|max:255',
            'username' => 'required|min:3|max:255|unique:users', // unique:nama_tabelnya,nama_kolomnya
            'email' => 'required|email:dns|unique:users',
            'password' => 'required|min:5|max:255'
        ]);

        // enkrip passwordnya
        // $validatedData['password'] = bcrypt($validatedData['password']);
        $validatedData['password'] = Hash::make($validatedData['password']);

        // masukan ke db sesuai tbnya
        User::create($validatedData);

        // buat flash message setlah berhasil regis
        // $request->session()->flash('success', 'Registration successfull! Please login');

        // redirect ke halaman setalah berhasil regis atau sekalian dengan flash messagenya
        return redirect('/login')->with('success', 'Registration successfull! Please login');

    }

}
