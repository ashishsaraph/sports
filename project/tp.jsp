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
-->
   </style>
   <!-- link calendar resources -->
	<link rel="stylesheet" type="text/css" href="tcal.css" />
	<script type="text/javascript" src="tcal.js"></script> 
    <style type="text/css">
<!--
.style9 {color: #FF0000}
.style17 {color: #FFFFFF; font-weight: bold; }
.style19 {font-size: 16px; font-weight: bold; }
-->
    </style>
	<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>

<body>

<div align="left">
  <div align="center" class="style3">Track Record e-Organizer</div>
  <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" background="image/page_bg.jpg">
    <tr>
      <td><%@ include file="adminmenu.jsp" %></td>
    </tr>
    <tr>
      <td><!-- Import menu page here -->	</td>
    </tr>
    <tr>
      <td><table width="1000" border="0" cellpadding="0" cellspacing="0" background="image/contactus.jpg">
          <tr background="image/clean_blur_hd_background_by_speetix-d5zpor8.jpg">
            <td height="558" valign="top"><div align="left">
              <form name="form1" method="post" action="">
                <p>&nbsp;</p>
                <table width="1000" border="0" align="center" cellpadding="10" cellspacing="0">
                  <tr>
                    <td><table width="400" border="0" align="center" cellpadding="10" cellspacing="0">
                        <tr>
                          <td width="151"><span class="style17">Select Category </span></td>
                          <td width="209"><span class="style19">
                            <select name="player" size="1" id="player">
                              <option value="-1" selected>Select Category</option>
                              <option value="o">organizer</option>
                              <option value="p">player</option>
                              <option value="e">events</option>
                              <option value="t">tournament</option>
                            </select>
                          </span></td>
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
                        <table width="980" border="0" align="center" cellpadding="10" cellspacing="0" bgcolor="#FFFFFF">
                          <tr>
                            <td width="187"><div align="left"><strong>Player Name </strong></div></td>
                            <td width="161"><div align="left"><strong>Roll No</strong></div></td>
                            <td width="296"><div align="center"></div></td>
                            <td width="256"><div align="center"></div></td>
                          </tr>
                          <% 
			if(request.getMethod().equals("POST"))
			{
				
				try
				{
					Statement st=con.createStatement();
					ResultSet rs=st.executeQuery("Select * from tm_player");
					while(rs.next())
					{
						String pid=rs.getString("pid");
			%>
                          <tr>
                            <td><%= rs.getString("playername") %></td>
                            <td><%= rs.getString("rollno") %></td>
                            <td><div align="center"><strong><a href="editregister.jsp?id=<%= pid %>">Edit</a></strong></div></td>
                            <td><div align="center"><strong><a href="delete.jsp?id=<%= pid %>" onClick="return confirm('Are you sure you want to delete this menu?');">Delete</a></strong></div></td>
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
                <p>&nbsp;</p>
                <p>&nbsp;</p>
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