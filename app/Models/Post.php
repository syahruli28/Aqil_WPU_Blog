<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;

class Post extends Model
{
    use HasFactory, Sluggable;

    // agar bisa massasignment sesuai kolom
    // protected $fillable = ['title', 'excerpt', 'body'];

    // agar bisa massasignment sesuai kolom yang tidak termasuk
    protected $guarded = ['id'];

    // avoid n+1 problem
    protected $with = ['category', 'author'];


    // fungsi untuk fitur search data
    public function scopeFilter($query, array $filters){

        // if(isset($filters['search']) ? $filters['search'] :false ) {
        //     return $query->where('title', 'like', '%' . $filters['search'] . '%')
        //             ->orWhere('body', 'like', '%' . $filters['search'] . '%');
        // }

        // kalau ada variabel filters search
        $query->when($filters['search'] ?? false, function($query, $search) {
            return $query->where('title', 'like', '%' . $search . '%')
                    ->orWhere('body', 'like', '%' . $search . '%');
        });

        // kalau ada variabel filters category
        $query->when($filters['category'] ?? false, function($query, $category) {
            return $query->whereHas('category', function($query) use ($category) {
                $query->where('slug', $category);
            });
        });

        // kalau ada variabel filters author
        $query->when($filters['author'] ?? false, function($query, $author) {
            return $query->whereHas('author', function($query) use ($author) {
                $query->where('username', $author);
            });
        });

    }

    public function category(){

        // fungsi untuk relationship 'belongTo' : 1 post punya 1 kategori
        return $this->belongsTo(Category::class);
    }

    public function author(){
        return $this->belongsTo(User::class, 'user_id');
        // parameter user_id hanya untuk membuat alias untuk function author, sesuai kolom user_id pada
    }

    // fungsi agar dapat pakai slug untuk pencarian (default id)
    public function getRouteKeyName()
    {
        return 'slug';
    }

    // fungsi untuk sluggable, isi otomatis slug sesuai title
    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }

}
