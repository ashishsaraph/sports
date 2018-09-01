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
		var tid=document.getElementById("tid");
		var eventname=document.getElementById("eventname");
		var pclass=document.getElementById("pclass");
		var eventdate=document.getElementById("eventdate");
		var eventvenue=document.getElementById("eventvenue");
		if(tid.value==-1)
		{
			alert("Please Select Tournament Name")
			tid.focus();
			return false;
		}
		if(eventname.value==-1)
		{
			alert("Please Select Event Name")
			eventname.focus();
			return false;
		}
		if(eventvenue.value.trim().length==0)
		{
			alert("Please enter Event Venue")
			eventvenue.focus();
			return false;
		}
		if(!eventvenue.value.match(/^[A-Za-z .]+$/))  
		  {  
		  alert("Enter only alphabets in event venue")
		  eventvenue.focus();
		  return false;  
		  } 
	}
</script>
   <!-- link calendar resources -->
	<link rel="stylesheet" type="text/css" href="tcal.css" />
	<script type="text/javascript" src="tcal.js"></script> 
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
                    <td><span class="style11">Tournament Name </span></td>
                    <td><select name="tid" id="tid">
                      <option value="-1">Select Tournament</option>
					  <%
					  	try
						{
							String tid;
							Statement st=con.createStatement();
							ResultSet rs=st.executeQuery("Select * from tm_tournament");
							while(rs.next())
							{
								tid=rs.getString("tname");
							%>
								<option value="<%= rs.getString("tid") %>"><%=tid %></option>
							<%								
							}
						}
						catch(Exception ex)
						{
							out.println("Error:"+ex);
						}
					  %>
                    </select></td>
                  </tr>
                  <tr>
                    <td><span class="style11">Event Name</span></td>
                    <td><select name="eventname" id="eventname">
                      <option value="-1">Select Event Name</option>
                      <option>100mtrs_Male</option>
                      <option>100mtrs_Female</option>
                      <option>200mtrs_Male</option>
                      <option>200mtrs_Female</option>
                      <option>400mtrs_Male</option>
                      <option>400mtrs_Female</option>
                      <option>800mtrs_Male</option>
                      <option>800mtrs_Female</option>
                      <option>1500mtrs_Male</option>
                      <option>1500mtrs_Female</option>
                      <option>3000mtrs_Male</option>
                      <option>3000mtrs_Female</option>
                    </select></td>
                  </tr>
                  <tr>
                    <td><span class="style11">Event Date </span></td>
                    <td><input name="eventdate" type="text" class="tcal calColor tcalInput" id="eventdate" style="background-color:#FFFFFF;"></td>
                  </tr>
                  <tr>
                    <td><span class="style11">Event Venue </span></td>
                    <td><input name="eventvenue" type="text" id="eventvenue"></td>
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
	String tid1="",eventname="",eventdate="",eventvenue="";
	//getting parameters from html controls
	tid1=request.getParameter("tid");
	eventname=request.getParameter("eventname");
	eventdate=request.getParameter("eventdate");
	eventvenue=request.getParameter("eventvenue");
	
	try
	{
		//create a statement
		Statement st=con.createStatement();
		//Execute the sql statement and store the result in the result state
		ResultSet rs=st.executeQuery("Select * from tm_event where eventname='"+eventname+"' and tid='"+tid1+"'");
		
		while(rs.next())
		{
			
			exist=true;
			break;
		}//while
		
		if(exist )
		{
			out.println("<script>alert('Events already exists')</script>");
		}
		else 
		{
			st.executeUpdate("Insert into tm_event(tid,Eventname,Eventdate,Eventvenue)values('"+tid1+"','"+eventname+"','"+eventdate+"','"+eventvenue+"')");
			out.println("<script>alert('Event Added Successfully')</script>");
		}
		
	}//try
	catch(Exception ex)
	{
		out.println("Error : "+ex);
	}
}
 %>