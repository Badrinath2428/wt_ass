<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
	<meta charset="utf-8">
	<title>Home</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body>
	<%
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		if(session.getAttribute("username")==null){
			response.sendRedirect("seekerLogin.jsp");
		}
	%>
	<nav class="nav justify-content-end">
		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link" href="home.jsp">Home</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="apply.jsp">Apply Job</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">Profile</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">Contact Us</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="seekerlogout.jsp">Logout</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">${username}</a>
		  </li>
		</ul>
	</nav>
	<div class="container">
		<div>
			<center><h3 class="my-5" style = "font-family:courier,arial,ComicSans;font-size: 30px;">Earn By Doing Part time jobs</h3></center>
			<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner mb-5">
    <div class="carousel-item active">
      <img class="d-block w-100" height=500px width=50px src="./media/servis2.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="./media/servis2.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="./media/servis3.jpg" alt="Third slide">
    </div>
  </div>
</div>
		</div>
		<div>
			<center><h3 style = "font-family:courier,arial,ComicSans;font-size: 30px;">About</h3></center>
  			<br>
  			<p style = "font-family:courier,arial,Courier New;font-size: 20px;">You can earn money by doing domestic jobs for short period of time . You can do jobs like car driving , load -lifting , waiter , data -entry etc..</p>
  			<br>
		</div>
	</div>
	<script>
		$('.carousel').carousel({
		  interval: 2000
		})
	</script>
</body>
</html>