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

/**
 * Servlet implementation class SearchMusicServlet
 */
@WebServlet("/SearchMusicServlet")
public class SearchMusicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchMusicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("application/json;charset=utf-8");
		String search=request.getParameter("search");
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
	        String sql="select * from music where name like '%"+search+"%'";
	        rs=st.executeQuery(sql);
	        List<MusicBean> list=new ArrayList<>();
	        while(rs.next()) {
	        	MusicBean bean=new MusicBean();
	        	bean.setId(rs.getInt("id"));
	        	bean.setName(rs.getString("name"));
	        	bean.setSinger(rs.getString("singer"));
	        	bean.setUrl(rs.getString("url"));
	        	bean.setTime(rs.getDate("time"));
	        	bean.setType(rs.getString("type"));
	        	list.add(bean);
	        }
	        ObjectMapper om=new ObjectMapper();
			String musics=om.writeValueAsString(list);
			out.write(musics);
			System.out.println("this:"+musics);
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
