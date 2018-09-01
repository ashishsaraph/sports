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
.style11 {color: #FFFFFF; font-weight: bold; font-size: large; }
.style12 {font-size: large}
-->
   </style>
   <!-- link calendar resources -->
   <script type="text/javascript">
   function validate()
	{
		var tname=document.getElementById("tname");
		if(tname.value.trim().length==0)
		{
			alert("Please enter Tournament Name")
			tname.focus();
			return false;
		}
		
		
     }
   
   </script>
	
</head>
<%
int tid=0;
try
{
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("Select max(tid) as 'TID' from tm_tournament");
	while(rs.next())
	{
		tid=rs.getInt("TID");
		tid=tid+1;
	}
}
catch(Exception ex)
{
	out.println(ex.toString());
}
%>
<body>

<div align="left">
  <div align="center" class="style3">Track Records E-Organizer</div>
  <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" background="image/page_bg.jpg">
    <tr>
      <td bgcolor="#999999"><%@ include file="adminmenu.jsp" %></td>
    </tr>
    <tr>
      <td><!-- Import menu page here -->	</td>
    </tr>
    <tr>
      <td><table width="1000" border="0" cellpadding="0" cellspacing="0" background="image/contactus.jpg">
          <tr background="image/clean_blur_hd_background_by_speetix-d5zpor8.jpg">
            <td height="558" valign="top"><div align="left">
              <form name="form1" method="post" action="" onSubmit="return validate()">
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <table width="500" border="0" align="center" cellpadding="10" cellspacing="0" bgcolor="">
                  <tr>
                    <td><span class="style11">Tournament ID </span></td>
                    <td><input name="tid" type="text" id="tid" readonly="true" value="<%= tid %>"></td>
                  </tr>
                  <tr>
                    <td><span class="style11">Tournament Name</span></td>
                    <td><input name="tname" type="text" id="tname"></td>
                  </tr>
                  <tr>
                    <td><div align="center" class="style12"> </div></td>
                    <td><div align="center" class="style12">
                        <input type="submit" name="Submit" value="Submit">
                    </div></td>
                  </tr>
                </table>
              </form>
            </div></td>
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
	boolean exist=false;
	String tname="";
	//getting parameters from html controls
	String tid1=request.getParameter("tid");
	tname=request.getParameter("tname");
	
	try
	{
		//create a statement
		Statement st=con.createStatement();
		//Execute the sql statement and store the result in the result state
		ResultSet rs=st.executeQuery("Select * from tm_tournament where tname='"+tname+"'");
		
		while(rs.next())
		{
			
			exist=true;
			break;
		}//while
		
		if(exist)
		{
			out.println("<script>alert('Events already exists')</script>");
		}
		else 
		{
			st.executeUpdate("Insert into tm_tournament(tid,tname,tyear)values('"+tid1+"','"+tname+"',YEAR(CURDATE()))");
			out.println("<script>alert('Event Added Successfully')</script>");
		}
		
	}//try
	catch(Exception ex)
	{
		out.println("Error : "+ex);
	}
}
 %>