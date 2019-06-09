<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/mystyle_View.css">
<link rel="icon" href="logo.jpg">
<title>
	User Details
</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<center>

<p>
User Details
</p>

<table id="customers">
<tr>
	<th > Name </th>
	<th > Email </th>
	<th > Credits </th>
	<th > Phone Number </th>
</tr>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection co=DriverManager.getConnection("jdbc:mysql://node28451-aabhas.mj.milesweb.cloud/usser",
		"root", "b4WWim1COm");
Statement st=co.createStatement();
int i=Integer.parseInt(request.getParameter("u"));
ResultSet r=st.executeQuery("select * from spark where id="+i);
int credit=0;
String id="";
while(r.next())
{
	%>
	<tr>
	<%id= ""+r.getInt(1);%>
	<td > <%=r.getString(2)%> </td>
	<td > <%=r.getString(3)%> </td>
	<%credit= r.getInt(4);%>
	<td > <%=r.getInt(4)%> </td>
	<td > <%=r.getString(5)%> </td>
</tr>
	<%
}
co.close();
%>
</table>

<br>
<br>
<br>
<br>
<form action="View_All_Users.jsp">
	<input id="input" style="width:300px" type="number" name="credit" min="1" max="<%=credit%>"
	 placeholder="Enter the credits" required><br><br><br>

	<input type="text" name ="first" value="<%=id%>" hidden><br>

	
	<input id="submit" type="submit" value="Transfer Credits">
</form>

</center>
</body>
</html>
