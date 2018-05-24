<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">




 <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

<link rel="stylesheet" type="text/css" href="bootstrap/css/login.css">


<!-- Website Font style -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 스크립트 -->
<script type="text/javascript">
	//id, pw 작성확인
	function checkValue()
	{
		if(!document.userinput.id.value){
			alert("아이디를 입력하세요.");
			return false;
		}
		if(!document.userinput.password.value){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
	}
</script>

<title>Main page</title>
</head>
<body>

<%
	if(session.getAttribute("sessionId") == null){
%>
<div class="login">
<div class="container">
    <div class="row">
   		<div class="col-md-2 col-md-offset-3">
   		 <img src="images/main.png" class="img-responsive img-circle">
   		</div>
        <div class="col-md-4 ">
                <div class="panel-body">
                    
                    <form name="userinput" class="form-horizontal" method="post" action="Login/loginPro.jsp" onsubmit="return checkValue()">
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                            <input type="text" class="form-control" placeholder="ID" name="id" />
                        </div>
                    </div>
              
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                            <input type="password" class="form-control" placeholder="Password" name="password" />
                        </div>
                    </div>
               <div class="col-md-6 ">
                 <button type="submit" class="btn btn-primary btn-lg btn-block login-button">Login</button>
               </div>
               <div class="col-md-6 ">
                 <button type="button"  class="btn btn-primary btn-lg btn-block login-button" onclick="window.location='Login/join.jsp'">Join</button>
               </div>
               </form>
                </div>
        </div>
    </div>
</div>
</div>
</body>

<%}else{ %>

<!-- main페이지! -->
<body>
 <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0 ;background-color: #14d68d;">
            <div class="navbar-header" >
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">BB's Shop</a> 
            </div>
  <div style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">Welcome :)   <%= session.getAttribute("sessionId") %>님^^   
  <a href="Login/logout.jsp">LogOut</a>
  </div>
        </nav>   
           <!-- /. NAV TOP  -->
           
           
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li >
			   		 <img style="size: 5px" src="images/main.png" class="img-responsive img-circle">
			   		
				</li>
				 <li>
                       <a class="active-menu"  href="index.jsp"><i class="fa fa-user-circle fa-3x"></i> Intro</a>
                  </li>
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-3x"></i> 캐릭터 소개 <span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="IntroCharacter/introLine.jsp">라인 프렌즈</a>
                            </li>
                            <li>
                                <a href="#">Second Level Link</a>
                            </li>
                            <li>
                                <a href="#">Second Level Link<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>

                                </ul>
                               
                            </li>
                        </ul>
                      </li>  
                    <li>
                        <a  href="tab-panel.html"><i class="fa fa-qrcode fa-3x"></i> Tabs  Panels</a>
                    </li>
						   <li  >
                        <a   href="chart.html"><i class="fa fa-bar-chart-o fa-3x"></i> Morris Charts</a>
                    </li>	
                      <li  >
                        <a  href="table.html"><i class="fa fa-table fa-3x"></i> Table Examples</a>
                    </li>
                    <li  >
                        <a  href="form.html"><i class="fa fa-edit fa-3x"></i> Forms </a>
                    </li>				
					 <li  >
                        <a   href="login.html"><i class="fa fa-bolt fa-3x"></i> Login</a>
                    </li>	
                     <li  >
                        <a   href="registeration.html"><i class="fa fa-laptop fa-3x"></i> Registeration</a>
                    </li>	
					                   
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-3x"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">Second Level Link</a>
                            </li>
                            <li>
                                <a href="#">Second Level Link</a>
                            </li>
                            <li>
                                <a href="#">Second Level Link<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>

                                </ul>
                               
                            </li>
                        </ul>
                      </li>  
                </ul>
               
            </div>
            
        </nav>  
        
        
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h3>개발자 소개</h3>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                <hr />
              </div>
          </div>
</div>
<!-- /. WRAPPER  -->


    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
      <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
     <!-- MORRIS CHART SCRIPTS -->
     <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
</body>
<%} %>
</html>