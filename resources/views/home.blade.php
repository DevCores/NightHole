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
      <div id="content" >
         <div id="content-box" class="col-10">
            @if(isset($data['success']))
            <div class="alert alert-success" role="alert">
              {{$data['success']}}
            </div>
            @endif
            <div class="form-group">
             <label for="exampleFormControlSelect1">Выбрать мир</label>
             <form action="{{route('home')}}" method="POST">
               @csrf
             <select name="realm" onchange="this.form.submit()" class="form-control" id="exampleFormControlSelect1">
               <option>@if(Session::has('realmsselected')) {{Session::get('realmsselected')}} @else Выбрать реалм @endif</option>
               @foreach($data['realms'] as $realm)
               <option value="{{$realm['char']}}">{{$realm['name']}}</option>
               @endforeach
             </select>
             </form>
           </div>
           @if(Session::get('realm'))
           @if(Session::get('realm')->count() != 0)
           <form action="{{route('home')}}" method="POST">
               @csrf
             <select name="character" onchange="this.form.submit()" class="form-control" id="exampleFormControlSelect1">
               <option>@if(Session::has('characterselected')) Выбран ({{Session::get('characterselected')}}) @else Выбрать персонажа @endif</option>
               @foreach($data['characters'] as $character)

               <option value="{{$character->name}}">{{$character->name}} ({{$character->level}} уровень)</option>
               @endforeach
             </select>
           </form>
           @else
           у вас нет персонажей на этом реалме
           @endif
           @endif
  
                         <a href="{{route('paymentadd')}}" class="butt butt_lk">ПОПОЛНИТЬ</a>


            @if(Session::has('characterselected'))
               <form id="helpchar" action="{{route('home')}}" method="POST">
                  @csrf
                  <input type="text" name="helpchar" value="{{Session::get('characterselected')}}" hidden>
                   <a onclick="document.getElementById('helpchar').submit()" class="butt butt_lk">ВЫТАЩИТЬ ПЕРСОНАЖА "{{Session::get('characterselected')}}"</a>
               </form>
                   
            @endif
         
         
         </div>
      </div>
   </div>
</div>
@endsection



