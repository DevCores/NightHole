<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App;
use Config;
use Session;

class Locale
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {   
        $raw_locale = Session::get('locale');     # Если пользователь уже был на нашем сайте, 
                                                  # то в сессии будет значение выбранного им языка.
            $locale = $raw_locale;                                # (а не какая-нибудь бяка) 
        App::setLocale($locale);
        return $next($request);                                   # И позволяем приложению работать дальше
    }
}
