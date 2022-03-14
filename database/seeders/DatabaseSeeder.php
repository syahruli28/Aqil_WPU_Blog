<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Post;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        
        User::create([
            'name' => 'Aqil',
            'username' => 'Aqil',
            'email' => 'aqil@gmail.com',
            'password' => bcrypt('12345')
        ]);
        // User::create([
            //     'name' => 'Liqa',
            //     'email' => 'liqa@gmail.com',
            //     'password' => bcrypt('12345')
            // ]);
            
        User::factory(3)->create();

        Category::create([
            'name' => 'Web Programming',
            'slug' => 'web-programming'
        ]);
        Category::create([
            'name' => 'Web Design',
            'slug' => 'web-design'
        ]);
        Category::create([
            'name' => 'Personal',
            'slug' => 'personal'
        ]);

        Post::factory(20)->create();

        // Post::create([
        //     'title' => 'Judul Pertama',
        //     'category_id' => 1,
        //     'user_id' => 1,
        //     'slug' => 'judul-pertama',
        //     'excerpt' => 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ullam numquam quaerat deleniti minima ut magnam.',
        //     'body' => '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Assumenda minima, sequi deserunt aspernatur ipsum nulla a nam nemo odio quam saepe, magni molestias tempora! Vel neque error quam atque maxime!</p><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ducimus cupiditate deserunt laboriosam placeat aperiam? Culpa tenetur facere eius quam eum, fuga veritatis laborum. Cum, qui. Ipsum exercitationem modi ut itaque voluptatem adipisci excepturi repellendus quis?</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Porro quis iure, voluptates nobis sapiente adipisci qui iusto, aut beatae nostrum ab eius repellat nesciunt non assumenda recusandae sed tempore reiciendis accusamus laboriosam odio ad nulla! Natus rerum earum dignissimos harum.</p>'
        // ]);
        // Post::create([
        //     'title' => 'Judul Kedua',
        //     'category_id' => 1,
        //     'user_id' => 1,
        //     'slug' => 'judul-kedua',
        //     'excerpt' => 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ullam numquam quaerat deleniti minima ut magnam.',
        //     'body' => '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Assumenda minima, sequi deserunt aspernatur ipsum nulla a nam nemo odio quam saepe, magni molestias tempora! Vel neque error quam atque maxime!</p><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ducimus cupiditate deserunt laboriosam placeat aperiam? Culpa tenetur facere eius quam eum, fuga veritatis laborum. Cum, qui. Ipsum exercitationem modi ut itaque voluptatem adipisci excepturi repellendus quis?</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Porro quis iure, voluptates nobis sapiente adipisci qui iusto, aut beatae nostrum ab eius repellat nesciunt non assumenda recusandae sed tempore reiciendis accusamus laboriosam odio ad nulla! Natus rerum earum dignissimos harum.</p>'
        // ]);
        // Post::create([
        //     'title' => 'Judul Ketiga',
        //     'category_id' => 2,
        //     'user_id' => 1,
        //     'slug' => 'judul-ketiga',
        //     'excerpt' => 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ullam numquam quaerat deleniti minima ut magnam.',
        //     'body' => '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Assumenda minima, sequi deserunt aspernatur ipsum nulla a nam nemo odio quam saepe, magni molestias tempora! Vel neque error quam atque maxime!</p><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ducimus cupiditate deserunt laboriosam placeat aperiam? Culpa tenetur facere eius quam eum, fuga veritatis laborum. Cum, qui. Ipsum exercitationem modi ut itaque voluptatem adipisci excepturi repellendus quis?</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Porro quis iure, voluptates nobis sapiente adipisci qui iusto, aut beatae nostrum ab eius repellat nesciunt non assumenda recusandae sed tempore reiciendis accusamus laboriosam odio ad nulla! Natus rerum earum dignissimos harum.</p>'
        // ]);
        // Post::create([
        //     'title' => 'Judul Keempat',
        //     'category_id' => 2,
        //     'user_id' => 2,
        //     'slug' => 'judul-keempat',
        //     'excerpt' => 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ullam numquam quaerat deleniti minima ut magnam.',
        //     'body' => '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Assumenda minima, sequi deserunt aspernatur ipsum nulla a nam nemo odio quam saepe, magni molestias tempora! Vel neque error quam atque maxime!</p><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ducimus cupiditate deserunt laboriosam placeat aperiam? Culpa tenetur facere eius quam eum, fuga veritatis laborum. Cum, qui. Ipsum exercitationem modi ut itaque voluptatem adipisci excepturi repellendus quis?</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Porro quis iure, voluptates nobis sapiente adipisci qui iusto, aut beatae nostrum ab eius repellat nesciunt non assumenda recusandae sed tempore reiciendis accusamus laboriosam odio ad nulla! Natus rerum earum dignissimos harum.</p>'
        // ]);

    }
}
