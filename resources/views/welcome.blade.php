@extends('layouts.app')

@section('content')
<div id="holder" class="main">
   <div id="container" class="main">
      <div id="sidebar">
         <div id="">
         </div>
         <div id="sidebar-box">
            <!-- Youtube Widget -->
            <iframe width="350" height="200" src="https://www.youtube.com/embed/AkhjrRR9J7A" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            <h1></h1>
            <div id="ts3viewer_1089256" style=""> </div>
            <!-- Discord Widget -->
            <iframe src="https://discord.com/widget?id=816674438791036948&theme=dark" width="350" height="500" allowtransparency="true" frameborder="0" sandbox="allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts"></iframe>
            <h1></h1>
            <script type="text/javascript" src="https://vk.com/js/api/openapi.js?168"></script>
            <!-- VK Widget -->
            <div id="vk_groups"></div>
            <script type="text/javascript">
               VK.Widgets.Group("vk_groups", {mode: 1, width: "350"}, 132486022);
            </script>
         </div>
      </div>
      <div id="content">
         <div id="page">
         </div>
         @if($posts->count() > 0)
         @foreach($posts as $post)
         <div id="content-box">
            <img src="storage/{{$post->image}}" class="featured_image">
            <h1>{{$post->title}}</h1>
            <h2>Опубликовано: {{Date::parse($post->created_at)->format('j F Y ')}}  </h2>
            <h2> Категория: {{$post->category->name}}  </h2>
            <p>{!!$post->body!!}</p>
         </div>
         @endforeach
         @else
         <div id="content-box">
            <img src="assets/images/news-legionaccepted.jpg" class="featured_image">
            <center><h1>Новости не добавлялись</h1></center>
         </div>
         @endif
         @if($hows->count() > 0)
         <div id="features">
            <h4 class="big">ПОЧЕМУ МЫ?</h4>
            @foreach($hows as $how)
            <div id="feature_box">
               <img src="storage/{{$how->image}}">
               <h4>{{$how->title}}</h4>
               {!!$how->body!!}
            </div>
            @endforeach
         </div>
         @endif
      </div>
   </div>
</div>
@endsection