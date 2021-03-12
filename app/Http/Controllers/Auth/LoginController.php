<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Validator;
use App\Models\User;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

     protected function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
           'email' => 'required|email',
            'password' => 'required',
        ]);
        if (!User::where('email',$request->input('email'))->first()) {
           return response()->json(['error'=>'Пользователя не существует!']);
        }

        if ($validator->passes()) {
            if (auth()->attempt(array('email' => $request->input('email'),
              'password' => $request->input('password')),true))
            {
                return response()->json('success');
            }
           return response()->json(['error'=>'Не верный пароль!']);
        }

        return response()->json(['error'=>$validator->errors()->all()]);
    }
}
