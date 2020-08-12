<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="org.apache.commons.fileupload.disk.*,java.util.*,org.apache.commons.fileupload.*,org.apache.commons.fileupload.servlet.*,org.apache.commons.io.FileUtils,daoimpl.*,java.io.*,beans.*,java.util.Date,java.text.SimpleDateFormat ,java.time.format.DateTimeFormatter,java.time.LocalDateTime, org.hibernate.Session,org.hibernate.SessionFactory,org.hibernate.Transaction" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<%

File file = null ;
int maxFileSize = 5000 * 1024;
int maxMemSize = 5000 * 1024;
ServletContext context = pageContext.getServletContext();
String filePath = context.getInitParameter("notes-upload");
String fileName="";

// Verify the content type
String contentType = request.getContentType();

if ((contentType.indexOf("multipart/form-data") >= 0)) 
{
   DiskFileItemFactory factory = new DiskFileItemFactory();
   // maximum size that will be stored in memory
   factory.setSizeThreshold(maxMemSize);
   
   // Location to save data that is larger than maxMemSize.
   factory.setRepository(new File("c:\\temp"));

   // Create a new file upload handler
   ServletFileUpload upload = new ServletFileUpload(factory);
   
   // maximum file size to be uploaded.
   upload.setSizeMax( maxFileSize );
   
   try { 
      // Parse the request to get file items.
      List fileItems = upload.parseRequest(request);

      // Process the uploaded file items
      Iterator i = fileItems.iterator();

      while ( i.hasNext () ) 
      {
         FileItem fi = (FileItem)i.next();
         if ( !fi.isFormField () ) 
         {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            fileName = fi.getName();
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
         
            // Write the file
            if( fileName.lastIndexOf("\\") >= 0 ) 
            {
               file = new File( filePath + 
               fileName.substring( fileName.lastIndexOf("\\"))) ;
            } else 
            {
               file = new File( filePath + 
               fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }
            fi.write( file ) ;
            
         }
      }
   } catch(Exception ex) {
      System.out.println(ex);
      
   }
	}
else {
	%><div class="alert alert-danger alert-dismissible">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>Error while uploading the notes..!!</strong> 
			</div><jsp:include page="notesShow.jsp"/><%
}
		/*DiskFileItemFactory fileFactory = new DiskFileItemFactory();
		File filesDir = (File) getServletContext().getAttribute("FILES_DIR_FILE");
		fileFactory.setRepository(filesDir);
		ServletFileUpload uploader = new ServletFileUpload(fileFactory);*/
		DateTimeFormatter uploadTime=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		
		LocalDateTime currentTime=LocalDateTime.now();
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); 
		
		Date notesTime=sdf.parse(uploadTime.format(currentTime));
		
		//String path=request.getParameter("notes");
		String topic=file.getName();
		/*String extension="";
		
		try{
		
		int i=path.lastIndexOf('.');
		if(i>0)
		{
			extension=path.substring(i);
		}
		File file1=new File(path);
		String originalPath="C:\\StudyGeek\\notes"+"\\"+topic+extension;
		File file2=new File(originalPath);
		FileUtils.copyFile(file1, file2);*/
		
		/*if(!ServletFileUpload.isMultipartContent(request))
		{
			
		}
		else
		{
			try 
			{
				List<FileItem> fileItemsList = uploader.parseRequest(request);
				Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
				while(fileItemsIterator.hasNext())
				{
					FileItem fileItem = fileItemsIterator.next();
					System.out.println("FieldName="+fileItem.getFieldName());
					System.out.println("FileName="+fileItem.getName());
					System.out.println("ContentType="+fileItem.getContentType());
					System.out.println("Size in bytes="+fileItem.getSize());
					
					File file = new File(request.getServletContext().getAttribute("FILES_DIR")+File.separator+fileItem.getName());
					path=file.getAbsolutePath();
					System.out.println("Absolute Path at server="+path);
					fileItem.write(file);
					
					break;
				}*/

					//SessionFactory object
					SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
					//getting current session
					Session ses = sessionFactory.getCurrentSession();
					//beginning transaction
					Transaction tx=ses.beginTransaction();
					//saving an employee object
					String id=(String)session.getAttribute("id");
					Faculty f=(Faculty)ses.get(Faculty.class,id);
					
					Notes notes=new Notes(f.getName(),topic,file.getAbsolutePath(),notesTime,f);
					
					new FacultyDAOImpl().insertNotes(notes);		
					%><jsp:forward page="notesShow.jsp"/><%
		
			/*catch(Exception e)
			{
				e.printStackTrace();
			}*/
		
%>
</body>
</html>