<%@page import="org.hibernate.*, beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
</head>
<body>
<%
	String id=request.getParameter("id");
	String pass=request.getParameter("password");
	
	String name=new String();
	String passwd=new String();
	SessionFactory factory=HibernateUtil.getSessionFactory();
	Session ses=factory.getCurrentSession();
	ses.beginTransaction();
	
	if(id.startsWith("A"))
	{
		Admin ad=(Admin)ses.get(Admin.class, id);
		if(ad==null)
		{
			%><div class="alert alert-danger alert-dismissible">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>User doesn't exist..!!</strong> 
	  		</div><jsp:include page="index.html"/>
	  		<%
		}
		else
		{
			passwd=ad.getPassword();
			name=ad.getName();
		}
	}
	else if(id.startsWith("F"))
	{
		Faculty fac=(Faculty)ses.get(Faculty.class, id);
		if(fac==null || fac.getActive().equals("false"))
		{
			%><div class="alert alert-danger alert-dismissible">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>User doesn't exist..!!</strong> 
	  		</div><jsp:include page="index.html"/>
	  		<%
		}
		else
		{
			passwd=fac.getPassword();
			name=fac.getName();
		}
	}
	else if(id.startsWith("S"))
	{
		Scholar sch=(Scholar)ses.get(Scholar.class, id);
		if(sch==null || sch.getActive().equals("false"))
		{
			%><div class="alert alert-danger alert-dismissible">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>User doesn't exist..!!</strong> 
	  		</div><jsp:include page="index.html"/>
	  		<%
		}
		else
		{
			passwd=sch.getPassword();
			name=sch.getName();
		}
	}
	else
	{
		%><div class="alert alert-danger alert-dismissible">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>Invalid user id..!!</strong> 
	  	</div><jsp:include page="index.html"/>
	  <%
	}
	ses.getTransaction().commit();
	if(passwd.equals(pass))
	{
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		if(id.startsWith("A"))
		{
			%><div class="alert alert-success alert-dismissible">
  			<button type="button" class="close" data-dismiss="alert">&times;</button>
  			<strong>You have successfully logged in..!!</strong> 
		  </div><jsp:include page="adminHead.html"/><%		
		}
		else
		{
			%><div class="alert alert-success alert-dismissible">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>You have successfully logged in..!!</strong> 
	  		</div><jsp:include page="dash.jsp"/><%
		}	
	}
	else
	{
		%><div class="alert alert-danger alert-dismissible">
  			<button type="button" class="close" data-dismiss="alert">&times;</button>
  			<strong>Invalid password..!!</strong> 
		  </div><jsp:include page="index.html"/>
		  <%
	}
%>
</body>
</html>