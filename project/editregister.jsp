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
		var pname=document.getElementById("pname");
		var cname=document.getElementById("cname");
		var pclass=document.getElementById("pclass");
		var rno=document.getElementById("rno");
		
		if(pname.value.trim().length==0)
		{
			alert("Please enter Player Name")
			pname.focus();
			return false;
		}
		if(cname.value.trim().length==0)
		{
			alert("Please enter College Name")
			cname.focus();
			return false;
		}
		if(pclass.value.trim().length==0)
		{
			alert("Please enter Class")
			pclass.focus();
			return false;
		}
		if(rno.value.trim().length==0)
		{
			alert("Please enter Roll NO")
			rno.focus();
			return false;
		}
		if(dob.value.trim().length==0)
		{
			alert("Please enter D.O.B")
			dob.focus();
			return false;
		}
		if(gender.value==-1)
		{
			alert("Please Select Gender")
			gender.focus();
			return false;
		}
	}

   
   </script>
   <script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>
<%
	String pname="",cname="",pclass="",rno="",gender="",tname="",eventname1="",eventname2="",eventname3="";
	//getting parameters from html controls
	String id=request.getParameter("id");
	Statement st=con.createStatement();
	
		ResultSet rs=st.executeQuery("Select * from tm_player where pid="+id+"");
		while(rs.next())
		{
			pname=rs.getString("playername");
			cname=rs.getString("collegename");
			pclass=rs.getString("pclass");
			rno=rs.getString("rollno");
			gender=rs.getString("gender");
	}

%>

<body>

<div align="left">
  <div align="center" class="style3">Track Record e-Organizer</div>
  <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" background="image/page_bg.jpg">
    <tr>
      <td><%@ include file="organizermenu.jsp" %></td>
    </tr>
    <tr>
      <td><!-- Import menu page here -->	</td>
    </tr>
    <tr>
      <td><table width="1000" border="0" cellpadding="0" cellspacing="0" background="image/contactus.jpg">
          <tr background="image/clean_blur_hd_background_by_speetix-d5zpor8.jpg">
            <td height="558" valign="top"><div align="left">
              <form name="form1" method="post" action=""  onSubmit="return validate()">
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <table width="846" border="0" align="center" cellpadding="10" cellspacing="0" bgcolor="">
                  <tr>
                    <td><span class="style11">Player ID </span></td>
                    <td><input name="pd" type="text" id="pd" value="<%= id%>"></td>
                  </tr>
                  <tr>
                    <td width="184"><span class="style11">Player Name </span></td>
                    <td width="326"><input name="pname" type="text" id="pname" value="<%= pname%>"></td>
                  </tr>
                  <tr>
                    <td><span class="style11">College Name</span></td>
                    <td><input name="cname" type="text" id="cname" value="<%= cname%>"></td>
                  </tr>
                  <tr>
                    <td><span class="style11">Class</span></td>
                    <td><input name="pclass" type="text" id="pclass" value="<%= pclass%>"></td>
                  </tr>
                  <tr>
                    <td><span class="style11">Roll No</span></td>
                    <td><input name="rno" type="text" id="rno" value="<%= rno%>"></td>
                  </tr>
                  <tr>
                    <td><span class="style11">Gender</span></td>
                    <td><span class="style11">
                      <select name="gender" id="gender">
                        <option value="-1">Select Gender</option>
                        <option value="m">Male</option>
                        <option value="f">Female</option>
                      </select>
                      <input name="gender" type="text" id="gender" value="<%= gender%>"></td>
                  </tr>
                  <tr>
                    <td><span class="style11">Event</span></td>
                    <td><select name="eventname1" id="eventname1">
                      <option>Select Event1</option>
                      <option>100 mtrs</option>
                      <option>200 mtrs</option>
                      <option>400 mtrs</option>
                      <option>800 mtrs</option>
                      <option>1500 mtrs</option>
                      <option>3000 mtrs</option>
                    </select>
                      <select name="eventname2" id="eventname2">
                        <option>Select Event2</option>
                        <option>100 mtrs</option>
                        <option>200 mtrs</option>
                        <option>400 mtrs</option>
                        <option>800 mtrs</option>
                        <option>1500 mtrs</option>
                        <option>3000 mtrs</option>
                      </select>                      
                      <select name="eventname3" id="eventname3">
                        <option>Select Event3</option>
                        <option>100 mtrs</option>
                        <option>200 mtrs</option>
                        <option>400 mtrs</option>
                        <option>800 mtrs</option>
                        <option>1500 mtrs</option>
                        <option>3000 mtrs</option>
                      </select></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td><input name="  eventname1" type="text" id="  eventname1" value="<%= eventname1%>">
                      <input name="eventname2" type="text" id="eventname2" value="<%= eventname2%>">
                      <input name=" eventname3" type="text" id=" eventname3" value="<%= eventname3%>"></td>
                  </tr>
                  <tr>
                    <td><div align="center" class="style12">
                      <input type="submit" name="Submit" value="Clear">
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
        <p align="center" class="style2">PROJECT REGISTERED TRACK RECORD e-ORGANIZER </p>
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
	id=request.getParameter("pid");
	pname=request.getParameter("playername");
	cname=request.getParameter("collegename");
	pclass=request.getParameter("pclass");
	rno=request.getParameter("rollno");
	gender=request.getParameter("gender");
	eventname1=request.getParameter("eventname1");
	eventname2=request.getParameter("eventname2");
	eventname3=request.getParameter("eventname3");
	try
	{
		
			st.executeUpdate("Update tm_register set pname ='"+pname+"',cname='"+cname+"',pclass='"+pclass+"',rno='"+rno+"',gender='"+gender+"',eventname1='"+eventname1+"',eventname2='"+eventname2+"',eventname3='"+eventname3+"' where pid="+id);
			out.println("<script>alert('player Registered Successfully')</script>");
		
	}//try
	catch(Exception ex)
	{
		out.println("Error : "+ex);
	}
}
 %>
