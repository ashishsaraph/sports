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
		var uname=document.getElementById("uname");
		if(uname.value.trim().length==0)
		{
			alert("Please enter User Name")
			uname.focus();
			return false;
		}
		
	}
   </script>
</head>

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
                <p align="center">&nbsp;</p>
                <p align="center"><span class="style15">Track Records E-Organizer</span></p>
                <table width="500" border="0" align="center" cellpadding="10" cellspacing="0" bgcolor="">
                  <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td><div align="left"><span class="style11">User Name</span></div></td>
                    <td><input name="uname" type="text" id="uname"></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td colspan="2"><div align="center"><span class="style12">
                      <input type="submit" name="Submit" value="Submit">
                    </span></div></td>
                  </tr>
                  <tr>
                    <td colspan="2"><span class="style16"><a href="login.jsp">Back</a></span></td>
                  </tr>
                  <tr>
                    <td colspan="2"><div align="center" class="style12">
                    </div>                      <div align="center" class="style12">                      </div>                    <div align="center">
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
	//declare the variables
	String uname,myemail="",mypass=""; //variables to store email and pass
	boolean exist=false; //flag variable
	
	//accept the email from the user form
	uname=request.getParameter("uname"); //from the email textbox
	
	try
	{
		//STEP 4: Execute a query
      Statement stmt = con.createStatement();

      String sql = "SELECT * FROM tm_login where uname='"+uname+"'";
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      while(rs.next()){
        
		 mypass=rs.getString("pass");
		  myemail=rs.getString("email");
        exist=true;
      }
	  if(exist)
	  {
	  		String mymsg="You had requested for your password. Your username is :"+uname+" and your password is : "+ mypass;
	  		try
			{
				String host="", user="", pass="";
				boolean WasEmailSent=false; 
				host = "smtp.gmail.com"; 
				user = "demomail2009@gmail.com"; 
				pass = "apache538"; 
				String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
				String to = myemail; // out going email id
				String from = "demomail2009@gmail.com"; //Email id of the recipient
				String subject = "Forgot Password Recovery Message"; //set the subject of the email
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
	  else
	  {
	  		out.println("Invalid Username");
	  }
      rs.close();
	}
	catch(Exception ex)
	{
		out.println("Database query Error:"+ex);
	}			
}
%>



