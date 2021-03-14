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
}
