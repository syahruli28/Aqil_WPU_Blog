<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function posts(){
        
        // fungsi untuk relationship 'hasMany' : 1 Category punya banyak post
        return $this->hasMany(Post::class);
    }
}
