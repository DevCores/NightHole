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
         
         <br>
         <br>
         <br>
         <br>
         <br>
            <div class="gotoplay">
                    <a href="{{route('paymentadd')}}" class="butt">ПОПОЛНИТЬ</a>
            </div>
         
         <br>
         <br>
         <br>
         <br>
         </div>
      </div>
   </div>
</div>
@endsection



