<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List" import="myBean.MusicBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#name{
		width:140px
	}
	#singer{
		width:100px
	}
	#url{
		width:1000px
	}
</style>
<body>
<% 
	List<MusicBean> list=(List<MusicBean>) request.getAttribute("list");
%>
	<table border="1">
		<tr>
			<th>id</th>
			<th>歌名</th>
			<th>演唱者</th>
			<th>歌曲链接</th>
			<th>入库时间</th>
			<th>修改</th>
		</tr>
		<%
			for(MusicBean bean : list) {
		%>
		<tr>
			<td><%=bean.getId()%></td>
			<td><input name="name" id="name" value='<%=bean.getSinger()%>'></td>
			<td><input name="singer" id="singer" value='<%=bean.getSinger()%>'></td>
			<td><input name="url" id="url" value='<%=bean.getUrl()%>'></td>
			<td><%=bean.getTime()%></td>
			<td><a href='UpdateMusicServlet?id=<%=bean.getId()%>&name=${param.name}&singer=${param.singer}&url=${param.url}'>提交</a></td>
		</tr>
		<%} %>
	</table>
</body>
</html>