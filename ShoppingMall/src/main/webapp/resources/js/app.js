//获取当前上下文路径
var websitePath = window.document.location.href;
var completePath = window.document.location.pathname;  
var index = websitePath.indexOf(completePath);
var localhostPath = websitePath.substring(0,index);

completePath = completePath.substring(1,completePath.length);
completePath = completePath.substring(0,completePath.indexOf("/"));


//path拼起来之后的路径就是http://localhost:18080/SmartBridge/
var path = localhostPath + "/" + completePath + "/"; 
//BACKGROUND CHANGER

  $(function() {
      $("#button-bg").click(function() {
          $("body").css({
              "background": "url('" + path + "resources/img/bg5.jpg')no-repeat center center fixed"
          });
          //$("framework").body.style.background="url('" + path + "resources/img/bg5.jpg')no-repeat center center fixed";
          //var frame = $("framework");
          //frame.body.style.backgroundColor = "#ff0000";
          var frame = document.getElementById("framework");
          frame.body.style.backgroundColor = "#ff0000";
          
      });
      
      $("#button-bg2").click(function() {
          $("body").css({
              "background": "url('" + path + "resources/img/bg2.jpg')no-repeat center center fixed"
          });
      });

      $("#button-bg3").click(function() {
          $("body").css({
              "background": "url('" + path + "resources/img/bg.jpg')no-repeat center center fixed"
          });


      });

      $("#button-bg5").click(function() {
          $("body").css({
              "background": "url('" + path + "resources/img/giftly.png')repeat"
          });

      });

      $("#button-bg6").click(function() {
          $("body").css({
              "background": "#2c3e50"
          });

      });

      $("#button-bg7").click(function() {
          $("body").css({
              "background": "url('" + path + "resources/img/bg3.png')repeat"
          });

      });
      $("#button-bg8").click(function() {
          $("body").css({
              "background": "url('" + path + "resources/img/bg8.jpg')no-repeat center center fixed"
          });
      });
      $("#button-bg9").click(function() {
          $("body").css({
              "background": "url('" + path + "resources/img/bg9.jpg')no-repeat center center fixed"
          });
      });

      $("#button-bg10").click(function() {
          $("body").css({
              "background": "url('" + path + "resources/img/bg10.jpg')no-repeat center center fixed"
          });
      });
      $("#button-bg11").click(function() {
          $("body").css({
              "background": "url('" + path + "resources/img/bg11.jpg')no-repeat center center fixed"
          });
      });
      $("#button-bg12").click(function() {
          $("body").css({
              "background": "url('" + path + "resources/img/bg12.jpg')no-repeat center center fixed"
          });
      });

      $("#button-bg13").click(function() {
          $("body").css({
              "background": "url('" + path + "resources/img/bg13.jpg')repeat"
          });

      });
      /**
       * Background Changer end
       */
  });

  	//TOGGLE CLOSE
    $('.nav-toggle').click(function() {
        //get collapse content selector
        var collapse_content_selector = $(this).attr('href');

        //make the collapse content to be shown or hide
        var toggle_switch = $(this);
        $(collapse_content_selector).slideToggle(function() {
            if ($(this).css('display') == 'block') {
                //change the button label to be 'Show'
                toggle_switch.html('<span class="entypo-minus-squared"></span>');
            } else {
                //change the button label to be 'Hide'
                toggle_switch.html('<span class="entypo-plus-squared"></span>');
            }
        });
    });


    $('.nav-toggle-alt').click(function() {
        //get collapse content selector
        var collapse_content_selector = $(this).attr('href');

        //make the collapse content to be shown or hide
        var toggle_switch = $(this);
        $(collapse_content_selector).slideToggle(function() {
            if ($(this).css('display') == 'block') {
                //change the button label to be 'Show'
                toggle_switch.html('<span class="entypo-up-open"></span>');
            } else {
                //change the button label to be 'Hide'
                toggle_switch.html('<span class="entypo-down-open"></span>');
            }
        });
        return false;
    });
    //CLOSE ELEMENT
    $(".gone").click(function() {
        var collapse_content_close = $(this).attr('href');
        $(collapse_content_close).hide();



    });

//tooltip
    $('.tooltitle').tooltip();
 