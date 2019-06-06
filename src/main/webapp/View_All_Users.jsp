<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	td,tr,th
	{
		padding:20px;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<br>
<center>
<table border="1" >
<tr>
	<th > Sr.No </th>
	<th > Name </th>
	<th > Credits </th>
	<th > Select </th>
</tr>
<%
String cred=request.getParameter("credit");
String id=(request.getParameter("first"));


String first=(request.getParameter("first1"));
String amount=(request.getParameter("amount"));
String second=(request.getParameter("second1"));


Class.forName("com.mysql.jdbc.Driver");
Connection co=DriverManager.getConnection("jdbc:mysql://localhost:3306/spark",
		"root", "abcd");
Statement st=co.createStatement();

if(first!=null)
{
	int firstid=Integer.parseInt(first);
	int secondid=Integer.parseInt(second);
	ResultSet rr=st.executeQuery("select credits from user where id="+secondid);
	rr.next();
	int cr=rr.getInt(1)+Integer.parseInt(amount);
	st.executeUpdate("update user set credits="+cr+" where id="+secondid);
	
	rr=st.executeQuery("select credits from user where id="+firstid);
	rr.next();
	int cr2=rr.getInt(1)-Integer.parseInt(amount);
	st.executeUpdate("update user set credits="+cr2+" where id="+firstid);
	//response.sendRedirect("View_All_Users.jsp");
	%>
	<h1>Transfer Done!!!</h1>
	<%
	response.setHeader("Refresh", "1; URL=http://localhost:8888//aabhas99//View_All_Users.jsp");
	//return;
}
ResultSet r=st.executeQuery("select * from user");
int i=0;
while(r.next())
{
	i++;
	if(cred==null)
	{
		%>
		<tr>
			<td>
				<%= r.getString(1)%>
			</td>
			
			<td>
				<%= r.getString(2)%>
			</td>
			
			<td>
				<%= r.getInt(4)%>
			</td>
			
			<td>
				<a href="View.jsp?u=<%=i%>">Select</a>
			</td>
			
		</tr>
		<%
	}
	else
	{
		if(!r.getString(1).equals(id))
		{
		%>
		<tr>
			<td>
				<%= r.getString(1)%>
			</td>
			
			<td>
				<%= r.getString(2)%>
			</td>
			
			<td>
				<%= r.getInt(4)%>
			</td>
			
			<td>
				<a href="View_All_Users.jsp?first1=<%=id%>&amount=<%=cred%>&second1=<%=i%>">Select</a>
			</td>
			
		</tr>
		<%
		}
		else
		{
			continue;
		}
	}
}
co.close();
%>
</table>
</center>
</body>
</html>