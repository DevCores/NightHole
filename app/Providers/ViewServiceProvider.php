<?php

namespace App\Providers;


use Illuminate\Support\ServiceProvider;
use App\Models\DynamicDatabase;
use App\Models\Realmlist;


class ViewServiceProvider extends ServiceProvider

{

    /**
    * Bootstrap the application services.
    *
    * @return void
    */
    public function boot()
    {
        $realms = Realmlist::all();

        foreach ($realms as $realm) {
                $online[$realm->name] = DynamicDatabase::getOnline($realm->char);  
        }

        $online['all'] = array_sum($online);
        view()->share('online', $online);
    }

    /**
    * Register the application services.
    *
    * @return void
    */
    public function register()
    {
       //
    }
}
