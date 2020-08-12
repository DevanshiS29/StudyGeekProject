<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="daoimpl.*,java.util.Date, beans.*,java.text.SimpleDateFormat ,java.time.format.DateTimeFormatter,java.time.LocalDateTime  , org.hibernate.Session,org.hibernate.SessionFactory,org.hibernate.Transaction" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>StudyGeek - Answer</title>
</head>
<body>
<%

String desc=request.getParameter("answer");

DateTimeFormatter uploadTime=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");

LocalDateTime currentTime=LocalDateTime.now();

SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); 

Date answerTime=sdf.parse(uploadTime.format(currentTime));

//SessionFactory object
SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
//getting current session
Session ses = sessionFactory.getCurrentSession();
//beginning transaction
Transaction tx=ses.beginTransaction();

String id=(String)session.getAttribute("id");

Faculty fac=(Faculty)ses.get(Faculty.class, id);

String qid=(String)session.getAttribute("qid");
int queryId=Integer.parseInt(qid);

Query q=(Query)ses.get(Query.class,queryId);

Answers ans=new Answers(desc,answerTime,fac,q);
new FacultyDAOImpl().insertQueryAnswer(ans);
tx.commit();
		
%>
<div class="alert alert-success alert-dismissible">
<button type="button" class="close" data-dismiss="alert">&times;</button>
<strong>Query answered successfully..!!</strong> 
	</div><jsp:include page="viewQuery.jsp"/>
</body>
</html>