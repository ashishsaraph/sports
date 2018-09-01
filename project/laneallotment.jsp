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
-->
   </style>
</head>

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
              <p>&nbsp;</p>
              <form name="form1" method="post" action="">
                <table width="1000" border="0" cellspacing="10" cellpadding="20">
                  <tr>
                    <td><table width="448" border="0" align="center" cellpadding="10" cellspacing="0">
                        <tr>
                          <td width="192"><span class="style11">Select Category </span></td>
                          <td width="216"><span class="style19">
                            <span class="style11">
                            <select name="gender" id="gender">
                              <option value="-1">Select Gender</option>
                              <option value="m">Male</option>
                              <option value="f">Female</option>
                            </select>
                            </span>                          </span></td>
                        </tr>
                        <tr bgcolor="">
                          <td><span class="style11">Tournament Name </span></td>
                          <td><select name="tid" id="tid">
                              <option value="-1">Select Tournament</option>
                              <%
					  	try
						{
							String tid;
							Statement st=con.createStatement();
							ResultSet rs=st.executeQuery("Select * from addtournament");
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
                          <td>&nbsp;</td>
                          <td><select name="eventname1" id="eventname1">
                            <option>Select Event1</option>
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
                          <td><input name="Submit" type="submit" value="Search Menu" width="20" height="5"></td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><p align="center"><span class="style9">
                        <% if(request.getParameter("msg")!=null) out.println(request.getParameter("msg"));%>
                      </span></p>
                        <table width="843" border="0" align="center" cellpadding="10" cellspacing="0" bgcolor="#FFFFFF">
                          <tr>
                            <td width="182"><div align="left"><strong>Player Name </strong></div></td>
                            <td width="83"><div align="left"><strong>PID</strong></div></td>
                            <td width="57"><div align="center"><strong>Gender</strong></div></td>
                            <td width="129"><strong>EventName</strong></td>
                            <td width="159"><strong>TournamentName</strong></td>
                            <td width="113"><div align="center"><strong>Lane</strong></div></td>
                          </tr>
                          <% 
			if(request.getMethod().equals("POST"))
			{
				String gender="",tid="",eventname1="";
				gender=request.getParameter("gender");
				tid=request.getParameter("tid");
				eventname1=request.getParameter("eventname1");
				
				try
				{
					Statement st=con.createStatement();
					ResultSet rs=st.executeQuery("Select * from tm_playerevent where gender='"+gender+"' and tid='"+tid+"' and eventname1='"+eventname1+"'");
					while(rs.next())
					{
						String pid=rs.getString("pid");
			%>
                          <tr>
                            <td><%= rs.getString("pname") %></td>
                            <td><%= rs.getString("pid") %></td>
                            <td><div align="center"><%= rs.getString("gender") %></div></td>
                            <td><%= rs.getString("eventname1") %></td>
                            <td><%= rs.getString("tid") %></td>
                            <td><div align="center"></div></td>
                          </tr>
                          <%
					}
				}
				catch(Exception ex)
				{
					out.println("Error : "+ex);
				}
			}
			%>
                        </table>
                        <p>&nbsp;</p></td>
                  </tr>
                </table>
              </form>
            </div>              </td>
          </tr>
        </table>        
        <p align="center" class="style2">PROJECT REGISTERED TRACK RECORD e-ORGANIZER </p>
      </td>
    </tr>
  </table>
</div>
</body>
</html>
