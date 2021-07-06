package com.project;
import java.io.IOException;  
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String submit=request.getParameter("sel");
		String pass=request.getParameter("password");
		String mail=request.getParameter("mail");
		
		try{  
			Class.forName("org.postgresql.Driver");  
			Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/wt_ass", "postgres", "Badri2428");
			if(submit.equals("Prospect")){
				PreparedStatement ps=conn.prepareStatement("select u_name from prospect where u_mail=? and u_pass=?");
				ps.setString(1, mail);
				ps.setString(2, pass);
				ResultSet rs=ps.executeQuery();  
				if(rs.next()){
					HttpSession session=request.getSession();
					session.setAttribute("username",rs.getObject(1));
					response.sendRedirect("prospect_home.jsp");
				}else{
				response.sendRedirect("prospect_login.html");
				out.print("<script type=\"text/javascript\">alert(\"Invalid Credentials!!\");</script>");
				}
			}
			else{
				PreparedStatement ps=conn.prepareStatement("select p_name from professional where p_mail=? and p_pass=?");
				ps.setString(1, mail);
				ps.setString(2, pass);
				ResultSet rs=ps.executeQuery();  
				if(rs.next()){
					HttpSession session=request.getSession();
					session.setAttribute("username",rs.getObject(1));
					response.sendRedirect("professional_home.jsp");
				}else{
				response.sendRedirect("professional_login.html");
				out.print("<script type=\"text/javascript\">alert(\"Invalid Credentials !!\");</script>");
				}
				
			}
			
		}
		catch(Exception e){
			System.out.println(e);
		}    
		out.close();  
	}  
}
