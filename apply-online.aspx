<%@ Page Language="VB" AutoEventWireup="false" CodeFile="apply-online.aspx.vb" Inherits="apply_online" %>

<%@ Register TagName="Header" TagPrefix="Control" Src="site-control/header.ascx" %>
<%@ Register TagName="Footer" TagPrefix="Control" Src="site-control/footer.ascx" %>
<%@ Register Assembly="obout_Calendar2_Net" Namespace="OboutInc.Calendar2" TagPrefix="obout" %>

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
      <div class="inside-page-link"><a href="index.aspx">Home</a><span class="span-space">&raquo;</span>Apply Online</div>
    </div>
  </div>
  <div class="container">
    <div class="himalya-top-bot-pd">
      <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 right-pd-iner">
          
          
    <div class="about-text margin-bottom-50 ">
        <div class="col-sm-12 col-xs-12 black-txt1">
        	  <p class="in-title margin-bottom-20"> </p>
            <p class=" margin-bottom-10"><span ><b>Post applied for : <%=Position%></b></span></p>
            <p class="blue-title margin-bottom-20">Personal Details</p>
        	<label>Full Name *</label>
            <div class="row">
                <div class="col-sm-4 col-xs-12">
                <div class="form-group">
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="First Name *"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" CssClass="errormsg" Display="Dynamic" ErrorMessage="Required" setfocusonerror="True"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <div class="form-group">
                        <asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control" placeholder="Middle Name"></asp:TextBox>
                    </div>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <div class="form-group">
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-sm-6 col-xs-12">
                <div class="form-group">
                    <label>Address *</label>
                        <asp:TextBox ID="txtPresentAddress" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Address *" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPresentAddress" CssClass="errormsg" Display="Dynamic" ErrorMessage="Required" setfocusonerror="True"></asp:RequiredFieldValidator>
                </div>
                   <div class="form-group">
                    <label>City *</label>
                        <asp:TextBox ID="txtPresentCity" runat="server" CssClass="form-control" placeholder="City *"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPresentCity" CssClass="errormsg" Display="Dynamic" ErrorMessage="Required" setfocusonerror="True"></asp:RequiredFieldValidator>
                </div>
                 <div class="form-group">
                    <label>Phone</label>
                        <asp:TextBox ID="txtPresentPhone" runat="server" CssClass="form-control" placeholder="Phone"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPresentPhone" CssClass="errormsg" Display="Dynamic" ErrorMessage="Required" setfocusonerror="True" Enabled="false"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ID="revTBIssueDescription" ControlToValidate="txtPresentPhone" ValidationExpression="^[\s\S]{10,20}$" ErrorMessage="Please Enter Valid Phone Number" CssClass="errormsg" Display="Dynamic" />                          
						
                </div>
                <div class="form-group">
                    <label>Mobile *</label>
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Mobile *"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtMobile" CssClass="errormsg" Display="Dynamic" ErrorMessage="Required" setfocusonerror="True" Enabled="true"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ControlToValidate="txtMobile" ValidationExpression="^[\s\S]{10,20}$" ErrorMessage="Please Enter Valid Mobile Number" CssClass="errormsg" Display="Dynamic" />
                </div>
                <div class="form-group">
                    <label>Email *</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email *"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtEmail" CssClass="errormsg" Display="Dynamic" ErrorMessage="Required" setfocusonerror="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" CssClass="errormsg" Display="Dynamic" ErrorMessage="Invalid Email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" setfocusonerror="True"></asp:RegularExpressionValidator>
                </div>
            </div>
        
            <div class="col-sm-6 col-xs-12">
                 <div class="form-group">
                    <label>Date of Birth *</label>
                        <div class="form-inline">
                            <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" placeholder="Date of Birth *" Width="90%"></asp:TextBox>
                            <obout:calendar ID="CalDOB" runat="server" Columns="1" TextBoxId="txtDOB" DatePickerImagePath="images/calendr_icon.jpg" DatePickerMode="true" DatePickerSynchronize="true" DateFormat="MM/dd/yyyy" YearSelectorType="DropDownList" MonthSelectorType="DropDownList" ShowMonthSelector="true" ShowYearSelector="true" DateMin="1/1/1940"></obout:calendar>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtDOB" CssClass="errormsg" Display="Dynamic" ErrorMessage="Required" setfocusonerror="True"></asp:RequiredFieldValidator>
                            <asp:Button ID="btnTest" runat="server" CausesValidation="false" Text="Test" Visible="false" />
                            <asp:Label ID="lblTest" runat="server" Visible="false"></asp:Label>
                        </div>
                </div>
                <div class="form-group">
                   <label>Gender *</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="ddlGender" CssClass="errormsg" Display="Dynamic" ErrorMessage="Required" setfocusonerror="True"></asp:RequiredFieldValidator>
                </div>
                 <div class="form-group">
                   <label>Marital Status *</label>
                         <asp:DropDownList ID="ddlMStatus" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Single">Single</asp:ListItem>
                            <asp:ListItem Value="Married">Married</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="ddlMStatus" CssClass="errormsg" Display="Dynamic" ErrorMessage="Required" setfocusonerror="True"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Preferred Job Location *</label>
                        <asp:TextBox ID="txtJobLocation" runat="server" CssClass="form-control" placeholder="Job Location"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtJobLocation" CssClass="errormsg" Display="Dynamic" ErrorMessage="Required" setfocusonerror="True"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                
                
                   <label>Total Years Of Experience *</label>
                   
                   <div class="form-inline">
                   
                    <asp:DropDownList ID="ddlTotalYearExperience" runat="server" CssClass="form-control" >
                        <asp:ListItem Value="">Year</asp:ListItem>
                        <asp:ListItem Value="0">0</asp:ListItem>
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="9">9</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="11">11</asp:ListItem>
                        <asp:ListItem Value="12">12</asp:ListItem>
                        <asp:ListItem Value="13">13</asp:ListItem>
                        <asp:ListItem Value="14">14</asp:ListItem>
                        <asp:ListItem Value="15">15</asp:ListItem>
                        <asp:ListItem Value="16">16</asp:ListItem>
                        <asp:ListItem Value="17">17</asp:ListItem>
                        <asp:ListItem Value="18">18</asp:ListItem>
                        <asp:ListItem Value="19">19</asp:ListItem>
                        <asp:ListItem Value="20">20</asp:ListItem>
                        <asp:ListItem Value="21">21</asp:ListItem>
                        <asp:ListItem Value="22">22</asp:ListItem>
                        <asp:ListItem Value="23">23</asp:ListItem>
                        <asp:ListItem Value="24">24</asp:ListItem>
                        <asp:ListItem Value="25">25</asp:ListItem>
                        <asp:ListItem Value="26">26</asp:ListItem>
                        <asp:ListItem Value="27">27</asp:ListItem>
                        <asp:ListItem Value="28">28</asp:ListItem>
                        <asp:ListItem Value="29">29</asp:ListItem>
                        <asp:ListItem Value="30">30</asp:ListItem>
                        <asp:ListItem Value="31">31</asp:ListItem>
                        <asp:ListItem Value="32">32</asp:ListItem>
                        <asp:ListItem Value="33">33</asp:ListItem>
                        <asp:ListItem Value="34">34</asp:ListItem>
                        <asp:ListItem Value="35">35</asp:ListItem>
                        <asp:ListItem Value="36">36</asp:ListItem>
                        <asp:ListItem Value="37">37</asp:ListItem>
                        <asp:ListItem Value="38">38</asp:ListItem>
                        <asp:ListItem Value="39">39</asp:ListItem>
                        <asp:ListItem Value="40">40</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlTotalMonthsExperience" runat="server" CssClass="form-control" >
                        <asp:ListItem Value="">Month</asp:ListItem>
                        <asp:ListItem Value="0">0</asp:ListItem>
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="9">9</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="11">11</asp:ListItem>
                    </asp:DropDownList></div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlTotalYearExperience" CssClass="errormsg" Display="Dynamic" ErrorMessage="Required" setfocusonerror="True"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="ddlTotalMonthsExperience" CssClass="errormsg" Display="Dynamic" ErrorMessage="Required" setfocusonerror="True"></asp:RequiredFieldValidator>
                    
                </div>
            </div>
        
            </div>
        </div>

        <div class="col-sm-12 col-xs-12 margine-30px">
            <div class="form-group black-txt1">
                <label>Special Details</label>
                <asp:TextBox ID="txtDetails" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Special Details"></asp:TextBox>

    		</div>
            <br>
            <br>
            <p class="blue-title margin-bottom-20">Educational Qualification<label id="lblErrEducational"></label></p>
            <div class="table-responsive">
            <table class="table table-striped">
    <tbody>
      <tr>
        <td width="11%" align="left"><strong> Degree /<br />
