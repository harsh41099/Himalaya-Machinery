<%@ Page Language="VB" AutoEventWireup="false" CodeFile="index.aspx.vb" Inherits="index" %>
<%@ Register TagName="Header" TagPrefix="Control" Src="site-control/header.ascx" %>
<%@ Register TagName="Footer" TagPrefix="Control" Src="site-control/footer.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/android-chrome-96x96.png" type="image/x-icon" />
<link rel="shortcut icon" href="images/android-chrome-96x96.png" type="image/x-icon" />
<title>HIMALAYA Machinery Pvt. Ltd.</title>

<!-- Bootstrap -->
<link href="css/animate.css" rel="stylesheet">
<link rel="stylesheet" href="owl/owl.carousel.min.css">
<link rel="stylesheet" href="owl/owl.theme.default.min.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
	
	
<!-- NEW MENU STARTS -->
<link href="css/jquery.smartmenus.bootstrap.css" rel="stylesheet">
<!-- NEW MENU ENDS -->
	
	
	
	
	
	
<link href="css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/app.css">
<link href="css/component.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link rel="stylesheet" href="css/prettyPhoto.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
<link href="https://fonts.googleapis.com/css?family=Muli:400,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:400,400i,700,700i,900,900i" rel="stylesheet">
<style type="text/css">
.carousel-inner {
	background: #171717;
}
.carousel-fade .carousel-inner .item {
	opacity: 0;
	-webkit-transition-property: opacity;
	-moz-transition-property: opacity;
	-o-transition-property: opacity;
	transition-property: opacity;
}
.carousel-fade .carousel-inner .active {
	opacity: 1;
}
.carousel-fade .carousel-inner .active.left, .carousel-fade .carousel-inner .active.right {
	left: 0;
	opacity: 0;
	z-index: 1;
}
.carousel-fade .carousel-inner .next.left, .carousel-fade .carousel-inner .prev.right {
	opacity: 3;
}
.carousel-fade .carousel-control {
	z-index: 2;
}
.filterDiv {
	background-color: transparent;
	color: #ffffff;
	width: 100%;
	text-align: center;
	margin: 0px;
	display: none;
}
.show {
	display: block;
}
/* Style the buttons */
.btn {
	border: none;
	outline: none;
	padding: 12px 16px;
	background-color: transparent;
	cursor: pointer;
	color: #8687b6;
}
.btn:hover {
	background-color: transparent;
	color: #3e4095;
}
.btn.active.focus, .btn.active:focus, .btn.focus, .btn:active.focus, .btn:active:focus, .btn:focus {
	outline: none;
	outline: none;
	outline-offset: -2px;
}
.btn.focus, .btn:focus, .btn:hover {
	color: #3e4095;
	text-decoration: none;
}
/*.btn.active-tab {background-color: #666; color: white;}*/
</style>
</head>
<body>
<form id="form1" runat="server">
  <Control:Header ID="Header1" runat="server" />
  <div class="svg-wrap" style="display:none;">
    <svg width="64" height="64" viewBox="0 0 64 64">
      <path id="arrow-left-2" d="M26.667 10.667q1.104 0 1.885 0.781t0.781 1.885q0 1.125-0.792 1.896l-14.104 14.104h41.563q1.104 0 1.885 0.781t0.781 1.885-0.781 1.885-1.885 0.781h-41.563l14.104 14.104q0.792 0.771 0.792 1.896 0 1.104-0.781 1.885t-1.885 0.781q-1.125 0-1.896-0.771l-18.667-18.667q-0.771-0.813-0.771-1.896t0.771-1.896l18.667-18.667q0.792-0.771 1.896-0.771z" />
    </svg>
    <svg width="64" height="64" viewBox="0 0 64 64">
      <path id="arrow-right-2" d="M37.333 10.667q1.125 0 1.896 0.771l18.667 18.667q0.771 0.771 0.771 1.896t-0.771 1.896l-18.667 18.667q-0.771 0.771-1.896 0.771-1.146 0-1.906-0.76t-0.76-1.906q0-1.125 0.771-1.896l14.125-14.104h-41.563q-1.104 0-1.885-0.781t-0.781-1.885 0.781-1.885 1.885-0.781h41.563l-14.125-14.104q-0.771-0.771-0.771-1.896 0-1.146 0.76-1.906t1.906-0.76z" />
    </svg>
  </div>
  <div class="main-slider">
    <div id="myCarousel" class="carousel slide home-slider carousel-fade" data-ride="carousel"> 
      <!-- Indicators --> 
      <!-- <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
        <li data-target="#myCarousel" data-slide-to="4"></li> 

      </ol>-->
      <div class="carousel-inner" role="listbox">
        <div class="item active"> <a href="#"><img class="first-slide" src="images/banner-1.jpg" alt="First slide"></a> 
         <!--<div class="container">
        <nav class="nav-circleslide"> 
			<a class="prev" href="#myCarousel" data-slide="prev">
				<span class="icon-wrap"><svg class="icon" width="32" height="32" viewBox="0 0 64 64"><use xlink:href="#arrow-left-2"></svg></span>
				<div><img src="img/9.png" alt="Previous thumb"/></div>
			</a>
			  
			<a class="next" href="#myCarousel" data-slide="next">
					<span class="icon-wrap"><svg class="icon" width="32" height="32" viewBox="0 0 64 64"><use xlink:href="#arrow-right-2"></svg></span>
					<div><img src="img/2.png" alt="Next thumb"/></div>
			</a>
		</nav>
      </div>-->
        </div>
        <div class="item"> <a href="#"><img class="second-slide" src="images/banner-2.jpg" alt="Second slide"></a></div>
        <div class="item"> <a href="#"><img class="third-slide" src="images/banner-3.jpg" alt="Third slide"></a></div>
        <div class="item"> <a href="#"><img class="four-slide" src="images/banner-4.jpg" alt="Third slide"></a></div>
        <div class="item"> <a href="#"><img class="five-slide" src="images/banner-5.jpg" alt="Third slide"></a></div>
      </div>
      <div class="container">
        <nav class="nav-circlepop"> <a class="prev" href="#myCarousel" data-slide="prev"> <span class="icon-wrap"></span> </a> <a class="next" href="#myCarousel" data-slide="next"> <span class="icon-wrap"></span> </a> </nav>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="himalya-top-bot-pd">
      <div class="title margin-bottom-70 bt-p"><!--HIMALAYA – 50 years of delivering metal forming & bending solutions--> 
        HIMALAYA – 40 + years of delivering Bending solutions </div>
      <div class="row">
        <div class="col-lg-3 col-md-6 col-sm-6 margin-bottom-30 ">
          <div class="border-left">
            <div class="him-title">2500+</div>
            <div class="him-txt margin-bottom-20">installations in India and abroad,</div>
            <div class="him-title">400+</div>
            <div class="him-txt ">repeat orders</div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6 margin-bottom-30 ">
          <div class="border-left">
            <div class="him-title">3+2 Years</div>
            <div class="him-txt ">warranty</div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6 margin-bottom-30 ">
          <div class="border-left">
            <div class="him-title">Excellent Customer Service Support</div>
            <div class="him-txt">(resident technicians in many cities of India)</div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6 margin-bottom-30 ">
          <div class="border-left">
            <div class="him-title">Highest resale value</div>
            <div class="him-txt ">of products</div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="grywithborder">
    <div class="container">
      <div class="row">
        <div class="col-lg-5 col-md-5 col-sm-12 margin-bottom-70 butt-center">
          <div class="right-pd">
            <div class="title margin-bottom-30 ">Standing Tall, <br class="hidden-xs hidden-sm">
              Yet Shooting Higher.</div>
            <div class="txt1 margin-bottom-30">
              <p>With experience comes expertise and with expertise comes the onus of
                fulfilling numerous expectations across the globe. At Himalaya, we’ve
                been standing true to each of your trust, for more than four decades
                now.</p>
              <p>A leading name in the industry, we at Himalaya are proud to have
                created cutting-edge metal forming machines. Additionally, we’ve also
                developed in-house capabilities to manufacture components of our
                machines, which simply translates into a comprehensive quality control
                over finished products, guaranteeing high-performance and reliability. </p>
            </div>
            <a class="gry" href="profile.aspx">More About Us</a> </div>
        </div>
        <div class="col-lg-7 col-md-7 col-sm-12 margin-bottom-30">
          <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6 margin-bottom-30 xs-center pd-right-box">
              <div class="ico1 margin-bottom-30"><img src="images/ico1.png" alt=""/></div>
              <div class="txt02 margin-bottom-20">Products</div>
              <div class="txt1">
                <p>Our top-of-the-line product range is designed for hassle-free usage and energy saving features; to ensure peace of mind and operational ease.</p>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 margin-bottom-30 xs-center pd-right-box">
              <div class="ico1 margin-bottom-30"><img src="images/ico2.png" alt=""/></div>
              <div class="txt02 margin-bottom-20">Achievements</div>
              <div class="txt1">
                <p>Our journey towards conquering higher peaks continues with each passing day, inspired by the need to be the best at all that we do, while keeping the faith of our investors and clients alive, always.</p>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 margin-bottom-30 xs-center pd-right-box">
              <div class="ico1 margin-bottom-30"><img src="images/ico3.png" alt=""/></div>
              <div class="txt02 margin-bottom-20">Manufacturing </div>
              <div class="txt1">
                <p>We have established our excellence across the various spheres of manufacturing. Our state-of-the-art manufacturing facility is well equipped.</p>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 margin-bottom-30 xs-center pd-right-box">
              <div class="ico1 margin-bottom-30"><img src="images/ico4.png" alt=""/></div>
              <div class="txt02 margin-bottom-20">Customer Service Support </div>
              <div class="txt1">
                <p>At Himalaya, a promise made to you, is one we make to ourselves.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--<div class="container">
    <div class="margin-100 bt-pp"></div>
    <div id="myBtnContainer" class="text-center margin-bottom-30">
      <button type="button" class="btn active-tab" onclick="filterSelection('all')">ALL</button>
      <button type="button" class="btn" onclick="filterSelection('colors')"> PLATE BENDING  MACHINES</button>
      <button type="button" class="btn" onclick="filterSelection('cars')"> PLATE LEVELLING MACHINES</button>
      <button type="button" class="btn" onclick="filterSelection('animals')"> SECTION BENDING MACHINES</button>
      <button type="button" class="btn" onclick="filterSelection('fruits')"> SPECIAL PURPOSE MACHINES </button>
    </div>
    <div class="row">
      <div class="filterDiv colors ">
        <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30"> <img src="images/img1.jpg" class="img-responsive image" alt="" />
          <div class="overlay">
            <div class="text">Plate Bending (rolling) Machines</div>
            <div class="box-txt">
              <p>a) Three roll plate bending machines: Ideal machine for largest variety of jobs whether production, workshop or job-shop</p>
              <p>b) Variable geometry plate bending machines: Ideal machine for heavy plate thickness</p>
              <p>c) Four roll plate bending machines Ideal machine for high productivity when plate thickness is not very high</p>
            </div>
            <div class="ico-postion"><a href="plate-bending-machines.aspx"><i class="fa fa-search white" aria-hidden="true"></i></a></div>
          </div>
        </div>
      </div>
		
      <div class="filterDiv cars">
        <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30"> <img src="images/img2.jpg" class="img-responsive image" alt="" />
          <div class="overlay">
            <div class="text">Plate Levelling Machines</div>
            <div class="box-txt">
              <p>levelling accuracy of 0.2 to 0.6 mm per square meter of plate Plate Straightening Machines: straightening accuracy of 1 mm per
                square meter</p>
            </div>
            <div class="ico-postion"><a href="plate-levelling-machines.aspx"><i class="fa fa-search white" aria-hidden="true"></i></a></div>
          </div>
        </div>
      </div>
		
      <div class="filterDiv animals">
        <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30 b-m"> <img src="images/img3.jpg" class="img-responsive image" alt="" />
          <div class="overlay">
            <div class="text">Section Bending Machines</div>
            <div class="box-txt">
              <p>Cooming Soon</p>
            </div>
            <div class="ico-postion"><a href="section-bending-machines.aspx"><i class="fa fa-search white" aria-hidden="true"></i></a></div>
          </div>
        </div>
      </div>
		
      <div class="filterDiv fruits">
        <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30"> <img src="images/img4.jpg" class="img-responsive image" alt="" />
          <div class="overlay">
            <div class="text">Special Purpose Machines</div>
            <div class="box-txt">
              <p>a) Panel Bending Machines</p>
              <p>b) Shipyard and other Presses</p>
            </div>
            <div class="ico-postion"><a href="special-purpose-machines.aspx"><i class="fa fa-search white" aria-hidden="true"></i></a></div>
          </div>
        </div>
      </div>
		
      <div class="filterDiv fruits">
        <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30"> <img src="images/img4.jpg" class="img-responsive image" alt="" />
          <div class="overlay">
            <div class="text">Special Purpose Machines</div>
            <div class="box-txt">
              <p>a) Panel Bending Machines</p>
              <p>b) Shipyard and other Presses</p>
            </div>
            <div class="ico-postion"><a href="special-purpose-machines.aspx"><i class="fa fa-search white" aria-hidden="true"></i></a></div>
          </div>
        </div>
      </div>
		
		
		
		
		
		
		
		
		
      <div class="filterDiv">
        <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30">
          <div class="txt-bg">
            <div class="text">Producing To Perfection.</div>
            <div class="box-txt1">
              <p>At Himalaya, our fervor for engineering has led us to constantly push
                our horizons furtehr. As a result, we’ve developed an extensive know-
                how across myrid engineering verticals be it mechanical, hydraulic,
                electrical or electronic.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="margin-100 bt-pp"></div>
  </div>-->
	
	
	<div class="container">
    <div class="margin-100 bt-pp"></div>
    <div id="myBtnContainer" class="text-center margin-bottom-30">
      <button type="button" class="btn active-tab" onclick="filterSelection('all')">ALL</button>
      <button type="button" class="btn" onclick="filterSelection('three-roll')">Three Roll Plate Bending Machines</button>
      <button type="button" class="btn" onclick="filterSelection('Four-roll')">Four Roll Plate Bending Machines</button>
      <button type="button" class="btn" onclick="filterSelection('vgpbm')">Variable Geometry Plate Bending Machines</button>
      <button type="button" class="btn" onclick="filterSelection('psm')">Plate Straightening Machines</button>
		<button type="button" class="btn" onclick="filterSelection('plm')">Plate Levelling Machines</button>
    </div>
    <div class="row">
      <div class="filterDiv three-roll ">
        <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30"> <img src="images/img1.jpg" class="img-responsive image" alt="" />
          <div class="overlay">
            <div class="text">Three Roll Plate Bending Machines</div>
            <div class="box-txt">
              <p>a) Three Roll Plate Bending Machines: Ideal machine for largest variety of jobs whether production, workshop or job-shop</p>
              <p>b) Variable geometry Plate Bending Machines: Ideal machine for heavy plate thickness</p>
              <p>c) Four roll Plate Bending Machines Ideal machine for high productivity when plate thickness is not very high</p>
            </div>
            <div class="ico-postion"><a href="three-roll-plate-bending-machines.aspx"><i class="fa fa-search white" aria-hidden="true"></i></a></div>
          </div>
        </div>
      </div>
		
	  <div class="filterDiv Four-roll">
        <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30"> <img src="images/img2.jpg" class="img-responsive image" alt="" />
          <div class="overlay">
            <div class="text">Four Roll Plate Bending Machines</div>
            <div class="box-txt">
              <p>a) Panel Bending Machines</p>
              <p>b) Shipyard and other Presses</p>
            </div>
            <div class="ico-postion"><a href="four-roll-plate-bending-machines.aspx"><i class="fa fa-search white" aria-hidden="true"></i></a></div>
          </div>
        </div>
      </div>	
		
	  <div class="filterDiv vgpbm">
        <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30"> <img src="images/img3.jpg" class="img-responsive image" alt="" />
          <div class="overlay">
            <div class="text">Variable Geometry Panel Bending Machines</div>
            <div class="box-txt">
              <p>a) Panel Bending Machines</p>
              <p>b) Shipyard and other Presses</p>
            </div>
            <div class="ico-postion"><a href="variable-geometry-plate-bending-machines.aspx"><i class="fa fa-search white" aria-hidden="true"></i></a></div>
          </div>
        </div>
      </div>	
		
      <div class="filterDiv psm">
        <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30"> <img src="images/img4.jpg" class="img-responsive image" alt="" />
          <div class="overlay">
            <div class="text">Plate Straightening Machines</div>
            <div class="box-txt">
              <p>levelling accuracy of 0.2 to 0.6 mm per square meter of plate Plate Straightening Machines: straightening accuracy of 1 mm per
                square meter</p>
            </div>
            <div class="ico-postion"><a href="plate-straightening-machines.aspx"><i class="fa fa-search white" aria-hidden="true"></i></a></div>
          </div>
        </div>
      </div>
		
      <div class="filterDiv plm">
        <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30 b-m"> <img src="images/img5.jpg" class="img-responsive image" alt="" />
          <div class="overlay">
            <div class="text">Plate Levelling Machines</div>
            <div class="box-txt">
              <p>Cooming Soon</p>
            </div>
            <div class="ico-postion"><a href="plate-levelling-machines.aspx"><i class="fa fa-search white" aria-hidden="true"></i></a></div>
          </div>
        </div>
      </div>
		
		<!--<div class="filterDiv animals">
        <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30 b-m"> <img src="images/img6.jpg" class="img-responsive image" alt="" />
          <div class="overlay">
            <div class="text">Section Bending Machines</div>
            <div class="box-txt">
              <p>Cooming Soon</p>
            </div>
            <div class="ico-postion"><a href="section-bending-machines.aspx"><i class="fa fa-search white" aria-hidden="true"></i></a></div>
          </div>
        </div>
      </div>-->
		
      <div class="filterDiv">
        <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30">
          <div class="txt-bg">
            <div class="text">Producing To Perfection.</div>
            <div class="box-txt1">
              <p>At Himalaya, our fervor for engineering has led us to constantly push
                our horizons furtehr. As a result, we’ve developed an extensive know-
                how across myrid engineering verticals be it mechanical, hydraulic,
                electrical or electronic.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    Application for the post of web designer
    <!--<div class="filterDiv cars">BMW</div>
  <div class="filterDiv colors fruits">Orange</div>
  <div class="filterDiv cars">Volvo</div>
  <div class="filterDiv colors">Red</div>
  <div class="filterDiv cars animals">Mustang</div>
  <div class="filterDiv colors">Blue</div>
  <div class="filterDiv animals">Cat</div>
  <div class="filterDiv animals">Dog</div>
  <div class="filterDiv fruits">Melon</div>
  <div class="filterDiv fruits animals">Kiwi</div>
  <div class="filterDiv fruits">Banana</div>
  <div class="filterDiv fruits">Lemon</div>
  <div class="filterDiv animals">Cow</div>-->
    <div class="margin-100 bt-pp"></div>
  </div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
  <div class="grywithborder">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 butt-center">
          <div class="text-center">
            <div class="title margin-bottom-30">Applications</div>
            <!--<div class="txt2 margin-bottom-30">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus, doloribus, accusamus. Commodi voluptas, aliquam corporis dolorem amet? Asperiores ullam consequatur dolores. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus, doloribus, accusamus. Commodi voluptas, aliquam corporis dolorem amet? Asperiores ullam consequatur dolores.</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus, doloribus, accusamus. Commodi voluptas, aliquam corporis dolorem amet? Asperiores ullam consequatur dolores.</p>
          </div>
          <a class="gry" href="#">More Details</a>--> 
            
          </div>
        </div>
        <div class="col-lg-12 my-owl">
          <div id="owl-carousel-text" class="owl-carousel owl-theme">
            <div class="item"> <a href="wind-turbine.aspx">
              <div class="margin-bottom-20 bottom">
                <div class="column-hover margin-bottom-30"><img src="images/app-oil.jpg" class="img-responsive image" alt=""/></div>
                <div class="img-txt text-center">Oil tanks</div>
              </div>
              </a> </div>
            <div class="item"> <a href="wind-turbine.aspx">
              <div class="margin-bottom-20 bottom">
                <div class="column-hover margin-bottom-30"><img src="images/app-rocket.jpg" class="img-responsive image" alt=""/></div>
                <div class="img-txt text-center">Rocket Shell</div>
              </div>
              </a> </div>
            <div class="item"> <a href="wind-turbine.aspx">
              <div class="margin-bottom-20 bottom">
                <div class="column-hover margin-bottom-30"><img src="images/app-wind.jpg" class="img-responsive image" alt=""/></div>
                <div class="img-txt text-center">wind turbine</div>
              </div>
              </a> </div>
            <div class="item"> <a href="wind-turbine.aspx">
              <div class="margin-bottom-20 bottom">
                <div class="column-hover margin-bottom-30"><img src="images/app-ship.jpg" class="img-responsive image" alt=""/></div>
                <div class="img-txt text-center">Ship hull</div>
              </div>
              </a> </div>
            <div class="item"> <a href="wind-turbine.aspx">
              <div class="margin-bottom-20 bottom">
                <div class="column-hover margin-bottom-30"><img src="images/metal-fabrication.png" class="img-responsive image" alt=""/></div>
                <div class="img-txt text-center">Metal Fabrication</div>
              </div>
              </a> </div>
            <div class="item"><a href="wind-turbine.aspx">
              <div class="margin-bottom-20 bottom">
                <div class="column-hover margin-bottom-30"><img src="images/pressure-vessels-heat-exchangers.png" class="img-responsive image" alt=""/></div>
                <div class="img-txt text-center">Pressure Vessels and Heat Exchangers</div>
              </div>
              </a> </div>
            <div class="item"> <a href="wind-turbine.aspx">
              <div class=" margin-bottom-20 bottom">
                <div class="column-hover margin-bottom-30"><img src="images/road-railway-tankers.png" class="img-responsive image" alt=""/></div>
                <div class="img-txt text-center">Road/Railway Tankers</div>
              </div>
              </a> </div>
            <div class="item"> <a href="wind-turbine.aspx">
              <div class=" margin-bottom-20 bottom">
                <div class="column-hover margin-bottom-30"><img src="images/earth-moving.png" class="img-responsive image" alt=""/></div>
                <div class="img-txt text-center">Earth Moving</div>
              </div>
              </a> </div>
            <div class="item"> <a href="wind-turbine.aspx">
              <div class=" margin-bottom-20 bottom">
                <div class="column-hover margin-bottom-30"><img src="images/silos.png" class="img-responsive image" alt=""/></div>
                <div class="img-txt text-center">Silos </div>
              </div>
              </a> </div>
            <div class="item"> <a href="wind-turbine.aspx">
              <div class=" margin-bottom-20 bottom">
                <div class="column-hover margin-bottom-30"><img src="images/tubes-pipes.png" class="img-responsive image" alt=""/></div>
                <div class="img-txt text-center">TUBES & PIPES </div>
              </div>
              </a> </div>
            <div class="item"> <a href="wind-turbine.aspx">
              <div class=" margin-bottom-20 bottom">
                <div class="column-hover margin-bottom-30"><img src="images/heating-ventilation.png" class="img-responsive image" alt=""/></div>
                <div class="img-txt text-center">HEATING AND VENTILATION </div>
              </div>
              </a></div>
            <div class="item"> <a href="wind-turbine.aspx">
              <div class=" margin-bottom-20 bottom">
                <div class="column-hover margin-bottom-30"><img src="images/dished-heads.png" class="img-responsive image" alt=""/></div>
                <div class="img-txt text-center">DISHED HEADS</div>
              </div>
              </a> </div>
            <div class="item"> <a href="wind-turbine.aspx">
              <div class=" margin-bottom-20 bottom">
                <div class="column-hover margin-bottom-30"><img src="images/metal-structures.png" class="img-responsive image" alt=""/></div>
                <div class="img-txt text-center">Metal Structures</div>
              </div>
              </a> </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="journey-bg">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 col-md-4 col-sm-12 margin-bottom-30">
          <div class="text-center">
            <div class="title-white margin-bottom-20">A Journey Replete With Milestones</div>
            <div class="txt-white1  margin-bottom-30">
              <p>Our journey towards conquering higher peaks continues with each passing day, inspired by the need to be the best at all that we do, while keeping the faith of our investors and clients alive, always.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-12 col-md-8 col-sm-12 margin-bottom-30">
          <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30">
              <div class="white-box">
                <div class="white-box-title">1978</div>
                <div class="white-box-txt">
                  <p>The top most name in heavy engineering, we, Himalaya Machinery began our journey in 1978. This was also when we manufactured the 1st Plate Bending Machine and exported it to Dubai.</p>
                  
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30">
              <div class="white-box">
                <div class="white-box-title">1984</div>
                <div class="white-box-txt">
                  <p>90 mm X 2500 mm width of plate bending machine supplied</p>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30">
              <div class="white-box">
                <div class="white-box-title">1989</div>
                <div class="white-box-txt">Gradually installed the 40 mm X 3000 mm width of plate levelling machine in 1989.</div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30">
              <div class="white-box">
                <div class="white-box-title">1993</div>
                <div class="white-box-txt">We supplied the 1st 40 mm X 2550 mm width of Plate Straightening Machine in 1993</div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30">
              <div class="white-box">
                <div class="white-box-title">1995</div>
                <div class="white-box-txt">Moving forth from strength-to-strength, we then launched the Totally Indigenous Wind Turbines in 1995. </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30">
              <div class="white-box">
                <div class="white-box-title">2005</div>
                <div class="white-box-txt">500 Tons of Panel Bending Machine in operation</div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30">
              <div class="white-box">
                <div class="white-box-title">2008</div>
                <div class="white-box-txt">
                  <p>Installed the 160 mm x 3000 mm width of Plate Bending Machine in 2008.</p>
                  <p>1600 Tons X 7000 mm width of Shipyard Press installed and many other ship yard presses installed</p>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30">
              <div class="white-box">
                <div class="white-box-title">2016</div>
                <div class="white-box-txt">
                  <p>Variable Geometry Plate Bending Machine of 160 mm X 3000 mm installed</p>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30">
              <div class="white-box">
                <div class="white-box-title">2017</div>
                <div class="white-box-txt">
                  <p>Exported 50 mm four roll and 70 mm three roll plate bending machines to Kenya</p>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 margin-bottom-30">
              <div class="white-box">
                <div class="white-box-title">2018</div>
                <div class="white-box-txt">
                  <p>Entered into working arrangement with MG srl, Italy</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!--TESTIMONIALS-->
  
  <div class="grywithborder">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 butt-center">
          <div class="text-center">
            <div class="title margin-bottom-30">Testimonials</div>
            <!--<div class="txt2 margin-bottom-30">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus, doloribus, accusamus. Commodi voluptas, aliquam corporis dolorem amet? Asperiores ullam consequatur dolores. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus, doloribus, accusamus. Commodi voluptas, aliquam corporis dolorem amet? Asperiores ullam consequatur dolores.</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus, doloribus, accusamus. Commodi voluptas, aliquam corporis dolorem amet? Asperiores ullam consequatur dolores.</p>
          </div>
          <a class="gry" href="#">More Details</a>--> 
            
          </div>
        </div>
        <div class="col-lg-12 my-owl">
          <div id="owl-carousel-textt" class="owl-carousel owl-theme">
				<div class="item"> 
					<div class="col-md-12 col-sm-12 ">
						<div class="home-testimonial-txt">
							<div class="home-top-quotes"><img src="images/top-quotes.png" alt=""/></div>
							We at THERMAX have been using HIMALAYA products, since last 30+ years, we have many
							HIMALAYA machines at various plants. HIMALAYA products perform better than promised at
							minimum downtime and HIMALAYA products are user friendly, robust and easy to maintain.
							Customer Service Support has been excellent from HIMALAYA since the beginning.
						</div>
						<div class="home-testimonial-name">
							<h2>Mr. Nitin Vasant Belsare</h2>
							<h3>Senior Manager, HOD (Transformation Mgt & Capacity Planning)
								<div class="home-bottom-quotes"><img src="images/bottom-quotes.png" alt=""/></div>
							</h3>
						</div>
					</div>			
				</div>
			  
			  
				<div class="item"> 
					<div class="col-md-12 col-sm-12 ">
						<div class="home-testimonial-txt">
							<div class="home-top-quotes"><img src="images/top-quotes.png" alt=""/></div>
							They are currency printers (HIMALAYA Plate Bending Machines), if you are in the business of
