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
	background-image: url(image/BACK.jpg);
}
-->
</style>
 <link rel="stylesheet" href="styles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
   <style type="text/css">
<!--
.style2 {color: #FFFFFF; font-size: small; }
.style3 {color: #FFFFFF; font-size: x-large; font-weight: bold; }
.style9 {color: #FFFFFF; font-size: large; font-weight: bold; }
-->
   </style>
   <script type="text/javascript">
   /*function validate()
   {
		  var oldpass=document.getElementById("opass");
		  var newpass=document.getElementById("npass");
		  var confir=document.getElementById("rnpass");
	  
		if(oldpass.value.trim().length==0)
		{
			alert("Please Enter your Old Password");
			oldpass.focus();
			return false;
		}
		
		if(newpass.value.trim().length==0)
		{
			alert("Please Enter your  New Password");
			newpass.focus();
			return false;
		}
		
		if(newpass.value.trim().length>8)
		{
			alert(" New password must be less than 8");
			newpass.focus();
			return false;
		}
		
		if(confir.value.trim().length==0)
		{
			alert("Please Enter your Confirm Password");
			confir.focus();
			return false;
		}
		if(confir.value.trim()!= newpass.value.trim())
		{
			alert(" New Password and Confirm New Password does not match.");
			confir.focus();
			return false;
		}
}*/
     
   </script>
</head>

<body>

<div align="left">
  <div align="center" class="style3">Track Records E-Organizer</div>
  <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" background="image/clean_blur_hd_background_by_speetix-d5zpor8.jpg">
    <tr>
      <td bgcolor="#999999"><%@ include file="adminmenu.jsp" %></td>
    </tr>
    <tr>
      <td><!-- Import menu page here -->	</td>
    </tr>
    <tr>
      <td height="475"><table width="1000" border="0" cellpadding="0" cellspacing="0" background="image/contactus.jpg">
        <tr bgcolor="#FFFFFF">
          <td height="423" background="image/clean_blur_hd_background_by_speetix-d5zpor8.jpg"><form name="form1" method="post" action onSubmit="return validate()">
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <table width="600" align="center" cellpadding="10">
                <tr class="align-center">
                  <td align="right"><span class="style9">Enter Old Password </span></td>
                  <td colspan="2" align="left"><input name="opass" type="password" id="opass">
                  </td>
                </tr>
                <tr class="align-center">
                  <td align="right"><span class="style9">Enter New Password</span></td>
                  <td colspan="2" align="left"><input name="npass" type="password" id="npass">
                  </td>
                </tr>
                <tr class="align-center">
                  <td align="right"><span class="style9">Confirm Password </span></td>
                  <td colspan="2" align="left"><input name="rnpass" type="password" id="rnpass">
                  </td>
                </tr>
                <tr class="align-center">
                  <td align="right">&nbsp;</td>
                  <td align="center">&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr class="align-center">
                  <td align="left">&nbsp;</td>
                  <td align="left"><input name="Submit" type="submit" value="Change Password">
                  </td>
                  <td>&nbsp;</td>
                </tr>
              </table>
            </form>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
            <p>&nbsp;</p></td>
        </tr>
        </table>        
        <p align="center" class="style2">PROJECT REGISTERED TRACK RECORDS E-ORGANIZER </p>
      </td>
    </tr>
  </table>
</div>
</body>
</html>

<%
if(request.getMethod().equals("POST"))
{
	String opass,dpass,npass;
	boolean flag=false;
	opass=request.getParameter("opass");
	npass=request.getParameter("npass");
	
  		
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from tm_login where uname='"+session.getAttribute("uname")+"' and pass='"+opass+"'");
		while(rs.next())
		{
			
				flag=true;
				break;
			
		}
		if(flag)
		{
			st.executeUpdate("update tm_login set pass='"+npass+"' where uname='"+session.getAttribute("uname")+"'");
			out.println("<script language='javascript'>alert('Password changed')</script>");
			
		}
		else
		{
			out.println("<script language='javascript'>alert('Invalid Old Password')</script>");
		}
}
%>