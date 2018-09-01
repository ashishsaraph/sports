<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.io.*,javax.mail.*,javax.mail.internet.*,java.util.*,javax.activation.*" errorPage="" %>
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
.style15 {color: #FFFFFF; font-size: xx-large; font-weight: bold; }
.style16 {color: #FFFFFF}
a:link {
	color: #FFFFFF;
}
a:visited {
	color: #FFFFFF;
}
-->
   </style>
   <script type="text/javascript">
   function validate()
	{
		var pname=document.getElementById("playername");
		var cname=document.getElementById("collegename");
		var pclass=document.getElementById("pclass");
		var rno=document.getElementById("rollno");
		var gender=document.getElementById("gender");
		var uname=document.getElementById("username");
		var pass=document.getElementById("password");
		var email=document.getElementById("email");
		var phno=document.getElementById("phno");

		if(pname.value.trim().length==0)
		{
			alert("Please enter Player Name")
			pname.focus();
			return false;
		}
		if(!pname.value.match(/^[A-Za-z .]+$/))  
		  {  
		  alert("Enter alphabets only in Player name")
		  pname.focus();
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
		  alert("Enter  alphabets only in College name")
		  cname.focus();
		  return false;  
		  } 
		   if(pclass.value.trim().length==0)
			{
			alert("Please enter Class in which studying")
			pclass.focus();
			return false;
			}
			 if(rno.value.trim().length==0)
			{
			alert("Please enter Roll no")
			cname.focus();
			return false;
			}
			if(!rno.value.match(/^[0-9]+$/))  
		  {  
		  alert("Enter Number only in Roll no")
		  rno.focus();
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
			cname.focus();
			return false;
		}
		if(!uname.value.match(/^[A-Za-z]+$/))  
		  {  
		  alert("Enter alphabets only in User name")
		  uname.focus();
		  return false;  
		  } 
		   if(pass.value.trim().length==0)
		{
			alert("Please enter Password")
			pass.focus();
			return false;
		}
		if(email.value.trim().length==0)
		{
			alert("Please enter Email Address")
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
			if(phno.value.trim().length!=10)
		{
			alert('Invalid Mobile Number');
			phno.focus();
			return false;
		}
		y=phno.value.trim();
		if (!(y.charAt(0)=="9" || y.charAt(0)=="8" || y.charAt(0)=="7"))
        {
            alert("Mobile No. should start with 9 ,8 or 7 ");
            phno.focus();
            return false
        }
		
		
     }
   
   </script>
</head>
<%
int pid=0;
try
{
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("Select max(pid) as 'PID' from tm_player");
	while(rs.next())
	{
		pid=rs.getInt("PID");
		pid=pid+1;
	}
}
catch(Exception ex)
{
	out.println(ex.toString());
}
%>

<body>

<div align="left">
  <div align="center" class="style3"></div>
  <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" background="image/page_bg.jpg">
    <tr>
      <td><!-- Import menu page here -->	</td>
    </tr>
    <tr>
      <td><table width="1000" border="0" cellpadding="0" cellspacing="0" background="image/contactus.jpg">
          <tr background="image/clean_blur_hd_background_by_speetix-d5zpor8.jpg">
            <td height="558" valign="top"><div align="left">
              <form action="" method="post" name="form" id="form" onSubmit="return validate()">
                <p align="center">&nbsp;</p>
                <p align="center"><span class="style15">Track Records E-Organizer</span></p>
                <table width="500" border="0" align="center" cellpadding="10" cellspacing="0" bgcolor="">
                  <tr>
                    <td><span class="style11">Player ID </span></td>
                    <td><input name="pid" type="text" id="pid" readonly="true" value="<%= pid %>"></td>
                  </tr>
                  <tr>
                    <td><div align="left"><span class="style11">Player Full Name </span></div></td>
                    <td><input name="playername" type="text" id="playername"></td>
                  </tr>
                  <tr>
                    <td><div align="left"><span class="style11">College Name</span></div></td>
                    <td><input name="collegename" type="text" id="collegename"></td>
                  </tr>
                  <tr>
                    <td><div align="left"><span class="style11">Class</span></div></td>
                    <td><input name="pclass" type="text" id="pclass"></td>
                  </tr>
                  <tr>
                    <td><div align="left"><span class="style11">Roll No</span></div></td>
                    <td><input name="rollno" type="text" id="rollno"></td>
                  </tr>
                  <tr>
                    <td><div align="left"><span class="style11">Gender</span></div></td>
                    <td><span class="style11">
                      <select name="gender" id="gender">
                        <option value="-1">Select Gender</option>
                        <option value="M">Male</option>
                        <option value="F">Female</option>
                      </select>
                    </span></td>
                  </tr>
                  <tr>
                    <td><div align="left"><span class="style11">User Name</span></div></td>
                    <td><input name="username" type="text" id="username"></td>
                  </tr>
                  <tr>
                    <td><div align="left"><span class="style11">Password</span></div></td>
                    <td><input name="password" type="password" id="password"></td>
                  </tr>
                  <tr>
                    <td><div align="left"><span class="style11">Email</span></div></td>
                    <td><input name="email" type="text" id="email"></td>
                  </tr>
                  <tr>
                    <td><span class="style16"><strong>Mobile No </strong></span></td>
                    <td><input name="phno" type="text" id="phno"></td>
                  </tr>
                  <tr>
                    <td><div align="left"></div></td>
                    <td><span class="style12">
                      <input type="submit" name="Submit" value="Submit">
                    </span></td>
                  </tr>
                  <tr>
                    <td><span class="style16"><a href="login.jsp">Back</a></span></td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td><div align="center" class="style12">
                    </div></td>
                    <td><div align="center" class="style12">
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
	String playername="",collegename="",pclass="",rollno="",gender="",username="",password="",email="";
	String pid1=request.getParameter("pid");
	//getting parameters from html controls
	playername=request.getParameter("playername");
	collegename=request.getParameter("collegename");
	pclass=request.getParameter("pclass");
	rollno=request.getParameter("rollno");
	gender=request.getParameter("gender");
	username=request.getParameter("username");
	password=request.getParameter("password");
	email=request.getParameter("email");
	
	try
	{
		//create a statement
		Statement st=con.createStatement();
		//Execute the sql statement and store the result in the result state
		ResultSet rs=st.executeQuery("Select * from tm_player where pid='"+pid1+"' and playername='"+playername+"' and rollno='"+rollno+"'");
		
		while(rs.next())
		{
			
			exist=true;
			break;
		}//while
		
		if(exist )
		{
			out.println("<script>alert('player already exists')</script>");
		}
		else 
		{
			st.executeUpdate("Insert into tm_player(pid,playername,collegename,pclass,rollno,gender,username)values('"+pid1+"','"+playername+"','"+collegename+"','"+pclass+"','"+rollno+"','"+gender+"','"+username+"')");
			st.executeUpdate("Insert into tm_login(uname,pass,utype,email)values('"+username+"','"+password+"','player','"+email+"')");

			out.println("<script>alert('player Added Successfully')</script>");
			//declare the variables
	String uname,myemail="",mypass=""; //variables to store email and pass
	boolean exist1=false; //flag variable
	
	//accept the email from the user form
	 //from the email textbox
	
	
	  
	  		String mymsg="You have Registered Successfully. Your username is :"+username+", your password is : "+ password+" and playerid is "+pid1+"" ;
	  		try
			{
				String host="", user="", pass="";
				boolean WasEmailSent=false; 
				host = "smtp.gmail.com"; 
				user = "demomail2009@gmail.com"; 
				pass = "apache538"; 
				String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
				String to = email; // out going email id
				String from = "demomail2009@gmail.com"; //Email id of the recipient
				String subject = "Player Information"; //set the subject of the email
				String messageText = mymsg; //set the matter of the email
				boolean sessionDebug = true;
				Properties props = System.getProperties();
				props.put("mail.host", host);
				props.put("mail.transport.protocol.", "smtp");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.", "true");
				props.put("mail.smtp.port", "465");
				props.put("mail.smtp.socketFactory.fallback", "false");
				props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
				Session mailSession = Session.getDefaultInstance(props, null);
				mailSession.setDebug(sessionDebug);
				Message msg = new MimeMessage(mailSession);
				msg.setFrom(new InternetAddress(from));
				//sends the email to multiple email addresses
				InternetAddress[] address = InternetAddress.parse(to);
				
				//send attachment
				/*String filename = filename1; //give your file name
				DataSource source = new FileDataSource(filename);
				msg.setDataHandler(new DataHandler(source));
				msg.setFileName(filename);*/
									
				msg.setRecipients(Message.RecipientType.TO, address);
				msg.setSubject(subject);
				msg.setContent(messageText, "text/html"); // use setText if you want to send text
				Transport transport = mailSession.getTransport("smtp");
				transport.connect(host, user, pass);
				try 
				{
					transport.sendMessage(msg, msg.getAllRecipients());
					WasEmailSent = true; // assume it was sent
				}
				catch (Exception err) 
				{
					WasEmailSent = false; // assume it's a fail
				}
				transport.close();
				if(WasEmailSent)
					out.println("<script language='javascript'>  alert('Your password has been sent to your Email "+to+" ')</script>");
									
			}	
			catch(Exception e)
			{
				out.println(e);
			}
	  }
		
	}//try
	catch(Exception ex)
	{
		out.println("Error : "+ex);
	}
	
}
 %>

