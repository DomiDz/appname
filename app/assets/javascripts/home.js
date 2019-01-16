$( document ).ready(function() {
  var nav = $('#nav');
  var hamburger = $('#hamburger-icon');
  hamburger.click(function() {
     hamburger.toggleClass('active');
     nav.toggleClass('nav');
     return false;
  });
});

// function myFunction(x) {
//   if (mobile.matches) { // vw < 1000px
//
//
//   } else if (padvertical.matches) { // vw < 1400px
//
//
//
//   }
//   else { // vw > 1400px

    window.onresize = function homeSite (){
      var home = document.getElementById("Home");
      var height = window.innerHeight;
      var width = window.innerWidth;
      home.style.height = height + 'px';
     }

    $( document ).ready(function() {
      var btnhover =$('#photobtn');
      btnhover.mouseover(function() {
        $('.photobtn').css('bottom','60%');
        $('.photography').css('height','60%');
        $('.name').css('display','none');
      });
        btnhover.mouseout(function() {
          $('.photobtn').css('bottom','30%');
          $('.photography').css('height','30%');
          $('.name').css('display','unset');
      });
    });

    $( document ).ready(function() {
      var btnhover =$('#productbtn');
      btnhover.mouseover(function() {
        $('.productbtn').css('bottom','60%');
        $('.product-design').css('height','60%');
      });
        btnhover.mouseout(function() {
          $('.productbtn').css('bottom','30%');
          $('.product-design').css('height','30%');

      });
    });
//   }
// }

// var padvertical = window.matchMedia("(max-width: 1400px)")
// var mobile = window.matchMedia("(max-width: 1000px)")
// myFunction(x) // Call listener function at run time
// x.addListener(myFunction) // Attach listener function on state changes
