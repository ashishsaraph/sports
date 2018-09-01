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
   <script type="text/javascript">
   function validate()
   {
   		var oname=document.getElementById("organizername");
   		var cname=document.getElementById("collegename");
		var gender=document.getElementById("gender");
		var uname=document.getElementById("username");
		var pass=document.getElementById("password");
		/*var email=document.getElementByID("email");*/
		
		if(oname.value.trim().length==0)
		{
			alert("Please enter Organizer Name")
			oname.focus();
			return false;
		}
		if(!oname.value.match(/^[A-Za-z .]+$/))  
		  {  
		  alert("Enter only alphabets in Organizer name")
		  oname.focus();
		  return false;  
		  } 
		
		if(cname.value.trim().length==0)
		{
			alert("Please enter College Name")
			cname.focus();
			return false;
		}
		if(!cname.value.match(/^[A-Za-z .]+$/))  
		  {  
		  alert("Enter only alphabets in college name")
		  cname.focus();
		  return false;  
		  } 
		
		if(gender.value==-1)
		{
			alert("Please Select Gender")
			gender.focus();
			return false;
		}
		if(uname.value.trim().length==0)
		{
			alert("Please enter User Name")
			uname.focus();
			return false;
		}
		if(!uname.value.match(/^[A-Za-z .]+$/))  
		  {  
		  alert("Enter only alphabets in Uname name")
		  uname.focus();
		  return false;  
		  } 
		if(pass.value.trim().length==0)
		{
			alert("Please enter Password")
			pass.focus();
			return false;
		}
		if(pass.value.trim().length>=8)
		{
			alert("Password must be less than 8")
			pass.focus();
			return false;
		}
		if(email.value.trim().length==0)
		{
			alert("Please enter Email_ID")
			email.focus();
			return false;
		}
		 var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    		if (!filter.test(email.value))
			 {
    			alert('Please provide a valid email address');
    			email.focus;
				return false;
			}
		
   }
   
   </script>
</head>

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
                    <td><span class="style11">Organizer Name </span></td>
                    <td><input name="organizername" type="text" id="organizername"></td>
                  </tr>
                  <tr>
                    <td><span class="style11">College Name</span></td>
                    <td><input name="collegename" type="text" id="collegename"></td>
                  </tr>
                  <tr>
                    <td><span class="style11">Gender</span></td>
                    <td><span class="style11">
                      <select name="gender" id="gender">
                        <option value="-1">Select Gender</option>
                        <option value="m">Male</option>
                        <option value="f">Female</option>
                      </select>
                    </span></td>
                  </tr>
                  <tr>
                    <td><span class="style11">User Name </span></td>
                    <td><input name="username" type="text" id="username"></td>
                  </tr>
                  <tr>
                    <td><span class="style11">Password</span></td>
                    <td><input name="password" type="password" id="password"></td>
                  </tr>
                  <tr>
                    <td><span class="style11">Email</span></td>
                    <td><input name="email" type="text" id="email"></td>
                  </tr>
                  <tr>
                    <td><div align="center" class="style12">
                    </div></td>
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
	String organizername="",collegename="",gender="",username="",password="",email="";
	//getting parameters from html controls
	organizername=request.getParameter("organizername");
	collegename=request.getParameter("collegename");
	gender=request.getParameter("gender");
	username=request.getParameter("username");
	password=request.getParameter("password");
	email=request.getParameter("email");

	try
	{
		//create a statement
		Statement st=con.createStatement();
		//Execute the sql statement and store the result in the result state
		ResultSet rs=st.executeQuery("Select * from tm_organizer where username='"+username+"'");
		while(rs.next())
		{
			
			exist=true;
			break;
		}//while
		
		if(exist)
		{
			out.println("<script>alert('organizername or username name already exists')</script>");
		}
		else 
		{
			st.executeUpdate("Insert into tm_organizer(organizername,collegename,gender,username)values('"+organizername+"','"+collegename+"','"+gender+"','"+username+"')");
			st.executeUpdate("Insert into tm_login(uname,pass,utype,email)values('"+username+"','"+password+"','staff','"+email+"')");

			out.println("<script>alert('Organizer Added Successfully')</script>");
		}
		
	}//try
	catch(Exception ex)
	{
		out.println("Error : "+ex);
	}
}
 %>
