<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>StudyGeek - Announcement</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<%
	String id=(String)session.getAttribute("id");
	if(id.startsWith("F"))
	{
		%>
		<form class="text-center border border-light p-5" action="createAnn.jsp" name="form" method="post" onSubmit="return validate();">

    <p class="h4 mb-4">Announcement Form</p>

    <input type="text" spellcheck="true" name="title" class="form-control mb-4" placeholder="Title" maxlength="20">

    <textarea name="description" id="textarea" spellcheck="true" class="form-control mb-4" placeholder="Description.." rows=10 cols=50 maxlength="4000"></textarea>
    <span style="float:right" class="badge badge-dark" id="count"></span>
	<script>
			var textarea = document.getElementById("textarea");
			var length = textarea.getAttribute("maxlength");
			var count = document.getElementById("count");
			count.innerHTML = length;
			textarea.onkeyup = function () {
			  document.getElementById("count").innerHTML = this.value.length+"/"+length;
			};
			</script><br>
    <!-- Send button -->
    <button class="btn btn-info btn-block" type="submit">Create Announcement</button>
	</form>
	<script type="text/javascript">
	        function preventBack() { window.history.forward(); }
	        setTimeout("preventBack()", 0);
	        window.onunload = function () { null };
	</script>
	<script>
		function validate()
		{
			if (document.form.topic.value=="" || document.form.description.value==null || document.form.description.value=="" || document.form.topic.value==null)
			{
				alert("Please ensure that no field is left empty..!!");
				return false;
			}
			return true;
		}
	</script><%
	}
	else
	{
		%><div class="alert alert-danger alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<strong>You are not authorized to perform this action..!!</strong> 
  		</div><jsp:include page="dash.jsp"/>
  		<%
	}
%>
</head>
<body>

</body>
</html>