Diploma</strong></td>
        <td width="11%" align="left"><strong>Institute</strong></td>
        <td width="11%" align="left"><strong>Board /<br />
        University</strong></td>
        <td width="11%" align="left"><strong>Year</strong></td>
        <td width="11%" align="left"><strong> Main Subject </strong></td>
        <td width="11%" align="left"><strong>Grade  %</strong></td>
      </tr>
      <tr>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtDegree1" placeholder="Degree 1 *" runat="server" CssClass="form-control"  MaxLength="50"  ></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtDegree1" CssClass="errormsg" Display="Dynamic" ErrorMessage="*" setfocusonerror="True"></asp:RequiredFieldValidator>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtInstitute1" placeholder="Institute 1 *"  runat="server" CssClass="form-control"  MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtInstitute1" CssClass="errormsg" Display="Dynamic" ErrorMessage="*" setfocusonerror="True"></asp:RequiredFieldValidator>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtUni1" placeholder="Board / Uni. 1 *" runat="server"  CssClass="form-control"  MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtUni1" CssClass="errormsg" Display="Dynamic" ErrorMessage="*" setfocusonerror="True"></asp:RequiredFieldValidator>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox  ID="txtYear1" placeholder="Year 1 *" runat="server" CssClass="form-control"  MaxLength="4"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtYear1" CssClass="errormsg" Display="Dynamic" ErrorMessage="*" setfocusonerror="True"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtYear1" ErrorMessage="Only Numbers Allowed" ValidationExpression="^\d*\.{0,1}\d+$" Display="Dynamic" SetFocusOnError="True" CssClass="errormsg"></asp:RegularExpressionValidator>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox  ID="txtSubject1" placeholder="Main Sub. 1 *" runat="server" CssClass="form-control"  MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="txtSubject1" CssClass="errormsg" Display="Dynamic" ErrorMessage="*" setfocusonerror="True"></asp:RequiredFieldValidator>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtGrade1" placeholder="Grade 1 *" runat="server"  CssClass="form-control"  MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtGrade1" CssClass="errormsg" Display="Dynamic" ErrorMessage="*" setfocusonerror="True"></asp:RequiredFieldValidator>
        </span></td>
      </tr>
      <tr>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtDegree2" placeholder="Degree 2" runat="server" CssClass="form-control"  MaxLength="50"  ></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtInstitute2" placeholder="Institute 2" runat="server" CssClass="form-control"  MaxLength="50"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtUni2" placeholder="Board / Uni. 2" runat="server"  CssClass="form-control"  MaxLength="50"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox  ID="txtYear2" placeholder="Year 2" runat="server" CssClass="form-control"  MaxLength="4"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtYear2" ErrorMessage="Only Numbers Allowed" ValidationExpression="^\d*\.{0,1}\d+$" Display="Dynamic" SetFocusOnError="True" CssClass="errormsg"></asp:RegularExpressionValidator>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox  ID="txtSubject2" placeholder="Main Sub. 2" runat="server" CssClass="form-control"  MaxLength="50"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtGrade2" placeholder="Grade 2" runat="server"  CssClass="form-control"  MaxLength="50"></asp:TextBox>
        </span></td>
      </tr>
      <tr>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtDegree3" placeholder="Degree 3" runat="server" CssClass="form-control"  MaxLength="50"  ></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtInstitute3" placeholder="Institute 3" runat="server" CssClass="form-control"  MaxLength="50"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtUni3" placeholder="Board / Uni. 3" runat="server"  CssClass="form-control"  MaxLength="50"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox  ID="txtYear3" placeholder="Year 3" runat="server" CssClass="form-control"  MaxLength="4"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtYear3" ErrorMessage="Only Numbers Allowed" ValidationExpression="^\d*\.{0,1}\d+$" Display="Dynamic" SetFocusOnError="True" CssClass="errormsg"></asp:RegularExpressionValidator>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox  ID="txtSubject3" placeholder="Main Sub. 3" runat="server" CssClass="form-control"  MaxLength="50"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtGrade3" placeholder="Grade 3" runat="server"  CssClass="form-control"  MaxLength="50"></asp:TextBox>
        </span></td>
      </tr>
      <tr>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtDegree4" placeholder="Degree 4" runat="server" CssClass="form-control"  MaxLength="50"  ></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtInstitute4" placeholder="Institute 4"  runat="server" CssClass="form-control"  MaxLength="50"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtUni4" placeholder="Board / Uni. 4" runat="server"  CssClass="form-control"  MaxLength="50"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox  ID="txtYear4" placeholder="Year 4" runat="server" CssClass="form-control"  MaxLength="4"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtYear4" ErrorMessage="Only Numbers Allowed" ValidationExpression="^\d*\.{0,1}\d+$" Display="Dynamic" SetFocusOnError="True" CssClass="errormsg"></asp:RegularExpressionValidator>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox  ID="txtSubject4" placeholder="Main Sub. 4" runat="server" CssClass="form-control"  MaxLength="50"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtGrade4" placeholder="Grade 4" runat="server"  CssClass="form-control"  MaxLength="50"></asp:TextBox>
        </span></td>
      </tr>
    </tbody>
  </table>
        </div>    
          <br>
            <p class="blue-title margin-bottom-20">Current Employer / Last Employer</p>
            <div class="table-responsive">
            <table class="table table-striped">
    <tbody>
      <tr>
        <td width="11%" align="left"><strong>Company Name</strong></td>
        <td width="11%" align="left"><strong>Address</strong></td>
        <td width="11%" align="left"><strong>Nature Of Business</strong></td>
        <td width="11%" align="left"><strong>Designaiton</strong></td>
        <td width="11%" align="left"><strong> Job Description </strong></td>
        <td width="11%" align="left"><strong>Start Date</strong></td>
        <td width="11%" align="left"><strong>End Date</strong></td>
      </tr>
      <tr>
        <td align="left"><span class="form-group">
            <asp:TextBox ID="txtEmployerCompanyName1" placeholder="Company 1" runat="server" CssClass="form-control txt_area_employer_company">
            </asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmployerCompanyName1" CssClass="errormsg" Display="Dynamic" ErrorMessage="*" setfocusonerror="True" Enabled="false"></asp:RequiredFieldValidator>
        </span></td>
        <td align="left"><span class="form-group">
            <asp:TextBox ID="txtEmployerAddress1" placeholder="Address 1" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmployerAddress1" CssClass="errormsg" Display="Dynamic" ErrorMessage="*" setfocusonerror="True" Enabled="false"></asp:RequiredFieldValidator>
        </span></td>
        <td align="left"><span class="form-group">
            <asp:TextBox ID="txtEmployerNatureOfBusiness1" placeholder="Business 1" runat="server" CssClass="form-control txt_area_employer_nature"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEmployerNatureOfBusiness1" CssClass="errormsg" Display="Dynamic" ErrorMessage="*" setfocusonerror="True" Enabled="false"></asp:RequiredFieldValidator>
        </span></td>
        <td align="left"><span class="form-group">
            <asp:TextBox ID="txtEmployerDesignation1" placeholder="Desig. 1" runat="server" CssClass="form-control txt_area_employer_designation"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtEmployerDesignation1" CssClass="errormsg" Display="Dynamic" ErrorMessage="*" setfocusonerror="True" Enabled="false"></asp:RequiredFieldValidator>
        </span></td>
        <td align="left"><span class="form-group">
            <asp:TextBox ID="txtEmployerJobDescription1" placeholder="Job Desc. 1" runat="server" CssClass="form-control txt_area_employer_job"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtEmployerJobDescription1" CssClass="errormsg" Display="Dynamic" ErrorMessage="*" setfocusonerror="True" Enabled="false"></asp:RequiredFieldValidator>
        </span></td>
        <td align="left"><span class="form-group">
            <asp:TextBox ID="txtEmployerStartDate1" placeholder="Start Date 1" runat="server" CssClass="form-control txt_area_employer_date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtEmployerStartDate1" CssClass="errormsg" Display="Dynamic" ErrorMessage="*" setfocusonerror="True" Enabled="false"></asp:RequiredFieldValidator>
        </span></td>
        <td align="left"><span class="form-group">
            <asp:TextBox ID="txtEmployerEndDate1" placeholder="End Date 1" runat="server" CssClass="form-control txt_area_employer_date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtEmployerEndDate1" CssClass="errormsg" Display="Dynamic" ErrorMessage="*" setfocusonerror="True" Enabled="false"></asp:RequiredFieldValidator>
        </span></td>
      </tr>
      <tr>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtEmployerCompanyName2" placeholder="Company 2" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtEmployerAddress2" placeholder="Address 2" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtEmployerNatureOfBusiness2" placeholder="Business 2" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtEmployerDesignation2" placeholder="Desig. 2" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtEmployerJobDescription2" placeholder="Job Desc. 2" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtEmployerStartDate2" placeholder="Start Date 2" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
          <asp:TextBox ID="txtEmployerEndDate2" placeholder="End Date 2" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
      </tr>
      <tr>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtEmployerCompanyName3" placeholder="Company 3" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtEmployerAddress3" placeholder="Address 3" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtEmployerNatureOfBusiness3" placeholder="Business 3" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtEmployerDesignation3" placeholder="Desig. 3" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtEmployerJobDescription3" placeholder="Job Desc. 3" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtEmployerStartDate3" placeholder="Start Date 3" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
          <asp:TextBox ID="txtEmployerEndDate3" placeholder="End Date 3" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
      </tr>
      
      <tr>
      <td align="left"><span class="form-group">
        <asp:TextBox ID="txtEmployerCompanyName4" placeholder="Company 4" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtEmployerAddress4" placeholder="Address 4" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtEmployerNatureOfBusiness4" placeholder="Business 4" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtEmployerDesignation4" placeholder="Desig. 4" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtEmployerJobDescription4" placeholder="Job Desc. 4" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtEmployerStartDate4" placeholder="Start Date 4" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
        <td align="left"><span class="form-group">
          <asp:TextBox ID="txtEmployerEndDate4" placeholder="End Date 4" runat="server" CssClass="form-control"></asp:TextBox>
        </span></td>
      </tr>
    </tbody>
  </table>
            </div>
            <br>

