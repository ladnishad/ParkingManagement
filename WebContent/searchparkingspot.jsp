<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table#t01 {
  border: 0.1px solid black;  
  align: "CENTER";
}
table#t01 tr:nth-child(even) {
  border: 0.1px solid black; 
  align: "CENTER";
  background-color: #AED6F1;
}
table#t01 tr:nth-child(odd) {
  border: 0.1px solid black; 
  align: "CENTER";
  background-color: #EBF5FB;
}
table#t01 th {
  color: black;
  align: "CENTER";
  border: 0.1px solid black;
  background-color: #EBF5FB;
}
 
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
<title>Search Parking Spot</title>
</head>
<body>
<h1>Search Parking Spot</h1>
<input name="errMsg" value="<c:out value='${errorMsgs.errorMsg}'/>" type="text" style ="background-color: white; color: red; border: none; width:800px" disabled="disabled">
<form name = "reg_form" action="parkingspotController" method ="get">
<table>
<tr>
<td>Parking Area* :</td>
<td><select name="parkingarea">
		<option value = "Select" ${parkingArea.parkingarea_name == 'Select' ? 'selected' : ''}>Select</option>
		<option value = "West Garage" ${parkingArea.parkingarea_name == 'West Garage' ? 'selected' : ''}>West Garage</option>
		<option value = "Maverick" ${parkingArea.parkingarea_name == 'Maverick' ? 'selected' : ''}>Maverick</option>
		<option value = "Davis" ${parkingArea.parkingarea_name == 'Davis' ? 'selected' : ''}>Davis</option>
		<option value = "Nedderman" ${parkingArea.parkingarea_name == 'Nedderman' ? 'selected' : ''}>Nedderman</option>
</select></td>
<td> <input name="parkingAreaError" value="<c:out value='${errorMsgs.parkingAreaError}'/>" type="text" style ="background-color: white; color: red; border: none; width: 800px" disabled="disabled" maxlength="60"> </td>
</tr>
<tr>
<td>Parking Type* :</td>
<td><select name="parkingtype">
		<option value = "Select" ${parkingArea.parkingtype == 'Select' ? 'selected' : ''}>Select</option>
		<option value = "Basic" ${parkingArea.parkingtype == 'Basic' ? 'selected' : ''}>Basic</option>
		<option value = "Midrange" ${parkingArea.parkingtype == 'Midrange' ? 'selected' : ''}>Midrange</option>
		<option value = "Premium" ${parkingArea.parkingtype == 'Premium' ? 'selected' : ''}>Premium</option>
		<option value = "Access" ${parkingArea.parkingtype == 'Access' ? 'selected' : ''}>Access</option>
</select></td>
<td> <input name="parkingTypeError" value="<c:out value='${errorMsgs.parkingTypeError}'/>" type="text" style ="background-color: white; color: red; border: none; width: 800px" disabled="disabled" maxlength="60"> </td>
</tr>
<tr>
<tr>
<td>From* :</td><td><input type="time" name ="reservationfrom" value="<c:out value='${reservationfromtime}'/>" ></td>
<td> <input name="reservationFromError" value="<c:out value='${errorMsgs.reservationFromError}'/>" type="text" style ="background-color: white; color: red; border: none; width: 800px" disabled="disabled" maxlength="60"> </td>
</tr>
<tr>
<td>To* :</td><td><input type="time" name ="reservationto" value="<c:out value='${reservationtotime}'/>" ></td>
<td> <input name="reservationToError" value="<c:out value='${errorMsgs.reservationToError}'/>" type="text" style ="background-color: white; color: red; border: none; width: 800px" disabled="disabled" maxlength="60"> </td>
</tr>

</table>
	<input name="action" value="searchparkingspot" type="hidden">
	<input name="searchparkingspot" type="submit" value="Search">
	<input name="reset" type="reset" value="Reset">
</form>
<br/>

<table class="myTable" style="visibility: visible;" id="t01"> 
			<tr class="myTableRow"> 
				<th class="myTableHead" style="width: 145px; " >Parking Area Name</th>
				<th class="myTableHead" style="width: 104px; ">Parking Type</th> 
				<th class="myTableHead" style="width: 105px; ">Floor</th>
				<th class="myTableHead" style="width: 130px; ">Available Spots </th>
			</tr>
		
		<tr class="myTableRow" align="CENTER"><c:if test = "${empty parkingspots}">No Data </c:if></tr>
 		<c:forEach items="${parkingspots}" var="item">
			<tr class="myTableRow">
			<td class="myTableCell" style="width: 145px;" align=CENTER  ><a href="url"><c:out value="${item.parkingarea_name}" /></a></td>
			<td class="myTableCell" style="width: 104px; " align=CENTER ><c:out value="${item.parkingtype}" /></td>
			<td class="myTableCell" style="width: 130px; " align=CENTER ><c:out value="${item.floor}" /></td>
			<td class="myTableCell" style="width: 63px; " align=CENTER ><c:out value="${item.availability}" /></td>
			</tr>
		</c:forEach>
	
</table>

</body>
</html>