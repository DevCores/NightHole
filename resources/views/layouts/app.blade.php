<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <title>{{setting('site.title')}} - {{setting('site.description')}}</title>
        <bgsound src="song.html" loop="infinite">
        <link rel="shortcut icon" href="assets/favicon.gif">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="{{ asset('assets/css/style.css') }}" rel="stylesheet">
        <link href="{{ asset('assets/css/main.css') }}" rel="stylesheet">
        <link rel="stylesheet" media="screen and (min-width: 0px) and (max-width: 1200px)" href="{{ asset('assets/css/mid.css') }}">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,600,300' rel='stylesheet' type='text/css'>
        <link href="https://fonts.googleapis.com/css?family=Fjalla+One" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Proza+Libre:500,600' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Mukta+Vaani:800,700,600' rel='stylesheet' type='text/css'>
        <meta name="viewport" content="width=device-width">
        <script TYPE="text/javascript">
            function popup(mylink, windowname) { 
              if (! window.focus)return true;
              var href;
              if (typeof(mylink) == 'string') href=mylink;
              else href=mylink.href; 
              window.open(href, windowname, 'width=400,height=200,scrollbars=yes'); 
              return false; 
            }
             document.oncontextmenu = cmenu; function cmenu() { return false; } 
        </script>
    </head>
    <body>
        <div id="holder" class="header">
            <div id="container" class="navigation">
                <div id="logo">
                </div>
                <div id="navigation">

                    <ul>
                        <img src="/storage/{{setting('site.logo')}}" class="featured_image">
                        {{menu('Меню сайта')}}
                         <li tabindex="1" class="online" data-html="true" data-toggle="popover" data-placement="bottom" data-trigger="hover" data-containertitle="true" data-content="<div class='bs4'>                                <div class='d-flex justify-content-between'>
                                    <div class='mr-3'>NightHold x10 - 3.3.5а+ </div>
                                    <div>54</div>
                                </div>
                                                              <div class='d-flex justify-content-between'>
                                    <div class='mr-3'>NightHold x2 - 3.3.5a+</div>
                                    <div>6046</div>
                                </div>
                                                              <div class='d-flex justify-content-between'>
                                    <div class='mr-3'>NightHold x3 - 3.3.5a+</div>
                                    <div>102</div>
                                </div>
                                                              <div class='d-flex justify-content-between'>
                                    <div class='mr-3'>NightHold x4 - 3.3.5a</div>
                                    <div>6678</div>
                                </div>
                               </div>"><div>В игре : 300</div></li>

                        
                        
                        
                    </ul>
                    @auth
                    
                    <form action="{{ route('logout') }}" method="POST">
                            @csrf
                            <ul class="right main-nav">
                            <li class="xgreen-overlay"><button class="exit" type="submit">ВЫХОД</button></li>
                            </ul>
                    </form>
                    
                    <ul class="right main-nav">
                        <li class="xgreen-overlay"><span>{{ auth::user()->email}}</span></li>
                    </ul>
                    @else
                    <ul class="right main-nav">
                        <li class="xgreen-overlay"><a class="cd-signup" href="#">РЕГИСТРАЦИЯ</a></li>
                        <li class="xgreen-overlay"><a class="cd-signin" href="#">ЛИЧНЫЙ КАБИНЕТ</a></li>
                    </ul>
                    @endauth
                   
                </div>
            </div>
        </div>
        <div id="holder" class="intro">
        <div id="container" class="intro">
            <video loop="" muted="" autoplay="" poster="assets/images/illidan-still.html" id="bgvid">
                <source src="assets/images/serverintro.webm" type="video/webm">
                </source>
            </video>
            <div id="introtext">
                <div class="gotoplay">
                    <a  href="#" class="butt">Начать играть</a>
                </div>
            </div>
            @yield('content')
        </div>
        <div id="holder" class="footer">
        <div id="container" class="footer">
            <a href="#">написать администрации</a> - <a href="#">голосовать за сервер</a> - <a href="#">информация о сервере</a> - <a href="#">как начать играть</a><br><br>
            Copyright &copy; NightHold 2020-2021. Все права защищены.
            <audio src="" autoplay>
        </div>
        <div class="cd-user-modal">
            <!-- this is the entire modal form, including the background -->
            <div class="cd-user-modal-container">
                <!-- this is the container wrapper -->
                <ul class="cd-switcher">
                    <li><a href="#0" class="selected">АВТОРИЗАЦИЯ</a></li>
                    <li><a href="#0">РЕГИСТРАЦИЯ</a></li>
                </ul>
                <div id="cd-login" class="is-selected">
                    <!-- log in form -->
                     <center><div id="errorlogin" class="text-danger" hidden></div></center>
                    <form class="cd-form" method="POST">
                        
                       
                        <p class="fieldset">
                            <label class="image-replace cd-email" for="signin-email">E-mail</label>
                            <input id="email" type="email" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus placeholder="Эл. почта или Телефон" class="full-width has-padding has-border" >
                            
                        </p>
                        <p class="fieldset">
                            <label class="image-replace cd-password" for="signin-password">Password</label>
                            <input  type="text" name="password" required autocomplete="current-password" placeholder="Пароль" class="full-width has-padding has-border">
                            <a href="#" class="hide-password">Скрыть</a>
                            
                        </p>
                        <p class="fieldset">
                            <button  id="loginBtn" class="btn btn_legion">Войти</button>
                        </p>
                    </form>
                    <p class="cd-form-bottom-message"><a href="#0">Forgot your password?</a></p>
                    <!-- <a href="#0" class="cd-close-form">Close</a> -->
                </div>
                <!-- cd-login -->
                <div id="cd-signup">
                     <center><div id="errorreg" class="text-danger" hidden></div></center>
                    <!-- sign up form -->
                    <form class="cd-form">
                       
                        <p class="fieldset">
                            <label class="image-replace cd-username" for="signup-username">Username</label>
                            <input type="text" name="namereg" placeholder="Имя" class="full-width has-padding has-border">
                        </p>
                        <p class="fieldset">
                            <label class="image-replace cd-email" for="signup-email">E-mail</label>
                            <input type="email" name="emailreg" placeholder="Электронная Почта" class="full-width has-padding has-border">
                            <span class="cd-error-message">Error message here!</span>
                        </p>
                        <p class="fieldset">
                            <label class="image-replace cd-password" for="signup-password">Password</label>
                            <input type="password" name="passwordreg" placeholder="Пароль" class="full-width has-padding has-border">
                            <a href="#0" class="hide-password">ПОКАЗАТЬ</a>
                        </p>
                        <p class="fieldset">
                            <label class="image-replace cd-password" for="signup-password">Password confirm</label>
                            <input type="password" name="password_confirmation" placeholder="Подтверждение пароля" class="full-width has-padding has-border">
                            <a href="#0" class="hide-password">ПОКАЗАТЬ</a>
                        </p>
                        <p class="fieldset">
                            <label class="image-replace cd-password" for="signup-password">Password confirm</label>
                            <input type="text" name="ref" placeholder="Код приглашения (не обязательно)" value="" class="full-width has-padding has-border">
                        </p>
                        <p class="fieldset">
                            <button  id="regBtn" class="btn btn_legion" >Создать</button>
                        </p>
                    </form>
                    <!-- <a href="#0" class="cd-close-form">Close</a> -->
                </div>
                <!-- cd-signup -->
                <div id="cd-reset-password">
                    <!-- reset password form -->
                    <p class="cd-form-message">Lost your password? Please enter your email address. You will receive a link to create a new password.</p>
                    <form class="cd-form">
                        <p class="fieldset">
                            <label class="image-replace cd-email" for="reset-email">E-mail</label>
                            <input class="full-width has-padding has-border" id="reset-email" type="email" placeholder="E-mail">
                            <span class="cd-error-message">Error message here!</span>
                        </p>
                        <p class="fieldset">
                            <input class="full-width has-padding" type="submit" value="Reset password">
                        </p>
                    </form>
                    <p class="cd-form-bottom-message"><a href="#0">Back to log-in</a></p>
                </div>
                <!-- cd-reset-password -->
                <a href="#0" class="cd-close-form">Close</a>
            </div>
            <!-- cd-user-modal-container -->
        </div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="{{ asset('assets/js/main.js') }}"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function() {
            $('.online').popover({
              trigger: 'hover'
            })
            $("#loginBtn").click(function(e) {
                        $("#loginBtn").attr('disabled', 'disabled').fadeIn(1000);
                        $("#errorlogin").prop("hidden", true);
                        

                        $.ajaxSetup({
                            headers: {
                                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                            }
                        });

                        e.preventDefault();
                        var email = $("input[name='email']").val();
                        var password = $("input[name='password']").val();


                        $.ajax({
                            url: '{{ route('login') }}',
                            type: 'POST',
                            data: {
                                email: email,
                                password: password
                            },
                            success: function(data) {
                                if ($.isEmptyObject(data.error)) {
                                    $("#errorlogin").text('Успешная авторизация').removeClass('text-danger').addClass('text-success');
                                    $("#errorlogin").removeAttr('hidden');
                                    setTimeout(function(){
                                       document.location.href='{{ route('home') }}';
                                    }, 1500);
                                

                                    
                                } else {
                                    $("#loginBtn").removeAttr('disabled');
                                    $("#errorlogin").text(data.error).removeClass('text-success').addClass('text-danger');
                                    $("#errorlogin").removeAttr('hidden');
                                   
                                    

                                }
                            }
                        });

                    });

                    $("#regBtn").click(function(e) {
                        $("#regBtn").attr('disabled', 'disabled').fadeIn(1000);
                        $("#errorreg").prop("hidden", true);

                        $.ajaxSetup({
                            headers: {
                                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                            }
                        });

                        e.preventDefault();
                        var name = $("input[name='namereg']").val();
                        var email = $("input[name='emailreg']").val();
                        var password = $("input[name='passwordreg']").val();
                        var password_confirmation = $("input[name='password_confirmation']").val();
                        var ref = $("input[name='ref']").val();


                        $.ajax({
                            url: '{{ route('register') }}',
                            type: 'POST',
                            data: {
                                name: name,
                                email: email,
                                password: password,
                                password_confirmation: password_confirmation,
                                ref: ref
                            },
                            success: function(data) {
                                if ($.isEmptyObject(data.error)) {
                                    $("#errorreg").removeAttr('hidden');
                                    $("#errorreg").text('Регистрация успешна! Теперь вы можете войти в личный кабинет используя свой Email и пароль').removeClass('text-danger').addClass('text-success');
                                    
                                } else {
                                    $("#regBtn").removeAttr('disabled');
                                    $("#errorreg").removeAttr('hidden');
                                    $("#errorreg").removeClass('text-success').addClass('text-danger');
                                    
                                        data.error.forEach(function(item, i, arr) {
                                          $("#errorreg").append("<center>"+item+"</center>");
                                        });
                                      

                                    

                                }
                            }
                        });

                    });

                    
                });
        </script>
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
    </body>