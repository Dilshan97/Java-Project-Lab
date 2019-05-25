<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="model.User" %>
<%@ page import="java.io.*"%>  

<%
	
	User user = new User();

	String LoginMsg = "Plese Login to Continue..";
	
	if(request.getMethod().equalsIgnoreCase("post")){
		
		if(user.login(request.getParameter("txtUserName"), request.getParameter("txtPassword")).equals("Success")){
			
			request.getRequestDispatcher("/items.jsp").forward(request, response);
		}
		else{
			LoginMsg = "Invalid Details";
		}
	}
	else{
		LoginMsg = "Invalid Method";
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<form action="index.jsp" method="Post" id="formItems">
		Username <input type="text" id="txtUserName" name="txtUserName"/>
		Password <input type="password" id="txtPassword" name="txtPassword"/>
		<input id="btnLogin" name="btnLogin" type="button" value="Login"/>
		<div id="divStsMsgLogin">
			<% out.println(LoginMsg); %>
		</div>
	</form>
	
	<script>
		$(document).on("click", "#btnLogin", function(){
			
			var result = isValidFormLogin();
			
			if(result == "true"){
				// form submission
				$("#formItems").submit();
			}
			else {
				$("#divStsMsgLogin").html(result);
				console.log("Error");
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