making windmill towers in India you got to have them. (Toolfab Engineering produces more than
500 windmill towers in a year)
						</div>
						<div class="home-testimonial-name">
							<h2>Mr. C. Madan Mohan, B.E.</h2>
							<h3>Managing Director, Toolfab Engineering, Trichy
								<div class="home-bottom-quotes"><img src="images/bottom-quotes.png" alt=""/></div>
							</h3>
						</div>
					</div>			
				</div>
			  
			  
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- END TESTIMONIALS-->
  
	
	
	
	
	
	
	
	
	
	
	
	
	
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
	
	
	
	
    <script type="text/javascript" src="js/jquery.smartmenus.js"></script>
    <script type="text/javascript" src="js/jquery.smartmenus.bootstrap.js"></script>

	
	
	
	
	
	
	
	
  <script src="js/common.js"></script> 
  <script src="js/wow.js"></script> 
  <script src="owl/owl.carousel.js"></script> 
  <script type="text/javascript">
$(document).ready(function () {
    $('.carousel').carousel({
        interval: 7000
    });

    
});
</script> 
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
            $(document).ready(function() {
              $('#owl-carousel-textt').owlCarousel({
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
                    items: 1,
                    nav: false,
				    dots:true
                  },
                  1000: {
                    items: 1,
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
