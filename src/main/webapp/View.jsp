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

<center>
<table border="1" style="width:100%;">
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
ResultSet r=st.executeQuery("select * from user where id="+i);
int credit=0;
String id="";
while(r.next())
{
	%>
	<tr style="width:100%">
	<%id= ""+r.getInt(1);%>
	<th > <%=r.getString(2)%> </th>
	<th > <%=r.getString(3)%> </th>
	<%credit= r.getInt(4);%>
	<th > <%=r.getInt(4)%> </th>
	<th > <%=r.getString(5)%> </th>
</tr>
	<%
}
co.close();
%>
</table>

<br>
<br>
<form action="View_All_Users.jsp">
	<input  style="width:300px" type="number" name="credit" min="1" max="<%=credit%>"
	 placeholder="Enter the credits"><br><br>

	<input type="text" name ="first" value="<%=id%>" hidden><br><br>

	
	<input type="submit" value="Transfer Credits">
</form>

</center>
</body>
</html>
