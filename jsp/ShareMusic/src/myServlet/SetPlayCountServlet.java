package myServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class SetPlayCountServlet
 */
@WebServlet("/SetPlayCountServlet")
public class SetPlayCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetPlayCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json;charset=utf-8");
		String id=request.getParameter("id");
		try {
			PrintWriter out=response.getWriter();
			Connection con;
		    Statement st;
		    ResultSet rs;
			Context context= new InitialContext();
	        Context  contextNeeded=(Context)context.lookup("java:comp/env");
	        DataSource ds=(DataSource)contextNeeded.lookup("mobileConn");//获得连接池。
	        con = ds.getConnection();//使用连接池中的连接。
	        st=con.createStatement();
	        String sql="select playCount from music where id='"+id+"'";
	        rs=st.executeQuery(sql);
	        int playCount=0;
	        if(rs.next()) {
	        	playCount=rs.getInt("playCount")+1;
	        }
	        sql="update music set playCount='"+playCount+"' where id='"+id+"'";
	        st.executeUpdate(sql);
	        out.flush();
    		out.close();
	        st.close();
	        con.close();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
