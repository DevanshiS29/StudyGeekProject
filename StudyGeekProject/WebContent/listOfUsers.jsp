<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,daoimpl.*,java.util.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>StudyGeek - Users</title>
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
<nav class="navbar navbar-expand-xs navbar-light mx-0" style="background-color: #ffff80;">
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
          Profile</a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="profile.jsp">View profile</a>
          <a class="dropdown-item" href="logout.jsp">Logout</a>
          </div>
          </li>
          </ul>
        </div>
      </div>
    </nav><br><br><br>
	<%
		AdminDAOImpl adao=new AdminDAOImpl();
		List<Scholar> scholars=adao.displayScholars();
		List<Faculty> faculty=adao.displayFaculty();
	%>
	<table class="table">
  <thead class="thead-dark">
    <tr>
    	<th colspan="4">Faculty</th>
    </tr>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Name</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
  <%
	for(Faculty fac:faculty)
	{%><form action="deleteUser.jsp" method="post"><tr>
      <td><input type="hidden" name="id" value="<%=fac.getFacultyId() %>"><%=fac.getFacultyId() %></td>
      <td><input type="hidden" name="name" value="<%=fac.getName() %>"><%=fac.getName() %></td>
      <td><input type="submit" class="btn btn-primary btn-sm" value="Remove"></td>
      <td><a href="viewProfile.jsp?uid=<%= fac.getFacultyId() %>" class="btn btn-primary btn-sm">View Profile</a></td>
    </tr></form><%}%>
  </tbody>
</table><br><br><br><form action="deleteUser.jsp" method="post">
<table class="table">
  <thead class="thead-dark">
    <tr>
    	<th colspan="4">Scholars</th>
    </tr>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Name</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
  <%
	for(Scholar sch:scholars)
	{%><form action="deleteUser.jsp" method="post"><tr>
      <td><input type="hidden" name="id" value="<%=sch.getScholarId() %>"> <%=sch.getScholarId() %></td>
      <td><input type="hidden" name="name" value="<%=sch.getName() %>"><%=sch.getName() %></td>
      <td><input type="submit" class="btn btn-primary btn-sm" value="Remove"></td>
      <td><a href="viewProfile.jsp?uid=<%= sch.getScholarId() %>" class="btn btn-primary btn-sm">View Profile</a></td>
    </tr></form><%}%>
  </tbody>
</table></form>
<script type="text/javascript">
	        function preventBack() { window.history.forward(); }
	        setTimeout("preventBack()", 0);
	        window.onunload = function () { null };
</script>
</body>
</html>