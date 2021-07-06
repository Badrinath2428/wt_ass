<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP >=1.1
		/* if(session.getAttribute("username")==null){
			response.sendRedirect("login.jsp");
		} */
	%>
	
	<%
		String submit=request.getParameter("sel");
		String name=request.getParameter("u_name");
		String pass=request.getParameter("u_pass");
		String mail=request.getParameter("u_email");
		String add=request.getParameter("u_add");
		String phone=request.getParameter("u_phone");
		try
		{
			/* <sql:setDataSource var="db" url="jdbc:postgresql://localhost:5432/wt_ass"
					driver="org.postgresql.Driver"  user="postgres" password="Badri2428"/> */
			Class.forName("org.postgresql.Driver");
			Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/wt_ass", "postgres", "Badri2428");
			Statement st=conn.createStatement();
			if(submit.equals("Prospect")){
				int i=st.executeUpdate("insert into prospect(u_name,u_pass,u_mail,u_add,u_phone)values('"+name+"','"+pass+"','"+mail+"','"+add+"','"+phone+"')");
			}
			else{
				int j=st.executeUpdate("insert into professional(p_name,p_pass,p_mail,p_phone)values('"+name+"','"+pass+"','"+mail+"','"+phone+"')");
			}
			//out.println("Data is successfully inserted!");
			st.executeUpdate("commit");
			out.print("<script type=\"text/javascript\">alert(\"Registration Successful !!\");</script>");
			response.sendRedirect("professional_login.html");
		}
		catch(Exception e)
		{
			System.out.print(e);
			e.printStackTrace();
		}
	%>
</body>
</html>