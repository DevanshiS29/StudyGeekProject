<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,org.hibernate.*,daoimpl.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>StudyGeek - Change Password</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
</head>
<body>
	<%
	String id=request.getParameter("id");
	String pass=request.getParameter("oldpass");
	String cpass=request.getParameter("newpass");
	
	SessionFactory factory=HibernateUtil.getSessionFactory();
	Session ses=factory.getCurrentSession();
	ses.beginTransaction();
	
	if(id.startsWith("A"))
	{
		if(new AdminDAOImpl().updateAdminPassword(id, pass, cpass))
		{
			%><div class="alert alert-success alert-dismissible">
	  			<button type="button" class="close" data-dismiss="alert">&times;</button>
	  			<strong>You have successfully changed your password..!!</strong> 
			  </div><%	
		}
		else
		{
			%><div class="alert alert-danger alert-dismissible">
	  			<button type="button" class="close" data-dismiss="alert">&times;</button>
	  			<strong>Invalid user id or password..!!</strong> 
			  </div><%
		}
	}
	else if(id.startsWith("F"))
	{
		Faculty fac=(Faculty)ses.get(Faculty.class, id);
		if(fac.getPassword().equals(pass))
		{
			fac.setPassword(cpass);
			%><div class="alert alert-success alert-dismissible">
	  			<button type="button" class="close" data-dismiss="alert">&times;</button>
	  			<strong>You have successfully changed your password..!!</strong> 
			  </div><%	
		}
		else
		{
			%><div class="alert alert-danger alert-dismissible">
	  			<button type="button" class="close" data-dismiss="alert">&times;</button>
	  			<strong>Invalid user id or password..!!</strong> 
			  </div><%
		}
	}
	else
	{
		Scholar sch=(Scholar)ses.get(Scholar.class, id);
		if(sch.getPassword().equals(pass))
		{
			sch.setPassword(cpass);
			%><div class="alert alert-success alert-dismissible">
	  			<button type="button" class="close" data-dismiss="alert">&times;</button>
	  			<strong>You have successfully changed your password..!!</strong> 
			  </div><%	
		}
		else
		{
			%><div class="alert alert-danger alert-dismissible">
	  			<button type="button" class="close" data-dismiss="alert">&times;</button>
	  			<strong>Invalid user id or password..!!</strong> 
			  </div><%
		}
	}
	ses.getTransaction().commit();
%>
<jsp:include page="index.html"/>
<script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
</script>
</body>
</html>