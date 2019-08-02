<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>download</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String fileUrl = "";
		String path = request.getParameter("path");
		String saveFolder = "/boardUpload/" + path;

		fileUrl = request.getSession().getServletContext().getRealPath(saveFolder);
		System.out.println(fileUrl);

		response.setContentType("application/octet-stream;");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Cache-Control", "no-store, no-cache,must-revalidate");
		response.setHeader("Cache-Control", "post-check=0, pre-check=0");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Content-Disposition", "attachment; filename =\"" + request.getParameter("path") + "\"");
		
		out.clear();
		out = pageContext.pushBody();
		
		java.io.BufferedOutputStream outs 
				= new java.io.BufferedOutputStream(response.getOutputStream());

		byte fileContens[] = new byte[8192];
		int read = 0;
		java.io.BufferedInputStream fin = null;
		try {
			fin = new java.io.BufferedInputStream(new java.io.FileInputStream(fileUrl));

			while ((read = fin.read(fileContens)) != -1) {
				outs.write(fileContens, 0, read);
				outs.flush();
			}
		} catch (Exception e) {
			;
		} finally {
			if (outs != null)
				outs.close();
			if (fin != null)
				fin.close();
		}
	%>
</body>
</html>