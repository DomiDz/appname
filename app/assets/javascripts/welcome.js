window.onload = function welcomeSize () {
    var home = document.getElementById("Home");
    var welcomescreen = document.getElementById("welcome");
    var height = window.innerHeight;
    var width = window.innerWidth;
    welcomescreen.style.backgroundColor = '#ececec';
    welcomescreen.style.height = height + 'px';
    welcomescreen.style.width = width + 'px';
    home.style.height = height + 'px';


    var logo = document.getElementById('logo_start');
    logo.style.height = height / 2 +'px';
    logo.style.display = 'block';

    var logoWidth = logo.offsetWidth;

    var wrap = document.getElementById('wrap');
    wrap.style.paddingTop = height / 4 + 'px';
    wrap.style.paddingLeft = (width / 2) - logoWidth / 2 + 'px';

    document.getElementById('footer').style.height = '0px';
};



var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };
})();

var opacity = 0;
function logodelay(){
  if (opacity < 10) {
    opacity += 1;
    setTimeout(function(){logodelay();},50);
  }
  document.getElementById('logo_start').style.opacity = opacity / 10;

  if (opacity == 10){
    setTimeout(function(){document.getElementById('Home').scrollIntoView({behavior: 'smooth'});},1000);
  }

  setTimeout(function(){document.getElementById('welcome').style.display = 'none';},2000);
  setTimeout(function(){document.getElementById('footer').style.height = '30px';},2000);
}

delay(function(){logodelay();},500);


