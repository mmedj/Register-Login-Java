<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="css/main.css">
      <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css" 
         rel="stylesheet"  type='text/css'>
      <title>IAGI-Travel</title>
      <style>
      a {
      height:30px }
      </style>
   </head>
   <body>
      <header>
         <div class="navbar nav" id="nav-container">
            <h1 style="color:white;margin-left: 25px;" id="name">IAGI-Travel <span style="color:orange;font-size:25px;">.</span></h1>
            <input type="checkbox" id="burger2">
            <label for="burger2" class="menu">
               <div  class="burger">
                  <div class="line1"></div>
                  <div class="line2"></div>
                  <div class="line3"></div>
               </div>
            </label>
            <div id="link" class="navbar">
               <a href="#accueil" class="link">Acceuil</a>
               <a href="#destination" class="link">Destinations</a>
               <a href="#circuits" class="link">Circuits</a>
               <a href="#contact" class="link"> <i class="fa fa-envelope"></i> Contact</a>
               <c:if test="${not empty sessionScope.loggedInUser}">
        <!-- Session attribute is set, display the button -->
                <a class="link py-3 px-0 px-lg-3 rounded"><%= session.getAttribute("loggedInUser") %></a>
                <a
						 href="LoginServlet?logout=true"><form action="LoginServlet" method="post">
    <input type="hidden" name="logout" value="true">
    <button type="submit" class=" round">Logout</button>
</form>
</a>
</c:if>
               <c:if test="${ empty sessionScope.loggedInUser}">
               <a href="login.jsp" class="link round">Login</a>
               <a href="registration.jsp" class="link round">Register</a>
               
               </c:if>
            </div>
         </div>
      </header>
</body>
</html>
