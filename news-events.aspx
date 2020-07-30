<%@ Page Language="VB" AutoEventWireup="false" CodeFile="news-events.aspx.vb" Inherits="news_events_dynamic" %>

<%@ Register TagName="Header" TagPrefix="Control" Src="site-control/header.ascx" %>
<%@ Register TagName="Footer" TagPrefix="Control" Src="site-control/footer.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-28881967-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-28881967-1');
</script>

<!--<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">-->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<link rel="icon" href="images/android-chrome-96x96.png" type="image/x-icon" />
<link rel="shortcut icon" href="images/android-chrome-96x96.png" type="image/x-icon" />
<title>HIMALAYA Machinery Pvt. Ltd.</title>

<!-- Bootstrap -->
<link href="css/animate.css" rel="stylesheet">
<link rel="stylesheet" href="owl/owl.carousel.min.css">
<link rel="stylesheet" href="owl/owl.theme.default.min.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
	
<link href="css/jquery.smartmenus.bootstrap.css" rel="stylesheet">

	
<link href="css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/app.css">
<link href="css/component.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<link href="css/jquery.fancybox.css" property="stylesheet" rel="stylesheet" type="text/css" media="screen"/>
<link rel="stylesheet" href="css/prettyPhoto.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
<link rel="stylesheet" type="text/css" href="css/jquery.fancybox.css" />
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<link href="https://fonts.googleapis.com/css?family=Muli:400,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:400,400i,700,700i,900,900i" rel="stylesheet">

<style type="text/css">
/*.carousel-inner {background: #171717;}
.carousel-fade .carousel-inner .item {opacity: 0;-webkit-transition-property: opacity;-moz-transition-property: opacity;-o-transition-property: opacity;
	transition-property: opacity;}
.carousel-fade .carousel-inner .active {opacity: 1;}
.carousel-fade .carousel-inner .active.left, .carousel-fade .carousel-inner .active.right {left: 0;opacity: 0;z-index: 1;}
.carousel-fade .carousel-inner .next.left, .carousel-fade .carousel-inner .prev.right {opacity: 3;}
.carousel-fade .carousel-control {z-index: 2;}
.filterDiv {background-color: transparent;color: #ffffff;width: 100%;text-align: center;margin: 0px;display: none;}
.show {display: block;}

.btn {border: none;outline: none;padding: 12px 16px;background-color: transparent;cursor: pointer;color: #8687b6;}
.btn:hover {background-color: transparent;color: #3e4095;}
.btn.active.focus, .btn.active:focus, .btn.focus, .btn:active.focus, .btn:active:focus, .btn:focus {outline: none;outline: none;outline-offset: -2px;}
.btn.focus, .btn:focus, .btn:hover {color: #3e4095;text-decoration: none;}*/
</style>
</head>
<body>
    <form id="form1" runat="server">
   <Control:Header ID="Header1" runat="server" />
        <div class="main-inner">

    <div class="container">
    <div class="iner-banner-title">News & Events</div>
    <div class="inside-page-link"><a href="index.aspx">Home</a><span class="span-space">&raquo;</span>News & Events</div>
  </div>

</div>

        <div class="container">
          <div class="himalya-top-bot-pd">
            <!--<div class="title margin-bottom-30 bt-p">Plate Leveling Machines</div>-->
            <div class="row">
              
              <!--<div class="col-lg-6 col-md-6 col-sm-8 margin-bottom-30 right-pd-iner">
                  <div class="txt-iner margin-bottom-80">
                  <div class="black-title margin-bottom-20">The standard Lorem Ipsum passage, used since the 1500s</div>
                    <p>Under Construction.....</p>
                  </div>
                  
              </div>-->
              

                <div class="col-lg-12 margin-bottom-30">
                    <asp:ListView ID="LVMedia" runat="server" DataKeyNames="NWID" ItemCommand="LVMedia_ItemCommand" OnPagePropertiesChanging="OnPagePropertiesChanging">
                        <LayoutTemplate>
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                            <div class="pagination-bar">
                            <div class="pagination">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="30">
                                    <Fields>
                                        <asp:NumericPagerField CurrentPageLabelCssClass="num-active" NextPreviousButtonCssClass="num" NumericButtonCssClass="num" Visible="false" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="brd-bottom margin-bottom-10"><%#FormatText(DataBinder.Eval(Container.DataItem, "NW_Title"))%></div>
                                <div class="clearfix"></div>
                                <div class="margin-bottom-30">
                                    <p><%#FormatText(DataBinder.Eval(Container.DataItem, "NW_DetailDescription"))%></p>
                                </div>
                        </ItemTemplate>
                    </asp:ListView>
                    
                    <asp:Panel ID="pnlNoItemFoundMessage" runat="server" Visible="false">
                        <div class="bottom-margine-30px">
                            <p>No item found...</p>
                        </div>
                    </asp:Panel>    


                </div>









        
        <div class="clearfix"></div>
                


                
            </div>
            

            
          </div>
        </div>


        <Control:Footer ID="Footer1" runat="server" />
        <!--<div class="foter"></div>-->
