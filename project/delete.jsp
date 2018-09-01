<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="myconn.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
</head>

<body>
<%
		try
		{
			//STEP 4: Execute a query
		 
		  Statement st = con.createStatement();
		  st.executeUpdate("delete from register where pid="+request.getParameter("id")+"");
		  response.sendRedirect("tp.jsp?msg=Record with PlayerName Id: "+request.getParameter("id")+"deleted successfully");
		}
		catch(Exception ex)
		{
			out.println("Error in Deleting Values: "+ex);
		}
		  %>
</body>
</html>
