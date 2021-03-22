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
         <div id="content-box">
   <div data-v-2d0dc31c="" class="add-payment">

         <!----> 
         <div data-v-15d61d2e="" data-v-2d0dc31c="" id="765868051" class="">
            <div data-v-15d61d2e="" class="card-title">
               <div data-v-2d0dc31c="" data-v-15d61d2e="">
                  <h3 data-v-2d0dc31c="" data-v-15d61d2e="">Выбрать тип оплаты</h3>
               </div>
            </div>
            <!----> 
            <div data-v-15d61d2e="" class="card-body">
               <form action="{{route('paymentaddvalute')}}" method="POST">
                  @csrf
               <div data-v-2d0dc31c="" data-v-15d61d2e="" class="" data-placeholder-id="placeholder-7c216bd0-390b-11ea-b37f-6f1b02d127fc">
                  <ul data-v-2d0dc31c="" data-v-15d61d2e="" class="wallet-options">
                     <li data-v-2d0dc31c="" data-v-15d61d2e="">
                        <div data-v-2d0dc31c="" data-v-15d61d2e="" class="custom-control custom-radio"><input data-v-2d0dc31c="" data-v-15d61d2e="" type="radio" name="option" id="creditcard" class="custom-control-input" value="FreeKassa" checked="checked"> <label data-v-2d0dc31c="" data-v-15d61d2e="" for="creditcard" class="custom-control-label">
                           FreeKassa
                           </label>
                        </div>
                     </li>
                     <li data-v-2d0dc31c="" data-v-15d61d2e="">
                        <div data-v-2d0dc31c="" data-v-15d61d2e="" class="custom-control custom-radio"><input data-v-2d0dc31c="" data-v-15d61d2e="" type="radio" name="option" id="paypal" class="custom-control-input" value="paypal" disabled=""> <label data-v-2d0dc31c="" data-v-15d61d2e="" for="paypal" class="custom-control-label">
                           PayPal(В разработке)
                           </label>
                        </div>
                     </li>
                  </ul>
                  <div data-v-2d0dc31c="" data-v-15d61d2e="" class="flex-btn-group"><button type="submit" data-v-312dd04b="" data-v-2d0dc31c="" id="902462655" class="btn-primary btn" data-v-15d61d2e="">Продолжить</button> <a data-v-2d0dc31c="" data-v-15d61d2e="" href="{{route('home')}}" class="btn btn-secondary back-btn">Отмена</a></div>
               </div>
               </form>
            </div>
         </div>
         <!---->

      </div>
      </div>
      </div>


</section>
@endsection