<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*,beans.* ,java.util.* ,org.hibernate.Session,org.hibernate.SessionFactory,org.hibernate.Transaction,org.hibernate.Query" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>StudyGeek - Video</title>
</head>
<body>
<%

int id=Integer.parseInt(request.getParameter("id"));

	//SessionFactory object
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		//getting current session
		Session ses = sessionFactory.getCurrentSession();
		//beginning transaction
		Transaction tx=ses.beginTransaction();
		//query to search video path
		Query query = ses.createQuery("from Videos where id= :id");//named parameter
		//setting topic to the query
		query.setInteger("id",id); 
		//executing the query
		Videos v = (Videos) query.uniqueResult();
		String path=v.getFile();
		System.out.print(path);
		//commiting the transaction
		tx.commit();
%>

<video width="400" height="400" controls autoplay>

<source src="<%=path %>" type="video/mp4">

</video>
</body>
</html>