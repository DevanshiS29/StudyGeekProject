<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*,beans.* ,org.hibernate.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>StudyGeek - Notes</title>
</head>
<body>
<%
		int id=Integer.parseInt(request.getParameter("id"));

		//SessionFactory object
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		//getting current session
		Session ses = sessionFactory.getCurrentSession();
		ses.beginTransaction();
		Notes n=(Notes)ses.get(Notes.class, id);
		String path=n.getFile();
		%>
		<p><iframe style="word-wrap:normal" src="<%=path %>" height="600" width="95%"></iframe></p>
</body>
</html>