<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
<link rel="icon" href="logo.jpg" type="image/gif" sizes="16x16">
<title>
	Active Users
</title>
</head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<%
String cred=request.getParameter("credit");

String id=(request.getParameter("first"));


String first=(request.getParameter("first1"));
String amount=(request.getParameter("amount"));
String second=(request.getParameter("second1"));


Class.forName("com.mysql.jdbc.Driver");
Connection co=DriverManager.getConnection("jdbc:mysql://node28451-aabhas.mj.milesweb.cloud/usser",
		"root", "b4WWim1COm");
Statement st=co.createStatement();

if(first!=null)
{
	int firstid=Integer.parseInt(first);
	int secondid=Integer.parseInt(second);
	ResultSet rr=st.executeQuery("select credits from spark where id="+secondid);
	rr.next();
	int cr=rr.getInt(1)+Integer.parseInt(amount);
	st.executeUpdate("update spark set credits="+cr+" where id="+secondid);
	
	rr=st.executeQuery("select credits from spark where id="+firstid);
	rr.next();
	int cr2=rr.getInt(1)-Integer.parseInt(amount);
	st.executeUpdate("update spark set credits="+cr2+" where id="+firstid);
	//response.sendRedirect("View_All_Users.jsp");
	%>
	<p>Transfer Done!!!</p>
	<%
	response.setHeader("Refresh", "1; View_All_Users.jsp");
	//return;
}
if(cred==null)
{
%>
	<p>
	Active Users
	</p>
<% 
}
else
{
%>
	<p>
	Select The Second User
	</p>
<%
}
%>
<table id="customers" >
<tr>
	<th > Sr.No </th>
	<th > Name </th>
	<th > Credits </th>
	<th > Select </th>
</tr>
<%
ResultSet r=st.executeQuery("select * from spark");
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
				<a style="text-decoration:none" href="View.jsp?u=<%=i%>">Select and View</a>
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
