<%@page import="com.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
if (request.getParameter("itemCode") != null){
	Item itemObj = new Item();
	String stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
										request.getParameter("itemName"),
										request.getParameter("itemPrice"),
										request.getParameter("itemDesc"));
	session.setAttribute("statusMsg", stsMsg);
}

if(request.getParameter("itemID") != null){
	 
	 Item deleteitem = new Item();
	 String result = deleteitem.DeleteItems(request.getParameter("itemID"));
	 session.setAttribute("result", result);
} 

//if(request.getParameter("itemId") != null){
//	Item updateitem = new Item();
//	String stsMsg = updateitem.UpdateItem(request.getParameter("itemCode"),
//											request.getParameter("itemName"),
//											request.getParameter("itemPrice"),
//											request.getParameter("itemDesc"));
//	session.setAttribute("statusMsg", stsMsg);
//}
%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Items Management</title>
	</head>
	<body>
	
		<h1>Items Management</h1>
		<form method="post" action="items.jsp">
			Item code: <input name="itemCode" type="text"><br>
			Item name: <input name="itemName" type="text"><br>
			Item price: <input name="itemPrice" type="text"><br>
			Item description: <input name="itemDesc" type="text"><br>
		<input name="btnSubmit" type="submit" value="Save">
		</form>
		<%
		if(request.getParameter("itemCode")  != null){
			out.print(session.getAttribute("statusMsg"));
		}		
		else if(request.getParameter("itemID")  != null){
			out.print(session.getAttribute("result"));
		}
		//else if(request.getParameter("itemId") != null){
		//	out.print(session.getAttribute("statusMsg"));
		//}
		
		out.print("");
		Item itemObj = new Item();
		out.print(itemObj.readItems());
		
		%>
		
	</body>
</html>