<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*, org.hibernate.*, org.hibernate.Query" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>StudyGeek - Profile</title>
</head>
<body>
<%
		//SessionFactory object
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		//getting current session
		Session ses = sessionFactory.getCurrentSession();
		//beginning transaction
		Transaction tx=ses.beginTransaction();

		String id=(String)session.getAttribute("id");
		
		String path=request.getParameter("dp");
		if(path==null || path.equals(""))
		{
			path="admin/avatar.png";
		}
		if(id.startsWith("A"))
		{
			Admin ad=(Admin)ses.get(Admin.class, id);
			ad.setDp(path);
		}
		
		else if(id.startsWith("F"))
		{
			Faculty fac=(Faculty)ses.get(Faculty.class, id);
			fac.setDp(path);
		}
		
		else
		{
			Scholar sch=(Scholar)ses.get(Scholar.class, id);
			sch.setDp(path);
		}
		tx.commit();
%>		
		<div class="alert alert-success alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<strong>Your profile picture has been changed successfully..!!</strong> 
		</div><jsp:include page="profile.jsp"/>
</body>
</html>