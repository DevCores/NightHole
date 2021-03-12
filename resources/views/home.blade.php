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
         
         <div id="features">
            <h4 class="big">ПОЧЕМУ МЫ?</h4>
            <div id="feature_box">
               <img src="assets/images/featured-server.jpg">
               <h4>Работоспособность</h4>
               Круглосуточная поддержка, обновления мира происходят еженедельно.
            </div>
            <div id="feature_box">
               <img src="assets/images/topgame.jpg">
               <h4>Комфортная игра</h4>
               Сервер расположен в Москве, благодаря этому у нас всегда минимальный пинг.
            </div>
            <div id="feature_box">
               <img src="assets/images/featured-legion.jpg">
               <h4>Высокий онлайн</h4>
               Найдите новых друзей или компанию для совместной игры на нашем сервере.
            </div>
            <div id="feature_box">
               <img src="assets/images/nodonate.jpg">
               <h4>Отсутствие доната</h4>
               На нашем сервере нельзя приобрести предметы, которые повлияют на игровой процесс.
            </div>
         </div>
      </div>
   </div>
</div>
@endsection



