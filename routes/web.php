<?php

use App\Http\Controllers\AdminCategoryController;
use App\Models\Category;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PostController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\DashboardPostController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// rute halaman home
Route::get('/', function () {
    
    // arahkan ke halaman home pada folder view 
    return view('home', [
        'active' => 'home',
        "title" => "Home"
    ]);
});

// rute halaman about
Route::get('/about', function () {

    // arahkan ke halaman about pada folder view 
    return view('about', [
        'active' => 'about',
        "name" => "Aqil Emeraldi",
        "email" => "aqilemail@gmail.com",
        "img" => "img-1.jpg",
        "title" => "About"
    ]);
});


// rute halaman blog
Route::get('/blog', [PostController::class, 'index']); // kalau url begitu, maka jalankan fungsi index() pada controller PostController


// halaman single blog
// post::slug = instance:yangmaudiambil/dikirim
Route::get('blog/{post:slug}', [PostController::class, 'show']); // kalau url begitu, maka jalankan fungsi show() pada controller PostController

Route::get('/categories', function(){
    return view('categories', [
        'title' => 'Post Categories',
        'active' => 'categories',
        'categories' => Category::all()
    ]);
});

// middleware('guest/auth') : untuk cek apakah sudah ada session login, guest untuk yang belon, auth sebaliknya
// name('login') : default digunakan setelah/untuk proses logout
Route::get('/login', [LoginController::class, 'index'])->name('login')->middleware('guest');
Route::post('/login', [LoginController::class, 'authenticate']);
Route::post('/logout', [LoginController::class, 'logout']);

Route::get('/register', [RegisterController::class, 'index'])->middleware('guest');
Route::post('/register', [RegisterController::class, 'store']);

Route::get('/dashboard', function() {
    return view('dashboard.index');
})->middleware('auth');

Route::get('/dashboard/posts/checkSlug', [DashboardPostController::class, 'checkSlug'])->middleware('auth');

// resource : route untuk menangani CRUD sekaligus, (penempatan harus paling bawah MUNGKIN)
Route::resource('/dashboard/posts', DashboardPostController::class)->middleware('auth');

// except : untuk menghilangkan route method pada suatu controller
Route::resource('/dashboard/categories', AdminCategoryController::class)->except('show')->middleware('admin');

// Route::get('/categories/{category:slug}', function(Category $category){
//     return view('blog', [
//         'title' => " Post By Category : $category->name",
//         'active' => 'categories',
//         'posts' => $category->posts->load('category', 'author')
//     ]);
// });

// Route::get('/authors/{author:username}', function(User $author) {
//     return view('blog', [
//         'title' => "Post By Author : $author->name",
//         'active' => 'categories',
//         'posts' => $author->posts->load('category', 'author') // load(['parameter']) : untuk mencegah n+1 problem dengan kondisi route model binding
//     ]);
// });