<p class="blue-title margin-bottom-20">Renumeration Details</p>
            
            <div class="row">
            <div class="col-sm-6 col-xs-12 black-txt1">
            <div class="form-group">
                <label>Present (per annum) </label>
                <asp:TextBox ID="txtRemPresent" runat="server" CssClass="form-control" placeholder="Present (per annum)" MaxLength="8"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtRemPresent" CssClass="errormsg" Display="Dynamic" ErrorMessage="Required" setfocusonerror="True" Enabled="false"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtRemPresent" ErrorMessage="Only Numbers Allowed" ValidationExpression="^\d*\.{0,1}\d+$" Display="Dynamic" SetFocusOnError="True" CssClass="errormsg"></asp:RegularExpressionValidator>
    		</div>
            </div>
            <div class="col-sm-6 col-xs-12 black-txt1">
             <div class="form-group">
                <label>Expected (per annum) *</label>
                <asp:TextBox ID="txtRemExpected" runat="server" CssClass="form-control" placeholder="Expected (per annum) *" MaxLength="8"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtRemExpected" CssClass="errormsg" Display="Dynamic" ErrorMessage="Required" setfocusonerror="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtRemExpected" ErrorMessage="Only Numbers Allowed" ValidationExpression="^\d*\.{0,1}\d+$" Display="Dynamic" SetFocusOnError="True" CssClass="errormsg"></asp:RegularExpressionValidator>
    		</div>
            </div>
            </div>
            <div class="clearfix"></div>
            <br>
