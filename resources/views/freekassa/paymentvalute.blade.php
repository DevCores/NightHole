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
               <!----> <!----> 
               
               <div data-v-15e52fe7="" data-v-15d61d2e="" >
                  <div data-v-15e52fe7="" data-v-15d61d2e="" class="mt-4">
                     Проверьте корректность суммы для оплаты.
                  </div>
                  <form action="https://www.free-kassa.ru/merchant/cash.php" method="GET">
                     @csrf
                     <div data-v-15e52fe7="" data-v-15d61d2e="" class="row">
                        <div data-v-15e52fe7="" data-v-15d61d2e="" class="col-sm-12 col-md-6 col-xl-4"><input placeholder="{{$pay['count']}}" data-v-15e52fe7="" data-v-15d61d2e="" type="number" name="sumsucces" id="code" autofocus="autofocus" class="mt-3" aria-required="true" aria-invalid="false" value="{{$pay['count']}}" disabled="">
                        </div>
                         <input type='hidden' name='m' value='{{$pay["merchant"]}}'>
                         <input type='hidden' name='oa' value='{{$pay["count"]}}'>
                         <input type='hidden' name='o' value='{{$pay["order_id"]}}'>
                         <input type='hidden' name='s' value='{{$pay["sign"]}}'>
                         <input type='hidden' name='lang' value='ru'>
                         <input type='hidden' name='us_login' value='{{$pay["user"]}}'>
                        


                     </div>
                     </div>
                     <div data-v-15e52fe7="" data-v-15d61d2e="" class="row mt-4">
                        <div data-v-15e52fe7="" data-v-15d61d2e="" class="col-12"><button data-v-312dd04b="" data-v-15e52fe7="" id="sms-protection-submit" class="btn btn-primary mr-3" type="submit" data-v-15d61d2e="">
                           Подтвердить
                           </button> <a href="{{url()->previous()}}" data-v-312dd04b="" data-v-15e52fe7="" id="902462655" class="btn-secondary mt-3 mt-md-0 btn" type="button" data-v-15d61d2e="">Отмена</a>
                        </div>
                     </div>
                  </form>
               </div>
               <!----> <!---->
            </div>
         </div>
      </div>
   </div>
@endsection