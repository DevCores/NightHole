<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \Auth;
use App\Models\Logs;
use App\Models\FreeKassa;

class FreeKassaController extends Controller
{
	 /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }
        /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function payment()
    {

        return view('freekassa.payment');
    }
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function paymentadd()
    {
        
        return view('freekassa.paymentadd');
    }

    
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function paymentaddvalute(Request $request)
    {
        if ($request->option) {
           return view('freekassa.paymentaddvalute', compact('request'));
        }elseif($request->sum){

            $order_id = time();
            $sum      = number_format(intval($request->sum), 2, '.', '');
            $sign     = md5(env('MERCHANT_ID_FREEKASSA').':'.$sum.':'.env('SECRET_WORD_FREEKASSA').':'.$order_id);
            

            FreeKassa::create([
            'order_id'   => $order_id,    
            'email'   => Auth::user()->email,
            'sign'    => $sign,
            'count'   => $sum,
            'payment' => 0, 
        ]);    

            $pay   = [
                'merchant' => env('MERCHANT_ID_FREEKASSA'),
                'count'      => $sum,
                'order_id' => $order_id,
                'sign' => $sign,
                'user' => Auth::user()->email,
                
            ];
           return view('freekassa.paymentvalute', compact('pay'));
        }elseif($request->sumsucces){
            echo "На оплату";
          
        }else{
            return redirect(route('paymentadd'));
        }
        
    }

    
}
