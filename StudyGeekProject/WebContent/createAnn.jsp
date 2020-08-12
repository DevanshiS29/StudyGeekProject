<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="daoimpl.*,java.util.Date, beans.*,java.text.SimpleDateFormat ,java.time.format.DateTimeFormatter,java.time.LocalDateTime  , org.hibernate.Session,org.hibernate.SessionFactory,org.hibernate.Transaction"%>
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
<title>StudyGeek - Announcement</title>
</head>
<body>
<%
String title=request.getParameter("title");

String desc=request.getParameter("description");

DateTimeFormatter uploadTime=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");

LocalDateTime currentTime=LocalDateTime.now();

SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); 

Date announcementTime=sdf.parse(uploadTime.format(currentTime));

//SessionFactory object
SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
//getting current session
Session ses = sessionFactory.getCurrentSession();
//beginning transaction
ses.beginTransaction();
//saving an employee object
String id=(String)session.getAttribute("id");
Faculty fac=(Faculty)ses.get(Faculty.class, id);
Announcement ann=new Announcement(title,desc,fac.getName(),announcementTime,fac);
new FacultyDAOImpl().insertAnnouncement(ann);	
%><div class="alert alert-success alert-dismissible">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong>The announcement has been successfully created..!!</strong> 
</div><jsp:include page="viewAnnouncement.jsp"/>
</body>
</html>