<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css">

<link rel="stylesheet" type="text/css" href="../bootstrap/css/login.css">
<!-- Website Font style -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    

<%-- 자바빈 클래스 import --%>      
<%@ page import="member.MemberBean" %>  
<%-- DAO import --%>   
<%@ page import="member.MemberDAO" %> 

 <%-- 자바빈 관련 액션태그 사용 --%>
<jsp:useBean id="memberBean" class="member.MemberBean" />
<jsp:setProperty property="*" name="memberBean"/>  

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	
	
	MemberDAO member = MemberDAO.getInstance();
	boolean result = member.loginCheck(id, pw);
	
	if(result){//로그인 정보가 있을 때
		session.setAttribute("sessionId", id);
		session.setAttribute("sessionPw", pw);
		
		response.sendRedirect("../index.jsp");
	}else{//아이디 혹은 비밀번호 확인
%>
<div class="login">		
<div class="container">
    <div class="row">
   		<div class="col-md-2 col-md-offset-3">
   		 <a href="../index.jsp"><img src="../images/main.png" class="img-responsive img-circle"></a>
   		</div>
   		 <div class="col-md-4 ">
   		 <img src="../images/checkidpwd.png" class="img-responsive">
   		 </div>
   	</div>
   	<div class="col-md-offset-3">
		<h3>Click Image!</h3> 
	</div>
</div>
</div>


<%
	}

%>