<%@ Page Language="VB" AutoEventWireup="false" CodeFile="current-openings.aspx.vb" Inherits="current_openings_dynamic_aspx" %>
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
<link href="css/jquery.fancybox.css" property="stylesheet" rel="stylesheet" type="text/css" media="screen" />
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

<!--<link href='https://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!--<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>-->

<link href="css/new-accordion.css" rel="stylesheet">
</head>
<body>
<form id="form1" runat="server">
  <Control:Header ID="Header1" runat="server" />
  <div class="main-inner">
    <div class="container">
      <div class="iner-banner-title">Career</div>
      <div class="inside-page-link"><a href="index.aspx">Home</a><span class="span-space">&raquo;</span>Current Openings</div>
    </div>
  </div>
  <div class="container">
    <div class="himalya-top-bot-pd">
      <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 right-pd-iner">
          <div class="margin-bottom-20">
            <p>Want to be a part of a team that is committed to setting the technical and business standards, come join us.We have openings for the following positions:</p>
          </div>
          <div class="tab-color-changes">
            <div class="panel-group wrap" id="bs-collapse">
                <asp:Repeater ID="rpPosition" runat="server">
                    <ItemTemplate>
                        <div class="panel">
                            <div class="panel-heading">
                              <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#" href='#job<%# DataBinder.Eval(Container.DataItem,"Job_ID")%>'><%#FormatText(DataBinder.Eval(Container.DataItem,"Pos_Name"))%></a> </h4>
                            </div>
                            <div id='job<%# DataBinder.Eval(Container.DataItem,"Job_ID")%>' class="panel-collapse collapse in">
                              <div class="panel-body">
                                <div class="">
                                  <table cellspacing="0" cellpadding="0" border="0" class="table">
                                    <tbody>
                                        
                                      <tr>
                                        <td width="20%">Location</td>
                                        <td width="80%"><%#FormatText(DataBinder.Eval(Container.DataItem,"Loc_Name"))%></td>
                                      </tr>
                                      <tr>
                                        <td>No. of Vacancie(s)</td>
                                        <td><%#FormatText(DataBinder.Eval(Container.DataItem,"Job_TotalVacancy"))%></td>
                                      </tr>
                                      <%#FormatCareerData("Required Skills", DataBinder.Eval(Container.DataItem, "Job_ReqSkills"))%>
                                      <tr>
                                        <td>Experience</td>
                                        <td><%#FormatText(DataBinder.Eval(Container.DataItem,"Job_ReqExp"))%></td>
                                      </tr>
                                        <%#FormatCareerData("Job Profile", DataBinder.Eval(Container.DataItem, "Job_Description"))%>
                                          <%#FormatCareerData("Joining Period", DataBinder.Eval(Container.DataItem, "Job_JoiningPeriod"))%>
                                          <%#FormatCareerData("Salary Slab", DataBinder.Eval(Container.DataItem, "Job_SalarySlab"))%>
                                          <%#FormatCareerData("Date", DataBinder.Eval(Container.DataItem, "Job_Date"))%>
                                    </tbody>
                                  </table>
                                </div>
                                <div class=""><a id="Submit" class="btn gry2 ico" href="apply-online.aspx?id=<%# DataBinder.Eval(Container.DataItem, "Job_ID")%>">Apply Online <span><i class="fa fa-envelope-o"></i></span></a></div>
                              </div>
                            </div>
                          </div>
                    </ItemTemplate>
                    
                </asp:Repeater>
                <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
              
            </div>
          </div>
        </div>
        <div class="clearfix"></div>
      
      
        
      
        
      </div>
      
   
    </div>
  </div>
  <Control:Footer ID="Footer1" runat="server" />
  <!--<div class="foter"></div>--> 
  <!-- /.carousel --><!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
  <script src="js/jquery.min.js"></script> 
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script> 
  <script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script> 
  <script src="js/index.js"></script> 
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
