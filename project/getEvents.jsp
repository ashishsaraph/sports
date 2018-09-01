<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="myconn.jsp" %>
 <table width="200" border="0" cellspacing="0" cellpadding="10">
                   <tr>
                     <td><select name="eventname1" id="eventname1">
                       <option value="-1">Select Event Name</option>
                       <%
					   	try
						{
						String tid=request.getParameter("tid");
						Statement st=con.createStatement();
						ResultSet rs=st.executeQuery("Select eventname from tm_event where tid="+tid+"");
						while(rs.next())
						{
							String eventname=rs.getString("eventname");
				  %>
                       <option value="<%=eventname%>"><%=eventname%></option>
                       <%
				  		}
				  	}
					catch(Exception ex)
					{
						out.println(ex.toString());
					}
					
				  %>
                     </select></td>
                   </tr>
                   <tr>
                     <td><select name="eventname2" id="eventname2">
                       <option value="-1">Select Event Name</option>
                       <%
					   	try
						{
						String tid1=request.getParameter("tid");
						Statement st1=con.createStatement();
						ResultSet rs1=st1.executeQuery("Select eventname from tm_event where tid="+tid1+"");
						while(rs1.next())
						{
							String eventname=rs1.getString("eventname");
				  %>
                       <option value="<%=eventname%>"><%=eventname%></option>
                       <%
				  		}
				  	}
					catch(Exception ex)
					{
						out.println(ex.toString());
					}
					
				  %>
                     </select></td>
                   </tr>
                   <tr>
                     <td><select name="eventname3" id="eventname3">
                       <option value="-1">Select Event Name</option>
                       <%
					   	try
						{
						String tid2=request.getParameter("tid");
						Statement st2=con.createStatement();
						ResultSet rs2=st2.executeQuery("Select eventname from tm_event where tid="+tid2+"");
						while(rs2.next())
						{
							String eventname=rs2.getString("eventname");
				  %>
                       <option value="<%=eventname%>"><%=eventname%></option>
                       <%
				  		}
				  	}
					catch(Exception ex)
					{
						out.println(ex.toString());
					}
					
				  %>
                     </select></td>
                   </tr>
                 </table>
 <p>&nbsp;				      </p>
				