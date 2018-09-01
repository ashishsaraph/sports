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
		var pid=document.getElementById("pid");
		var tid=document.getElementById("tid");
		var eventname1=document.getElementById("eventname1");
		
		if(pid.value==-1)
		{
			alert("Please Select PlayerID")
			pid.focus();
			return false;
		}
		if(tid.value==-1)
		{
			alert("Please Select Tournament")
			tid.focus();
			return false;
		}
		if(eventname1.value==-1)
		{
			alert("Please Select Event")
			eventname1.focus();
			return false;
		}
	}


   
   </script>
   
   <script type="text/javascript">
function showEvent(tid)
{ 
		
        if(document.getElementById("tid").value!="-1")
        {
			 xmlHttp=GetXmlHttpObject()
			 if (xmlHttp==null)
			 {
				 alert ("Browser does not support HTTP Request")
				 return
			 }
			var url="getEvents.jsp"
			url=url+"?tid="+tid.value;
			
			xmlHttp.onreadystatechange=stateChanged 
			xmlHttp.open("GET",url,true)
			xmlHttp.send(null)

        }
        else
        {
                 alert("Please Select A Tournament Id");
        }
}

function stateChanged() 
{ 
        
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
        
  	 document.getElementById("eventname").innerHTML = xmlHttp.responseText; 
   
        
 } 
}

function GetXmlHttpObject()
{
	 var xmlHttp=null;
	 	try
		 {
		 // Firefox, Opera 8.0+, Safari
		 xmlHttp=new XMLHttpRequest();
		 }
		catch (e)
		 {
			 //Internet Explorer
			 try
			  {
			  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			  }
				catch (e)
			  {
			  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			  }
 		 }
return xmlHttp;
}
</script>
</head>
<%
	//getting parameters from html controls
	String id=session.getAttribute("pid").toString();
	

%>

<body>

<div align="left">
  <div align="center" class="style3">Track Records E-Organizer</div>
  <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" background="image/page_bg.jpg">
    <tr>
      <td bgcolor="#999999"><%@ include file="menu.jsp" %></td>
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
                <table width="550" border="0" align="center" cellpadding="10" cellspacing="0" bgcolor="">
                  <tr>
                    <td width="184"><div align="left"><span class="style11">PID</span></div></td>
                    <td width="326"><input name="pid" type="text" id="pid" readonly="true" value="<%= id%>"></td>
                  </tr>
                  <tr>
                    <td><span class="style11">Tournament Name </span></td>
                    <td><select name="tid" id="tid" onChange="return showEvent(this);">
                        <option value="-1">Select Tournament</option>
                        <%
					  	try
						{
							String tid;
							Statement st=con.createStatement();
							ResultSet rs=st.executeQuery("Select * from tm_tournament where tyear=YEAR(CURDATE())");
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
                    <td><span class="style11">Select Event</span></td>
                    <td><div class="style8" id="eventname">
                  
</div>
                      </td>
                  </tr>
                  <tr>
                    <td><div align="center" class="style12">
                    </div></td>
                    <td><div align="center" class="style12">
                      <div align="left"></div>
                    </div></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td><input type="submit" name="Submit" value="Submit"></td>
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
	String pid="",pname="",cname="",pclass="",rno="",gender="",tid="";
	String eventname[]=new String[3];
	//getting parameters from html controls
	pid=request.getParameter("pid");
	tid=request.getParameter("tid");
	eventname[0]=request.getParameter("eventname1");
	eventname[1]=request.getParameter("eventname2");
	eventname[2]=request.getParameter("eventname3");
	try
	{
		//create a statement
		Statement st=con.createStatement();
		//Execute the sql statement and store the result in the result state
		ResultSet rs=st.executeQuery("Select * from tm_playerevent where pid='"+pid+"' and tid='"+tid+"'");
		
		while(rs.next())
		{
			
			exist=true;
			break;
		}//while
		
		if(exist )
		{
			out.println("<script>alert('Player has Already Registered ')</script>");
		}
		else 
		{
			for(int i=0;i<3;i++)
			{
				
				st.executeUpdate("Insert into tm_playerevent(pid,tid,eventname)values('"+pid+"','"+tid+"','"+eventname[i]+"')");
			}
			out.println("<script>alert('player Registered Successfully')</script>");
		}
		
	}//try
	catch(Exception ex)
	{
		out.println("Error : "+ex);
	}
}
 %>