<!-- /.carousel --><!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="js/jquery.min.js"></script>
<script src="js/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" charset="utf-8">
			$(document).ready(function(){
				$("area[rel^='prettyPhoto']").prettyPhoto();
				$(".gallery:first a[rel^='prettyPhoto']").prettyPhoto({animation_speed:'normal',social_tools:false,slideshow:3000, autoplay_slideshow: false});
				$(".gallery:gt(0) a[rel^='prettyPhoto']").prettyPhoto({animation_speed:'fast',slideshow:10000, hideflash: true});
			});
</script> 
<script src="js/jquery.rotateSlider.js"></script> 
<script src="js/app.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="js/bootstrap.min.js"></script>

<script src="js/wow.js"></script>
			
 <script type="text/javascript" src="js/jquery.smartmenus.js"></script>
    <script type="text/javascript" src="js/jquery.smartmenus.bootstrap.js"></script>

			
<script src="js/common.js"></script> 
<script type="text/javascript" src="source/jquery.fancybox.js"></script>
  <link href="source/jquery.fancybox.css" property="stylesheet" rel="stylesheet" type="text/css" media="screen"/>
  <script type="text/javascript">
		$(document).ready(function() {
	$('.fancybox2').fancybox({
		maxWidth	: 1600,
		maxHeight	: 800,
		fitToView	: true,
		width		: '90%',
		height		: '60%',
		autoSize	: true,
		closeClick	: true,
		openEffect	: 'fades',
		closeEffect	: 'fades'
		});
	});
	
	</script>

<script>
$(document).ready(function(){
  // Add smooth scrolling to all links
  $(".gry2").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 800, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
});
</script>

<script src="owl/owl.carousel.js"></script> 
<!--<script type="text/javascript">
$(document).ready(function () {
    $('.carousel').carousel({
        interval: 7000
    });

    
});
</script> -->


<script>
            $(document).ready(function() {
              $('#owl-carousel-text').owlCarousel({
                loop: true,
				autoplay:true,
	            margin: 10,
				dots:false,
				
                responsiveClass: true,
                responsive: {
                  0: {
                    items: 1,
                    nav: false, 
				    dots:true
                  },
                  600: {
                    items: 2,
                    nav: false,
				    dots:true
                  },
                  1000: {
                    items: 4,
                    nav: true,
                    loop: true,
                    margin: 20,
				    dots:true
                  }
                }
              })
            })
          </script>


<script>
filterSelection("all")
function filterSelection(c) {
  var x, i;
  x = document.getElementsByClassName("filterDiv");
  if (c == "all") c = "";
  for (i = 0; i < x.length; i++) {
    w3RemoveClass(x[i], "show");
    if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
  }
}

function w3AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
  }
}

function w3RemoveClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);     
    }
  }
  element.className = arr1.join(" ");
}

// Add active class to the current button (highlight it)
var btnContainer = document.getElementById("myBtnContainer");
var btns = btnContainer.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function(){
    var current = document.getElementsByClassName("active-tab");
    current[0].className = current[0].className.replace(" active-tab", "");
    this.className += " active-tab";
  });
}
</script>
    </form>
</body>
</html>
