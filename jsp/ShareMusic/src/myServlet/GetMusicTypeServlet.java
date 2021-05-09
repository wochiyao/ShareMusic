package myServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.fasterxml.jackson.databind.ObjectMapper;

import myBean.MusicBean;
import myBean.MusicTypeBean;

/**
 * Servlet implementation class GetMusicTypeServlet
 */
@WebServlet("/GetMusicTypeServlet")
public class GetMusicTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetMusicTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json;charset=utf-8");
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
	        String sql="select * from type ORDER BY id ASC";
	        rs=st.executeQuery(sql);
	        List<MusicTypeBean> list=new ArrayList<>();
	        while(rs.next()) {
	        	MusicTypeBean bean=new MusicTypeBean();
	        	bean.setId(rs.getInt("id"));
	        	bean.setTypeName(rs.getString("typeName"));
	        	list.add(bean);
	        }
	        ObjectMapper om=new ObjectMapper();
			String types=om.writeValueAsString(list);
			out.write(types);
			System.out.print(types);
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
