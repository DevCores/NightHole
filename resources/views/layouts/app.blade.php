<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <title>the NightHold - Бесплатный игровой сервер World of Warcraft</title>
        <bgsound src="song.html" loop="infinite">
        <link rel="shortcut icon" href="assets/favicon.gif">
        <title>{{ config('app.name', 'Laravel') }}</title>
        <meta name="csrf-token" content="{{ csrf_token() }}">
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
                        <img src="assets/images/logo.png" class="featured_image">
                        <li><a href="{{ url('/') }}">ГЛАВНАЯ</a></li>
                        <li><a href="/"> КАК НАЧАТЬ ИГРАТЬ</a></li>
                        <li><a href="/">РЕГИСТРАЦИЯ</a></li>
                        <li><a href="/">ФОРУМ</a></li>
                        <li><a href="/">ЛАДДЕР</a></li>
                        <li><a href="/">ПОДДЕРЖКА</a></li>
                    </ul>
                    <ul class="right main-nav">
                        <li class="xgreen-overlay"><a class="cd-signin" href="#0">ВХОД | РЕГИСТРАЦИЯ</a></li>
                    </ul>
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
                    <form class="cd-form" method="POST" action="{{ route('login')}}">
                        @csrf
                        <p class="fieldset">
                            <label class="image-replace cd-email" for="signin-email">E-mail</label>
                            <input class="full-width has-padding has-border" id="signin-email" type="email" placeholder="E-mail">
                            <span class="cd-error-message">Error message here!</span>
                        </p>
                        <p class="fieldset">
                            <label class="image-replace cd-password" for="signin-password">Password</label>
                            <input class="full-width has-padding has-border" id="signin-password" type="text" placeholder="Password">
                            <a href="#0" class="hide-password">Скрыть</a>
                            <span class="cd-error-message">Error message here!</span>
                        </p>
                        <p class="fieldset">
                            <input type="checkbox" id="remember-me" checked="">
                            <label for="remember-me">Запомнить меня</label>
                        </p>
                        <p class="fieldset">
                            <button  class="btn btn_legion" type="submit">Войти</button>
                        </p>
                    </form>
                    <p class="cd-form-bottom-message"><a href="#0">Forgot your password?</a></p>
                    <!-- <a href="#0" class="cd-close-form">Close</a> -->
                </div>
                <!-- cd-login -->
                <div id="cd-signup">
                    <!-- sign up form -->
                    <form class="cd-form" method="POST" action="/">
                        <p class="fieldset">
                            <label class="image-replace cd-username" for="signup-username">Username</label>
                            <input class="full-width has-padding has-border" id="signup-username" type="text" placeholder="Username">
                            <span class="cd-error-message">Error message here!</span>
                        </p>
                        <p class="fieldset">
                            <label class="image-replace cd-email" for="signup-email">E-mail</label>
                            <input class="full-width has-padding has-border" id="signup-email" type="email" placeholder="E-mail">
                            <span class="cd-error-message">Error message here!</span>
                        </p>
                        <p class="fieldset">
                            <label class="image-replace cd-password" for="signup-password">Password</label>
                            <input class="full-width has-padding has-border" id="signup-password" type="text" placeholder="Password">
                            <a href="#0" class="hide-password">Скрыть</a>
                            <span class="cd-error-message">Error message here!</span>
                        </p>
                        <p class="fieldset">
                            <input type="checkbox" id="accept-terms">
                            <label for="accept-terms">Я согласен с <a href="#0">Плавилами сервера</a></label>
                        </p>
                        <p class="fieldset">
                            <button  class="btn btn_legion" type="submit" >Создать</button>
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
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
    </body>