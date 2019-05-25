<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="model.Item" %>
    
<%
	Item item = new Item();

	String itemGrid = "";
	
	itemGrid = item.getItem();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<div>
		<% out.println(itemGrid);  %>
	</div>
	
<script>
	
	$(document).on("click", "#btnEdit", function(){
		$("#hid").val($(this).attr("param"));
		console.log("clicked " + $(this).attr("param"));
	});

	
</script>	
</body>
</html>