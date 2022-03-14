<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Category;
use Illuminate\Http\Request;
use \Cviebrock\EloquentSluggable\Services\SlugService;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;

class DashboardPostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('dashboard.posts.index', [
            // mengirim data sesuai id pada session
            'posts' => Post::where('user_id', auth()->user()->id)->get()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('dashboard.posts.create', [
            'categories' => Category::all()
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // ddd($request);
        // return $request->file('image')->store('post-image');

        $validatedData = $request->validate([
            'title' => 'required|max:255',
            'slug' => 'required|unique:posts',
            'category_id' => 'required',
            'image' => 'image|file|max:1024',
            'body' => 'required'
        ]);

        // fungsi untuk cek apakah ada data gambar yang diinput
        if($request->file('image')) {

            // kalo ada, isi variabel image lalu masukkan image kefolder yang sudah ditentukan
            $validatedData['image'] = $request->file('image')->store('post-image');
        }

        // buat variabel baru pada variabel validatedData, isi dengan id pada session
        $validatedData['user_id'] = auth()->user()->id;
        // Str::limit(target, jumlah kata) : untuk memotong banyak paragraph
        // strip_tags(target) : untuk menghilangkan tags pada target
        $validatedData['excerpt'] = Str::limit(strip_tags($request->body), 200);

        Post::create($validatedData);

        return redirect('/dashboard/posts')->with('success', 'New post has been added.');

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {

        // cek apakah id sama dengan id target
        if($post->author->id !== auth()->user()->id) {
            abort(403);
        }

        // menampilkan satu post di dashboard
        return view('dashboard.posts.show', [
            'post' => $post
        ]);

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function edit(Post $post)
    {

        // cek apakah id sama dengan id target
        if($post->author->id !== auth()->user()->id) {
            abort(403);
        }

        // untuk menampilkan view editnya
        return view('dashboard.posts.edit', [
            'post' => $post,
            'categories' => Category::all()
        ]);

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Post $post)
    {
        // untuk proses updatenya

        // siapkan aturannya
        $rules = [
            'title' => 'required|max:255',
            'category_id' => 'required',
            'image' => 'image|file|max:1024',
            'body' => 'required'
        ];

        // siapkan aturan slug, dengan kondisi bila slug pada db berbeda dengan request
        if($request->slug != $post->slug ) {
            $rules['slug'] = 'required|unique:posts';
        }

        // validasi datanya
        $validatedData = $request->validate($rules);

        // fungsi untuk cek apakah ada data gambar yang diinput
        if($request->file('image')) {

            // cek apakah ada gambar sebelumnya
            if($post->image) {
                // kalau ada hapus file gambar lama fisiknya
                Storage::delete($post->image);
            }

            // kalo ada, isi variabel image lalu masukkan image kefolder yang sudah ditentukan
            $validatedData['image'] = $request->file('image')->store('post-image');
        }

        $validatedData['user_id'] = auth()->user()->id;
        // Str::limit(target, jumlah kata) : untuk memotong banyak paragraph
        // strip_tags(target) : untuk menghilangkan tags pada target
        $validatedData['excerpt'] = Str::limit(strip_tags($request->body), 200);

        // ubah data sesuai idnya
        Post::where('id', $post->id)->update($validatedData);

        return redirect('/dashboard/posts')->with('success', 'Post has been updated.');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy(Post $post)
    {
        // fungsi hapus

        // cek apakah ada gambar sebelumnya
        if($post->image) {
            // kalau ada hapus file gambar lama fisiknya
            Storage::delete($post->image);
        }

        Post::destroy($post->id);
        return redirect('/dashboard/posts')->with('success', 'Post has been deleted.');
    }

    public function checkSlug(Request $request)
    {
        $slug = SlugService::createSlug(Post::class, 'slug', $request->title);
        return response()->json(['slug' => $slug]);
    }

}
