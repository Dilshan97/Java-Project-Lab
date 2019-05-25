<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String LoginMsg = "";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
	
	<form action="login.jsp" method="Post" id="formItems">
		Username <input type="text" id="txtUserName" name="txtUserName"/>
		Password <input type="password" id="txtPassword" name="txtPassword"/>
		<input id="btnLogin" name="btnLogin" type="button" value="Login"/>
		<div id="divStsMsgLogin">
			<% out.println(LoginMsg); %>
		</div>
	</form>


<script>
	
	$(document).on("click", "#btnLogin", function(){
		$("#divStsMsgLogin").html("");
		
		var result = isValidFormLogin();
		
		if(result == "true"){
			
		}
		else {
			
			$("#divStsMsgLogin").html(result);
		}
	});
	
	// form Validation
	function isValidFormLogin(){
		
		if($.trim($("#txtUserName").val()) == ""){
			return "Enter Username";
		}
		else if($.trim($("#txtPassword").val()) == ""){
			return "Enter Password";
		}
		else{
			return "true";
		}
		
		
	}

</script>	
</body>
</html>