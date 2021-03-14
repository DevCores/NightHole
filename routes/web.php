<?php

use Illuminate\Support\Facades\Route;

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

Auth::routes();

Route::get('/', [App\Http\Controllers\IndexController::class, 'index'])->name('welcome');
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::post('/login', [App\Http\Controllers\Auth\LoginController::class, 'login']);
Route::post('/register', [App\Http\Controllers\Auth\RegisterController::class, 'register']);
Route::get('/setlocale/{locale}', function ($locale) {
    
    	Session::put('locale', $locale);                    # И устанавливаем его в сессии под именем locale

    return redirect('welcome');                              # Редиректим его <s>взад</s> на ту же страницу

});

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
