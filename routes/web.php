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

//Основа
Route::get('/', [App\Http\Controllers\IndexController::class, 'index'])->name('welcome');

//Аутентификация
Route::post('/login', [App\Http\Controllers\Auth\LoginController::class, 'login']);
Route::post('/register', [App\Http\Controllers\Auth\RegisterController::class, 'register']);

//Локализация
Route::get('/setlocale/{locale}', function ($locale) {
    Session::put('locale', $locale);            # И устанавливаем его в сессии под именем locale
    return back();                              # Редиректим его <s>взад</s> на ту же страницу
});

//Личный кабинет
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

//Оплата
Route::get('/payment', [App\Http\Controllers\FreeKassaController::class, 'payment'])->name('payment');
Route::get('/payment/add', [App\Http\Controllers\FreeKassaController::class, 'paymentadd'])->name('paymentadd');
Route::any('/payment/valute', [App\Http\Controllers\FreeKassaController::class, 'paymentaddvalute'])->name('paymentaddvalute');
Route::any('/payment/check', [App\Http\Controllers\IndexController::class, 'check'])->name('check');

//Очистка
Route::get('/clear', function() {
    Artisan::call('cache:clear');
    Artisan::call('config:clear');
    Artisan::call('view:clear');
	Artisan::call('route:clear');
    return "Кэш очищен.";
});

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
