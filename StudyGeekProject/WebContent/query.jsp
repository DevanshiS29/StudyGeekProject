<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date,beans.*,beans.Query,java.text.SimpleDateFormat ,java.time.format.DateTimeFormatter,java.time.LocalDateTime, org.hibernate.*,daoimpl.*" %>  
<!DOCTYPE html>
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
<title>StudyGeek - Query</title>
</head>
<body>
<%
String topic=request.getParameter("topic");

String desc=request.getParameter("description");

DateTimeFormatter uploadTime=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");

LocalDateTime currentTime=LocalDateTime.now();

SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); 

Date queryTime=sdf.parse(uploadTime.format(currentTime));

SessionFactory fac=HibernateUtil.getSessionFactory();
Session ses=fac.getCurrentSession();
ses.beginTransaction();
String id=(String)session.getAttribute("id");
Scholar sch=(Scholar)ses.get(Scholar.class, id);
Query query=new Query(sch.getName(),topic,desc,queryTime,sch);
new ScholarDAOImpl().insertQuery(query);	
ses.getTransaction().commit();
%><div class="alert alert-success alert-dismissible">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong>Your query has been successfully submitted..!!</strong> 
</div><jsp:include page="dash.jsp"/>
</body>
</html>