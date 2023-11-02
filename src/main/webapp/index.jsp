<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    

<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="css/main.css">
      <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css" 
         rel="stylesheet"  type='text/css'>
      <title>IAGI-Travel</title>
   </head>
   <body>
      <%@ include file="header.jsp" %>
      <!--Barre de navigation-->
      <div class="avion">
         <img  src="images/avion.png" alt="">
      </div>
      <!--Accueil-->
      <section id="accueil" class="Home" >
         <h1>Discover our Great Deals.</h1>
         <c:if test="${ empty sessionScope.loggedInUser}">
               <p>Discover Exclusive Travel Deals on Our Website. Login to join our newsletter</p>
         <div style="display:flex">
         <span class="conseiller">Login</span>
         <span class="conseiller">Register</span>
         </div>
               
               </c:if>
                              <c:if test="${not empty sessionScope.loggedInUser}">
        <!-- Session attribute is set, display the button -->
                <p>Welcome <%= session.getAttribute("userName") %>, we'll contact you at <%= session.getAttribute("loggedInUser") %> to keep you updated . </p>
                <span class="conseiller">Contact Us</span>
</c:if>
         
      </section>
      <div class="container">
         <!--Destinations-->
         <div class="slide-container " id="destination">
            <img class="slide-img" src="images/slide0.jpg">
               <div class="slide-text">
                  <h3> Amesbury </h3>
                  <p> stonehenge </p>
                  <div class="slide-dot">
                     <span class="dot" ></span>
                     <span class="dot active" ></span>
                     <span class="dot" ></span>
                     <span class="dot" ></span>
                     <span class="dot" ></span>
                  </div>
               </div>
         </div>
         <!--Circuits-->
         <section id="circuits">
            <div class="box-wrapper">
               <div class="box">
                  <img src="images/c1.png" alt="">
                  <h3>Planifier</h3>
                  <p>Confiez-nous vos reves d'évasion: en famille ou entre amis.nous trouverons la famille qui comblera vos attentes.</p>
               </div>
               <div class="box">
                  <img src="images/c2.png" alt="">
                  <h3>Organiser</h3>
                  <p>Bénéficiez de l'expertise de nos spécialistes de chaque destination, ils vous accompagnent dans la réalisation de votre voyage.</p>
               </div>
               <div class="box">
                  <img src="images/c3.png" alt="">
                  <h3>Voyager</h3>
                  <p>Nous nous chargeons d'assurer votre sécurité et de veiller à votre pleine sévérité tout au long de votre voyage. </p>
               </div>
            </div>
            <div class="box-wrapper2">
               <div class="box2">
                  <div>
                     <h3>Parter En Famille</h3>
                     <div class="line"></div>
                     <p>Offrir le meilleur a ceux que lorem ipsum ozjoe reffreni erjhez eijifier zdkjd orahfiar denirhp</p>
                  </div>
                  <img src="images/a1.jpg" alt="">
               </div>
               <div class="box2">
                  <div >
                     <h3>Envie de s'evader</h3>
                     <div class="line"></div>
                     <p>Parfois un peu d'évasion serait le bienvenue et ferait le plus grand bien !</p>
                  </div>
                  <img src="images/a2.jpg" alt="">
               </div>
            </div>
         </section>
         <!--Contact-->
         <section id="contact">
            <h1>Contacter-nous</h1>
            <div class="line"></div>
            <p>Chez IAGI-Travel nous savons que voyager est une aventure humaine mais -------------------------------------------------------------------------------------------------
               ---------------------------------------------------------------------.   
            </p>
            <form class="form">
               <label for="">Votre Nom: </label>
               <input type="text" placeholder="Entrez votre nom">
               <label >Votre Email: </label> 
               <input type="text"  placeholder="Entrez votre email">
               <input id="submit" type="submit" value="Submit">
            </form>
         </section>
      </div>
      <!--footer-->
      <footer class="text-center">
         <h1 >IAGI-Travel <font color="orange" > .</font></h1>
         <p>Copyright IAGI 2O23</p>
      </footer>
   </body>
</html>

