<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search User</title>
</head>
<body>
<form action="searchUserController" method="get">
<table>
<tr>
<td>Firstname:</td><td><input type="text" name="search_firstname"></td></tr>
<tr>
<td>Lastname:</td><td><input type="text" name="search_lastname"></td></tr>
<tr><td><input type="submit" value="Search"></td></tr>
</table>
</form>
</body>
</html>