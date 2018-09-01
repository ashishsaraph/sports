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
.style14 {font-size: 16px}
.style9 {color: #FF0000}
.style21 {font-size: large}
.style22 {color: #FFFFFF}
-->
   </style>
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
              <p>&nbsp;</p>
              <form name="form1" method="post" action="">
                <table width="1000" border="0" align="center" cellpadding="10" cellspacing="0">
                  <tr>
                    <td><p>&nbsp;</p>
                        <table width="377" border="0" align="center" cellpadding="10" cellspacing="0">
                          <tr>
                            <td width="211"><span class="style22 style21 style5"><strong>Tournament Name</strong></span></td>
                            <td width="126"><span class="style14">
                              <select name="tid" id="tid">
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
                              </select>
                            </span></td>
                          </tr>
                          <tr>
                            <td><span class="style22 style21 style5"><strong>Event Name</strong></span></td>
                            <td><span class="style14">
                              <select name="eventname" id="eventname" >
                                <option>Select Event Name</option>
                                <option>100mtrs_Male</option>
                                <option>100mts_Female</option>
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
                              </select>
                            </span></td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td><div align="left">
                                <input type="submit" name="Submit" value="Get Results" height="5" width="20">
                            </div></td>
                          </tr>
                      </table></td>
                  </tr>
                  <tr>
                    <td><p align="center"><span class="style9">
                        <% if(request.getParameter("msg")!=null) out.println(request.getParameter("msg"));%>
                      </span></p>
                        <table width="622" border="5" align="center" cellpadding="10" cellspacing="0" bgcolor="#CCCCCC">
                          <tr align="center" bgcolor="#F0AB60">
                            <td width="284" bgcolor="#F0AB60"><span class="style21"><strong>Player Name </strong></span></td>
                            <td width="284" bgcolor="#F0AB60"><div align="center" class="style21"><strong>Player ID </strong></div></td>
                          </tr>
                          <% 
			if(request.getMethod().equals("POST"))
			{
				
				String eventname="", tid="";
				tid=request.getParameter("tid");
				eventname=request.getParameter("eventname");
				try
				{
					Statement st=con.createStatement();
					//ResultSet rs=st.executeQuery("Select * from tm_score where tid='"+tid+"' and eventname='"+eventname+"' order by score");
					ResultSet rs = st.executeQuery("SELECT P.playername,P.pid FROM tm_player P,tm_playerevent S WHERE P.pid=S.pid ORDER BY P.pid");
					while(rs.next())
					{
						//String id=rs.getString("id");
						//String playername=rs.getString("playername");
			%>
                          <tr bordercolor="#F0F0F0" bgcolor="#79C692">
                            <td bordercolor="#F0F0F0"><strong><strong><%= rs.getString("playername") %></strong></strong></td>
                            <td height="40" bordercolor="#F0F0F0"><strong>
                              <div align="center"><strong><%= rs.getString("pid") %></strong></div>
                            </strong></td>
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
        <p align="center" class="style2">PROJECT REGISTERED TRACK RECORDS E-ORGANIZER </p>
      </td>
    </tr>
  </table>
</div>
</body>
</html>
