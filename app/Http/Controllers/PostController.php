<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;

class PostController extends Controller
{
    
    public function index()
    {
        // dd(request('search'));

        // biar bisa BY atau In sesuai kondisi
        $title = '';
        if(request('category')) {
            $category = Category::firstWhere('slug', request('category'));
            $title = ' in ' . $category->name;
        }else if(request('author')) {
            $author = User::firstWhere('username', request('author'));
            $title = ' by ' . $author->name;
        }

        // arahkan ke halaman blog pada folder view 
        return view('blog', [
            "title" => "All Blog" . $title,
            "active" => "blog",
            // "posts" => Post::all() // ambil fungsi di class Post, fungsi laravel untuk ambil semua data
            // "posts" => Post::latest()->filter(request(['search', 'category', 'author']))->get() // latest : fungsi laravel untuk ambil data terbaru, filter : dari model function scopeFilter (fitur pencarian)
            "posts" => Post::latest()->filter(request(['search', 'category', 'author']))->paginate(7)->withQueryString() // latest : fungsi laravel untuk ambil data terbaru, filter : dari model function scopeFilter (fitur pencarian), paginate : fungsi paginasi, withQueryString() : untuk membawa query sebelumnya pada url
            // "posts" => Post::with(['author', 'category'])->latest()->get() // with : fungsi laravel untuk mencegah n+1 problem, berisikan parameter tabel relasinya.
        ]);
    }

    public function show(Post $post)
    {
        return view('post', [
            "title" => "Single Post",
            "active" => "blog",
            "post" => $post
        ]);
    }
    
}
