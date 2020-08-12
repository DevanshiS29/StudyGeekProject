<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,daoimpl.*,org.hibernate.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>StudyGeek - Profile</title>
</head>
<body>
<%
	SessionFactory fac=HibernateUtil.getSessionFactory();
	Session ses=fac.getCurrentSession();
	ses.beginTransaction();
	String id=(String)session.getAttribute("id");
	if(id.startsWith("A"))
	{
		new AdminDAOImpl().deleteAdminDp(id);
		ses.getTransaction().commit();
	}
	else if(id.startsWith("F"))
	{
		new FacultyDAOImpl().deleteFacultyDp(id);
		ses.getTransaction().commit();
	}
	else if(id.startsWith("S"))
	{
		new ScholarDAOImpl().deleteScholarDp(id);
		ses.getTransaction().commit();
	}%>
	<div class="alert alert-success alert-dismissible">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong>Your profile picture has been deleted successfully..!!</strong> 
	</div><jsp:include page="profile.jsp"/>
</body>
</html>