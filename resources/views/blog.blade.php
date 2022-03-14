@extends('layouts.main')

@section('container')

    <h1 class="mb-3 text-center">{{ $title }}</h1>

    <div class="row justify-content-center mb-3">
        <div class="col-md-6">
            <form action="/blog">

                @if(request('category'))
                    <input type="hidden" name="category" value="{{ request('category') }}">
                @elseif(request('author'))
                    <input type="hidden" name="author" value="{{ request('author') }}">
                @endif

                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Search.." name="search" value="{{ request('search') }}">
                    <button class="btn btn-danger" type="submit">Search</button>
                </div>
            </form>
        </div>
    </div>

    @if($posts->count())
        <div class="card mb-3">
            {{-- cek apakah post mempunyai gambar yang diinput --}}
            @if ($posts[0]->image)
                <div style="max-height: 400px; overflow: hidden;">
                    <img src="{{ asset('storage/' .$posts[0]->image ) }}" alt="https://source.unsplash.com/1200x400?{{ $posts[0]->category->name }}" class="img-fluid mt-3">
                </div>
            @else
                <img src="https://source.unsplash.com/1200x400?{{ $posts[0]->category->name }}" class="card-img-top" alt="https://source.unsplash.com/1200x400?{{ $posts[0]->category->name }}">
            @endif
            
            <div class="card-body text-center">
            <h3 class="card-title"><a class="text-decoration-none text-dark" href="/blog/{{ $posts[0]->slug }}">{{ $posts[0]->title }}</a></h3>
            <p><small class="text-muted">
                by <a href="/blog?author={{ $posts[0]->author->username }}" class="text-decoration-none">{{ $posts[0]->author->name }}</a> in <a href="/blog?category={{ $posts[0]->category->slug }}" class="text-decoration-none">{{ $posts[0]->category->name }}</a> {{ $posts[0]->created_at->diffForHumans() }}
            </small></p>
            <p class="card-text mt-3">{{ $posts[0]->excerpt }}</p>
            <a href="/blog/{{ $posts[0]->slug }}" class="btn btn-primary text-decoration-none">Read More</a>
            </div>
        </div>
    
        <div class="container">
            <div class="row">
                @foreach ($posts->skip(1) as $p)
                <div class="col-md-4">
                    <div class="card mt-3">
                        <div class="position-absolute bg-dark px-3 py-2" style="background-color: rgba(0,0,0,.6)"><a href="/blog?category={{ $p->category->slug }}" class="text-decoration-none text-white">{{ $p->category->name }}</a></div>

                        {{-- cek apakah post mempunyai gambar yang diinput --}}
                        @if ($p->image)
                                <img src="{{ asset('storage/' .$p->image ) }}" alt="https://source.unsplash.com/1200x400?{{ $p->category->name }}" class="img-fluid mt-3">
                        @else
                            <img src="https://source.unsplash.com/500x400?{{ $p->category->name }}" class="card-img-top" alt="https://source.unsplash.com/1200x400?{{ $p->category->name }}">
                        @endif

                        <div class="card-body">
                        <h5 class="card-title">{{ $p->title }}</h5>
                        <p><small class="text-muted">
                            by <a href="/blog?author={{ $p->author->username }}" class="text-decoration-none">{{ $p->author->name }}</a> 
                            {{ $p->created_at->diffForHumans() }}
                            </small></p>
                        
                            <p class="card-text">{{ $p->excerpt }}</p>
                        <a href="/blog/{{ $p->slug }}" class="btn btn-primary">Read More</a>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>

    @else
        <p class="text-center fs-4">No post found.</p>
    @endif

    {{-- paginasi --}}
    <div class="d-flex justify-content-end my-3"> 
        {{ $posts->links() }}
    </div>

@endsection