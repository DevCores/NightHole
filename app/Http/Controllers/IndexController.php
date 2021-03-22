<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use TCG\Voyager\Models\Post;
use App\Models\How;
use \App;
use Session;


class IndexController extends Controller
{

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {

    	$posts = Post::all()->translate(Session::get('locale'));
    	$hows = How::all()->translate(Session::get('locale'));

        return view('welcome' , compact('posts', 'hows'));
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function check(Request $request)
    { 
        $sign = md5($request->MERCHANT_ID.':'.$request->AMOUNT.':'.env('SECRET_WORD_FREEKASSA2').':'.$request->MERCHANT_ORDER_ID);
        if ($request->SIGN == $sign) {
           $order = Orders::where('order_id' , $request->MERCHANT_ORDER_ID)->first(); 
           if ($order->payment == 0) {
              Orders::where('order_id' , $request->MERCHANT_ORDER_ID)->update(['payment' => 1]);
              $user = User::where('email', $request->us_login)->first();
              $count = $user->balance+$request->AMOUNT;
              User::where('email', $request->us_login)->update(['balance' => $count]);
                $Logs = new Logs;
                $Logs->operation = 'Пополнение баланса';
                $Logs->name = 'Аккаунт '.$user->login;
                $Logs->email = $user->email;
                $Logs->type_bonus = 'RUB';
                $Logs->bonus = $request->AMOUNT;
                $Logs->balance = $count;
                $Logs->uid = $user->id;
                $Logs->save(); 
           }
           

        }
        
        /*if ($request->SIGN) {
             $user = Orders::where('sign' , $request->SIGN)->first();
              Orders::create([
                    'order_id'   => $user->order_id, 
                    'email'   => $request->MERCHANT_ORDER_ID,
                    'sign'    => $request->SIGN,
                    'count'   => $request->AMOUNT,
                    'payment' => 1,
                ]);
            if ($user->order_id == $request->MERCHANT_ORDER_ID && $user->payment == 0) {
                Orders::create([
                    'order_id'   => $request->MERCHANT_ORDER_ID, 
                    'email'   => $request->MERCHANT_ORDER_ID,
                    'sign'    => $request->SIGN,
                    'count'   => $request->AMOUNT,
                    'payment' => 1,
                ]);
               Orders::where('sign' , $request->SIGN)->update(['payment' => 1]);
            }
        }*/
          
    }
}