<p class="blue-title margin-bottom-20">Languages Known</p>
<div class="table-responsive">
         <table class="table table-striped">
    <tbody>
      <tr>
        <td width="11%" align="left"><strong>Language</strong></td>
        <td width="11%" align="center"><strong>Read</strong></td>
        <td width="11%" align="center"><strong>Write</strong></td>
        <td width="11%" align="center"><strong>Speak</strong></td>
        </tr>
      <tr>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtLang1" placeholder="Language 1" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
        </span></td>
        <td align="center"><asp:CheckBox ID="chkRead1" runat="server" Text="" /></td>
        <td align="center"><asp:CheckBox ID="chkWrite1" runat="server" Text="" /></td>
        <td align="center"><asp:CheckBox ID="chkSpeak1" runat="server" Text="" /></td>
        </tr>
      
      <tr>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtLang2" placeholder="Language 2" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
        </span></td>
        <td align="center"><asp:CheckBox ID="chkRead2" runat="server" Text="" /></td>
        <td align="center"><asp:CheckBox ID="chkWrite2" runat="server" Text="" /></td>
        <td align="center"><asp:CheckBox ID="chkSpeak2" runat="server" Text="" /></td>
        </tr>
        <tr>
        <td align="left"><span class="form-group">
        <asp:TextBox ID="txtLang3" placeholder="Language 3" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
        </span></td>
        <td align="center"><asp:CheckBox ID="chkRead3" runat="server" Text="" /></td>
        <td align="center"><asp:CheckBox ID="chkWrite3" runat="server" Text="" /></td>
        <td align="center"><asp:CheckBox ID="chkSpeak3" runat="server" Text="" /></td>
        </tr>
      </tbody>
  </table>   
         </div>   
            <p class="blue-title margin-bottom-20">Resume</p>
             <div class="form-group black-txt1 margin-bottom-40">
                <label><span class="">Attach File Here *</span></label>
                <asp:FileUpload ID="ResumeUpload1" runat="server" class="form-control" Visible="true" Width="350" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="ResumeUpload1" CssClass="errormsg" Display="Dynamic" ErrorMessage="Required" setfocusonerror="True" Enabled="true"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorTi1" runat="server" ErrorMessage="Invalid file format.!" CssClass="errormsg" ValidationExpression="^([0-9a-zA-Z_\-~ :\\])+(.doc|.pdf|.docx|.rtf|.DOC|.PDF|.DOCX|.RTF)$" ControlToValidate="ResumeUpload1" Display="Dynamic" Enabled="true"></asp:RegularExpressionValidator>
                &nbsp;&nbsp;(Allowed file formats are .doc, .docx, .pdf, .rtf)
    		</div>
            <asp:LinkButton ID="btnSubmit" runat="server" CssClass="btn gry2 ico" Text="Submit <span><i class='fa fa-envelope-o'></i></span>"></asp:LinkButton>
    		  <%--<asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success" CausesValidation="True"  />--%> 
            <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn gry2 ico" CausesValidation="False"  />
            <input type="hidden" name="hdnEducationalCounter" id="hdnEducationalCounter" value="3" runat="server" />
            <input type="hidden" name="hdnEmployerCounter" id="hdnEmployerCounter" value="2" runat="server" />
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
