

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    String logout = request.getParameter("logout");
	    DbUser db=new DbUser();
	    RequestDispatcher dispatcher=null;

	    if (logout != null && logout.equals("true")) {
	        // Logout action
	        HttpSession session = request.getSession(false);
	        if (session != null) {
	            session.invalidate(); // Close the session
	        }
	        response.sendRedirect("index.jsp"); // Redirect to the index page after logout
	        
	    } else if (db.login(email, password)) {
	        // Successful login, create a session
	        HttpSession session = request.getSession();
           
	        // Fetch user data from the database and store it in the session
	        try (Connection conn = db.getConnection()) {
	            String sql = "SELECT Name FROM user WHERE Email = ?";
	            try (PreparedStatement ps = conn.prepareStatement(sql)) {
	                ps.setString(1, email);
	                try (ResultSet rs = ps.executeQuery()) {
	                    if (rs.next()) {
	                        session.setAttribute("loggedInUser", email);
	                        session.setAttribute("userName", rs.getString("Name"));
	                    }
	                }
	            }
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	        }
	        response.sendRedirect("index.jsp");
	    } else {
	        request.setAttribute("status", "fail");
	        dispatcher=request.getRequestDispatcher("login.jsp");
	        dispatcher.forward(request,response);
	    }
	    
	}


}
