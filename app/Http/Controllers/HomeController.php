<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Realmlist;
use App\Models\DynamicDatabase;
use \DB;
use \Auth;
use App\Services\Soap\Soap;
use SoapClient;

class HomeController extends Controller
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
    public function index(Request $request)
    {
        $data = [];
        $data['account'] = \DB::connection('auth')->table('account')->where('email', Auth::user()->email)->first();
        if (isset($request->realm)) {
            $data['realmsselected'] = Realmlist::where('char',$request->realm)->first()->name;
            $characters = DynamicDatabase::getChar($request->realm, $data['account']->id);
            $request->session()->forget('realm');
            $request->session()->forget('realmsselected');
            $request->session()->forget('characterselected');
            $request->session()->put('realm', $characters);
            $request->session()->put('realmsselected', $data['realmsselected']);

            
        }

        if (isset($request->character)) {
            $data['characterselected'] = $request->character;

            $request->session()->forget('characterselected');
            $request->session()->put('characterselected', $data['characterselected']);
        }
        
        if ($request->session()->has('realm')) {
            $data['characters'] = $request->session()->get('realm');
        }
        if (isset($request->helpchar)) {
            (new Soap)->cmd('.unstuck '.$request->helpchar.'');
            (new Soap)->cmd('.revive '.$request->helpchar.'');
            $data['success'] = 'Персонаж '.$request->helpchar.' восстановлен';
        }
        
        
        

        $realms = Realmlist::all();
        foreach ($realms as $realm) {
           $data['realms'][$realm->id] = [
            "id" => $realm->id,
            "name" => $realm->name,
            "world_id" => $realm->world_id,
            "ip" => $realm->ip,
            "port" => $realm->port,
            "char" => $realm->char,
            "world" =>  $realm->world,
           ];
        }

        return view('home', compact('data'));
    }
}
