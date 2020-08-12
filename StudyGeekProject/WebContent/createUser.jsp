<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,org.hibernate.*,org.hibernate.criterion.*,daoimpl.*,java.util.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>StudyGeek - Users</title>
</head>
<body>
<%
	Session ses=HibernateUtil.getSessionFactory().getCurrentSession();
	ses.beginTransaction();
	int schCount = 0;
	int facCount = 0;
	
	AdminDAOImpl adao=new AdminDAOImpl();
	List<Scholar> scholars=ses.createSQLQuery("select * from Scholar").list();
	List<Faculty> faculty=ses.createSQLQuery("select * from Faculty").list();
    
    if (scholars!=null) 
    {
        schCount=scholars.size();
    }
    
    if (faculty!=null) 
    {
        facCount=faculty.size();
    }
    
	String user=request.getParameter("user");
	String id="";
	String pass="";
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	long contact=Long.parseLong(request.getParameter("contact"));
	String mail=request.getParameter("mail");
	String course=request.getParameter("course");
	
	if(user.equals("Faculty"))
	{
		id="F"+(facCount+1);
		pass=id+"@"+name;
		Faculty fac=new Faculty(id,name,pass,gender,course,mail,contact,"admin/avatar.png");
		new AdminDAOImpl().insertFaculty(fac);
		
		%><div class="alert alert-success alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<strong>One faculty user has been successfully created with the following credentials:-
		<br>User id-<%=id %>
		<br>Password-<%=pass %> </strong> 
  		</div><jsp:include page="listOfUsers.jsp"/>
  <%
	}
	else if(user.equals("Scholar"))
	{
		id="S"+(schCount+1);
		pass=id+"@"+name;
		Scholar sch=new Scholar(id,name,pass,gender,course,mail,contact,"admin/avatar.png");
		new AdminDAOImpl().insertScholar(sch);
		
		%><div class="alert alert-success alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<strong>One scholar user has been successfully created with the following credentials:-
		<br>User id-<%=id %>
		<br>Password-<%=pass %> </strong> 
  		</div><jsp:include page="listOfUsers.jsp"/>
  <%
	}
%>
</body>
</html>