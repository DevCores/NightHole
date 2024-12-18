<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DynamicDatabase extends Model
{
    use HasFactory;
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public static function getOnline($char)
    {
            \Config::set('database.connections.characters.database', $char);
            $count = \DB::connection('characters')->table('characters')->where('online', 1)->count();
            \DB::purge('characters');
        return $count;
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public static function getChar($database, $id)
    {
            \Config::set('database.connections.characters.database', $database);
            $characters = \DB::connection('characters')->table('characters')->where('account', $id)->get();
            \DB::purge('characters');
        return $characters;
    }
}
