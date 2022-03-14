<?php

namespace App\Providers;

use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\ServiceProvider;
use App\Models\User;


class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        // biar bisa pakai paginasi bootstrap
        Paginator::useBootstrap();

        // cek apakah yang login memiliki username Aqil
        Gate::define('admin', function(User $user) {
            return $user->is_admin; // berarti true = 1 nilainya
        });
    }
}
