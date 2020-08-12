<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*,beans.*,daoimpl.* ,java.util.* ,org.hibernate.Session,org.hibernate.SessionFactory,org.hibernate.Transaction" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>StudyGeek - Query</title>
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
<%

		//SessionFactory object
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		//getting current session
		Session ses = sessionFactory.getCurrentSession();
		//beginning transaction
		Transaction tx=ses.beginTransaction();
		

		CommonDAOImpl cd=new CommonDAOImpl();

		List<Query> queryList = cd.displayQuery();

	String id=(String)session.getAttribute("id"); %>
<nav class="navbar navbar-expand-xs navbar-light mx-0" style="background-color: #ffff80;">
      <div class="container">
        <img alt="LOGO" src="admin/logo.jpg" width="50px" height="50px">  <a class="navbar-brand disabled">StudyGeek</a>
        <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="navbar-collapse collapse" id="navbarsExample07" style="color:black;">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link" href="dash.jsp">Dashboard<span class="sr-only">(current)</span></a>
            </li>
            <%
            	if(id.startsWith("S"))
            	{
            		%>
            		<li class="nav-item dropdown active">
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
            		%><li class="nav-item active">
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
    </nav>
    <table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Queries</th>
      <th scope="col">Query Description</th>
      <th scope="col">Answers</th>
	  <th scope="col">Answer Description</th>
    </tr>
  </thead>
  <tbody>
  <%for(Query query:queryList)
{

	//query to search answers
			org.hibernate.Query q = ses.createQuery("from Answers where query_id=:id");//named parameter
			q.setInteger("id",query.getQueryId());
			//executing the query
			Answers answer = (Answers) q.uniqueResult();
	%><tr><form action="queryAnswerForm.jsp"><input type="hidden" name="qid" value="<%=query.getQueryId()%>">
      <td><%=query.getQueryId()%> </td>
<td><%=query.getDescription() %></td>
<td>Topic: <%=query.getTopic() %> <br> Uploaded by : <%=query.getScholar().getName() %><br> Uploaded Time: <%=query.getUploadTime() %></td>

<% if(answer==null)
	{ 
		if(id.startsWith("F"))
		{
			%><td><input type="submit" class="btn btn-primary btn-sm active" value="Answer Query"></td>
		<%}else
			{
				continue;
			}
	}
	else
	{ 
	%>

<td><%=answer.getAnswer() %></td>
<td>Topic: <%=answer.getQuery().getTopic() %> <br> Uploaded by : <%=answer.getFaculty().getName() %><br> Uploaded Time: <%=answer.getUploadTime() %></td>
</form></tr><%}}%>
  </tbody>
</table>
</body>
</html>