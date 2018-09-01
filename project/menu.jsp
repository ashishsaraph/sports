<div id='cssmenu'>
<ul>
   <li><a href='home.jsp'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Home &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a></li>
   <li><a href='register.jsp'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Apply &nbsp&nbsp&nbsp&nbsp</a></li>
   <li><a href='scores.jsp'> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Scores &nbsp&nbsp&nbsp</a></li>
   <li><a href='settings.jsp'> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Settings &nbsp&nbsp&nbsp&nbsp</a></li>
   <li><a href='login.jsp'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Log Out &nbsp&nbsp&nbsp</a></li>
</ul>
</div>
<div align="center"><%= "Welcome "+ session.getAttribute("fullname")+" (Your  Player Id is:"+ session.getAttribute("pid")+" )"  %></div>
