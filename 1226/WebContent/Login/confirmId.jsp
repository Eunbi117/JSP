<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- DAO import --%>   
<%@ page import="member.MemberDAO" %> 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css">

	<!-- Website CSS style -->
	<link rel="stylesheet" type="text/css" href="../bootstrap/css/main.css">

	<!-- Website Font style -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

<style>
	center
	{
		margin-top: 8%;
	}
</style>


<body>
<title>ID 중복확인</title>
<% request.setCharacterEncoding("utf-8");%>
<%
	String id = request.getParameter("id");
	MemberDAO member = MemberDAO.getInstance();
	int check = member.confirmId(id);
	
	if(check == 1){%>
	<center>
	<b><font color="red"><%=id %></font>는 이미 사용중인 아이디입니다.</b>
	<form name="checkForm" method="post" action="confirmId.jsp">
	<b>다른 아이디를 선택하세요.</b><br /><br />
	<input type="text" name="id" id="id" />
	<input type="submit" value="ID중복확인"/>
	</form>
	</center>
	<%
	} else {
	%>
	<center>
	<h4><b><font color="red"><%=id %></font>는 사용하실 수 있는 ID입니다.</b></h4>
	</center>
	<center >
	<input type="button" class="btn btn-primary btn-lg" value="닫기" onclick="setid()" />
	</center>
	<%} %>
	
	
	<script>
	  function setid()
	  {
		  opener.document.userinput.id.value="<%=id%>";
		  self.close();
	  }
	</script>
</body>