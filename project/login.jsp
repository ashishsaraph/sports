<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="myconn.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
<style type="text/css">
<!--
body {
	background-image: url(image/login1.jpg);
}
.style5 {	font-size: medium;
	font-weight: bold;
	color: #FFFFFF;
}
.style12 {font-size: x-large; font-weight: bold; color: #FFFFFF; }
.style13 {font-size: x-large}
.style15 {font-size: xx-large; font-weight: bold; color: #FFFFFF; }
.style17 {font-size: large}
a:link {
	color: #FFFFFF;
}
a:visited {
	color: #FFFFFF;
}
-->
</style>
	<script type="text/javascript">
	function validate()
	{
		var uname=document.getElementById("uname");
		var pass=document.getElementById("pass");
		
		if(uname.value.trim().length==0)
		{
			alert("Please enter username")
			uname.focus();
			return false;
		}
		if(pass.value.trim().length==0)
		{
			alert("Please enter your password ")
			pass.focus();
			return false;
		}
	}
	</script>

</head>

<body>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div align="center">
  <p class="style15">Track Records E-Organizer  </p>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<form action="" method="post" name="form" id="form" onSubmit="return validate()">
  <table width="480" border="0" align="center" cellpadding="10" cellspacing="0">
    <tr>
      <td colspan="2"><div align="center" class="style12"></div></td>
    </tr>
    <tr>
      <td><span class="style12">User Name </span></td>
      <td><input name="uname" type="text" id="uname" maxlength="20"></td>
    </tr>
    <tr>
      <td><span class="style12">Password</span></td>
      <td><input name="pass" type="password" id="pass" maxlength="20"></td>
    </tr>
    <tr>
      <td><span class="style13"></span></td>
      <td><input name="Submit" type="submit" value="Sign In"></td>
    </tr>
    <tr>
      <td><div align="center"><span class="style5"><a href="addnew.jsp">Create Player Account </a></span></div></td>
      <td><div align="center"><span class="style5"><a href="forgotpass.jsp">Forgot Password?</a></span></div></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="center" class="style17"><a href="about%20us.jsp">About Us </a></div></td>
      <td><div align="center"><span class="style17"><a href="about.jsp">Contact Us </a></span></div></td>
    </tr>
  </table>
</form>
</body>
</html>
<% 
if(request.getMethod().equals("POST"))
{
	boolean exist=false;
	String uname="",pass="",utype="";
	uname=request.getParameter("uname");
	pass=request.getParameter("pass");
	
	try
	{
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("Select * from tm_login where uname='"+uname+"' and pass='"+pass+"'");
		while(rs.next())
		{
			utype=rs.getString("utype");
			exist=true;
			break;
		}
		
		if(exist && utype.equalsIgnoreCase("admin"))
		{
			session.setAttribute("uname",uname);
			response.sendRedirect("adminhome.jsp");
		}
		else if(exist && utype.equalsIgnoreCase("staff"))
		{
			Statement st2=con.createStatement();
			ResultSet rs2=st2.executeQuery("Select * from tm_organizer where username='"+uname+"'");
			while(rs2.next())
			{
				String oname=rs2.getString("organizername");
				session.setAttribute("fullname",oname);
				exist=true;
				break;
			}
			session.setAttribute("utype",utype);
			session.setAttribute("uname",uname);
			response.sendRedirect("organizerhome.jsp");
			
		}
		else  if(exist && utype.equalsIgnoreCase("player"))
		{
			Statement st1=con.createStatement();
			ResultSet rs1=st1.executeQuery("Select * from tm_player where username='"+uname+"'");
			while(rs1.next())
			{
				String pname=rs1.getString("playername");
				String pid=rs1.getString("pid");
				session.setAttribute("fullname",pname);
				session.setAttribute("pid",pid);
				exist=true;
				break;
			}
			session.setAttribute("utype",utype);
			session.setAttribute("uname",uname);
			response.sendRedirect("home.jsp");
		}
		else
		{
			
			out.println("<script>alert('Invalid Username or Password')</script>");
		}
	}
	catch(Exception ex)
	{
		out.println("Error:"+ex);
	}
	
}
%>
