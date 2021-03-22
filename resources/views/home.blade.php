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
         <div id="content-box" class="col-12">

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



