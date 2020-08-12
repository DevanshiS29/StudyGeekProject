<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>StudyGeek - Dashboard</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<%	String id=(String)session.getAttribute("id"); %>
<nav class="navbar navbar-expand-xs navbar-light mx-0" style="background-color: #ffff80;">
      <div class="container">
        <img alt="LOGO" src="admin/logo.jpg" width="50px" height="50px">  <a class="navbar-brand disabled">StudyGeek</a>
        <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="navbar-collapse collapse" id="navbarsExample07" style="color:black;">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="dash.jsp">Dashboard<span class="sr-only">(current)</span></a>
            </li>
            <%
            	if(id.startsWith("S"))
            	{
            		%>
            		<li class="nav-item dropdown">
              			<a class="nav-link dropdown-toggle" id="dropdown07" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Query</a>
              			<div class="dropdown-menu" aria-labelledby="dropdown07">
                			<a class="dropdown-item" href="viewQuery.jsp">Queries and Answers</a>
		          			<a class="dropdown-item" href="createQuery.jsp">Create Query</a>
              			</div>
		            </li>
            		<li class="nav-item">
			           <a class="nav-link" href="viewAnnouncement.jsp">View Announcements</a>
			        </li>
            
            		<%
            	}
            	else if(id.startsWith("F"))
            	{
            		%><li class="nav-item">
		              	<a class="nav-link" href="viewQuery.jsp">Queries and Answers</a>
		              </li>
			          <li class="nav-item dropdown">
		              <a class="nav-link dropdown-toggle" id="dropdown07" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Announcement</a>
		              <div class="dropdown-menu" aria-labelledby="dropdown07">
		                <a class="dropdown-item" href="viewAnnouncement.jsp">View Announcements</a>
		          		<a class="dropdown-item" href="createAnnouncement.jsp">Create Announcement</a>
		              </div>
            		  </li>
            		<%
            	}
            	
            %>
            
            <li class="nav-item">
              <a class="nav-link" href="./Study Geek-Video/index.html">Video Conferencing</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="about.jsp">About</a>
            </li>
          <li>
            <a class="nav-link dropdown-toggle inline my-2 my-lg-0" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Profile</a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="profile.jsp">View profile</a>
          <a class="dropdown-item" href="logout.jsp">Logout</a>
          </div>
          </li>
          </ul>
        </div>
      </div>
    </nav><br><br><br>
    <div class="row" style="margin-left:100px">
    <div class="col-sm-6">
      <div class="card-deck" style="width:18rem;">
  <img class="card-img-top" src="admin\video.png" alt="Video icon">
    <div class="card-body">
    <h5 class="card-title">Videos</h5>
	<p class="card-text">Some videos provided by your faculty to explore and learn more.</p>
      <a href="videoShow.jsp" class="btn btn-primary">Watch now</a>
    </div>
    </div>
    </div>
    <div class="col-sm-6">
     <div class="card-deck" style="width:18rem;">
  <img class="card-img-top" src="admin\notes.png" alt="Notes icon">
    <div class="card-body">
    <h5 class="card-title">Notes</h5>
	<p class="card-text">Some notes provided by your faculty to explore and learn more.</p>
      <a href="notesShow.jsp" class="btn btn-primary">Read now</a>
    </div>
    </div>
    </div>
  </div>
</body>
</html>