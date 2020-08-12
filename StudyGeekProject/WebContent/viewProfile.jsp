<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,org.hibernate.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>StudyGeek - User Profile</title>
</head>
<body>
<%
		//SessionFactory object
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		//getting current session
		Session ses = sessionFactory.getCurrentSession();
		//beginning transaction
		Transaction tx=ses.beginTransaction();
		
			%><nav class="navbar navbar-expand-xs navbar-light mx-0" style="background-color: #ffff80;">
      <div class="container">
        <img alt="LOGO" src="admin/logo.jpg" width="50px" height="50px">  <a class="navbar-brand disabled">StudyGeek</a>
        <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="navbar-collapse collapse" id="navbarsExample07" style="color:black;">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link" href="adminHead.html">Dashboard<span class="sr-only">(current)</span></a>
            </li>
          <li>
            <a class="nav-link dropdown-toggle inline my-2 my-lg-0" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Profile
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item active" href="profile.jsp">View profile</a>
          <a class="dropdown-item" href="logout.jsp">Logout</a>
          </div>
          </li>
          </ul>
        </div>
      </div>
    </nav><br><br><br>
<%
	String uid=request.getParameter("uid");
	String name=new String();
	String mail=new String();
	long contact=0;
	String course=new String();
	String dp=new String();
	String gender=new String();
	if(uid.startsWith("F"))
	{
		Faculty fac=(Faculty)ses.get(Faculty.class, uid);
		name=fac.getName();
		contact=fac.getContact();
		course=fac.getCourse();
		dp=fac.getDp();
		gender=fac.getGender();
		mail=fac.getMail();
		
	}
	else if(uid.startsWith("S"))
	{
		Scholar sch=(Scholar)ses.get(Scholar.class, uid);
		name=sch.getName();
		contact=sch.getContact();
		course=sch.getCourse();
		dp=sch.getDp();
		gender=sch.getGender();
		mail=sch.getMail();
		
	}
	tx.commit();
	%>
	<div class="row" style="margin-left:100px">
	<div class="col-sm-6">
	<div class="card-deck" style="width:18rem;">
	<img class="card-img-top" src="<%=dp %>" alt="<%=name %>'s Display Picture">
	<div class="card-body">
	<h1><%=name %></h1>
	<h5 class="card-title"><%=uid %></h5>
	<p class="card-text"><p><%=gender %></p>
	<p><%=mail %></p>
	<p><%=contact %></p>
	<p><%=course %></p>
	</div>
	</div>
	</div></div>
</body>
</html>