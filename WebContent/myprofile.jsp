<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
				 <script text="text/javascript">
				 function editMode(){
					 document.getElementById('username').style.background ="#e6e6e6";
					 document.getElementById('username').style.color ="#666666";
					 
					 document.getElementById('user_role').style.background ="#e6e6e6";
					 document.getElementById('user_role').style.color ="#666666";
					 
					 document.getElementById('firstname').disabled=false;
					 document.getElementById('lastname').disabled=false;
					 document.getElementById('uta_id').disabled=false;
					 document.getElementById('email').disabled=false;
					 document.getElementById('phone').disabled=false;
					 document.getElementById('saddress').disabled=false;
					 document.getElementById('city').disabled=false;
					 document.getElementById('state').disabled=false;
					 document.getElementById('zip').disabled=false;
					 document.getElementById('permit_id').disabled=false;
					 document.getElementById('permit_type').disabled=false;
					 document.getElementById('num_plate').disabled=false;
					 document.getElementById('password').disabled=false;
					 document.getElementById('update').disabled=false;
					 document.getElementById('edit').style.display='none';
				}
				 function onPageLoad(){
					 var count = <c:out value='${myprofileCount}'/>
					 var err = document.getElementById('errmsg').value;
					 if(err !== null && count>1)
					 { 
						 document.getElementById('username').style.background ="#e6e6e6";
						 document.getElementById('username').style.color ="#666666";
						 document.getElementById('user_role').style.background ="#e6e6e6";
						 document.getElementById('user_role').style.color ="#666666";
						 document.getElementById('firstname').disabled=false;
						 document.getElementById('lastname').disabled=false;
						 document.getElementById('uta_id').disabled=false;
						 document.getElementById('email').disabled=false;
						 document.getElementById('phone').disabled=false;
						 document.getElementById('saddress').disabled=false;
						 document.getElementById('city').disabled=false;
						 document.getElementById('state').disabled=false;
						 document.getElementById('zip').disabled=false;
						 document.getElementById('permit_id').disabled=false;
						 document.getElementById('permit_type').disabled=false;
						 document.getElementById('num_plate').disabled=false;
						 document.getElementById('password').disabled=false;
						 document.getElementById('update').disabled=false;
						 document.getElementById('edit').style.display='none'
					}
				 }
				 
				 </script></head>
				 <body onload='onPageLoad();'><form action='UpdateProfileController' method='post'><table>
				 <input id="errmsg" name="errMsg" value="<c:out value='${profileerrorMsgs.errorMsg}'/>" type="text" style ="background-color: white; color: red; border: none; width:800px" disabled="disabled" /><td><input id="counter" type="hidden" ></td>
				 <tr><td>Username:</td><td><input id='username'name='username' type='text' value= '${my_profile.username}' READONLY></td></tr>
				 <tr><td>Password:</td><td><input id='password'name='password' type='text' value='${my_profile.password}' disabled></td>
				 <td> <input name="passwordError" value="<c:out value='${profileerrorMsgs.passwordError}'/>" type="text" style ="background-color: white; color: red; border: none; width: 800px" disabled="disabled" maxlength="60"> </td></tr>
				 <tr><td>User Role:</td><td><input id='user_role' type='text'name='user_role' value='${my_profile.role}' READONLY></td><tr>
				 <tr><td>Firstname:</td><td><input id='firstname'name='firstname' type='text' value='${my_profile.firstname}' disabled></td>
				 <td> <input name="firstNameError" value="<c:out value='${profileerrorMsgs.firstnameError}'/>" type="text" style ="background-color: white; color: red; border: none; width: 800px" disabled="disabled" maxlength="60"> </td></tr>
				 <tr><td>Lastname:</td><td><input type='text' id='lastname' name='lastname' value='${my_profile.lastname}' disabled></td>
				 <td> <input name="lastNameError" value="<c:out value='${profileerrorMsgs.lastnameError}'/>" type="text" style ="background-color: white; color: red; border: none; width: 800px" disabled="disabled" maxlength="60"></tr>
				 <tr><td>UTA ID:</td><td><input type='text' id='uta_id' name='uta_id' value='${my_profile.uta_id}' disabled></td>
				 <td><input name="utaIdError" value="<c:out value='${profileerrorMsgs.utaIdError}'/>" type="text" style ="background-color: white; color: red; border: none; width: 800px" disabled="disabled" maxlength="60"> </td></tr>
				 <tr><td>Email:</td><td><input type='text' id='email' name='email' value='${my_profile.email}'  disabled></td>
				 <td> <input name="emailError" value="<c:out value='${profileerrorMsgs.emailError}'/>" type="text" style ="background-color: white; color: red; border: none; width: 800px" disabled="disabled" maxlength="60"> </td></tr>
				 <tr><td>Phone:</td><td><input type='text' id='phone' name='phone' value='${my_profile.phone}'  disabled></td>
				 <td> <input name="phoneError" value="<c:out value='${profileerrorMsgs.phoneError}'/>" type="text" style ="background-color: white; color: red; border: none; width: 800px" disabled="disabled" maxlength="60"> </td></tr>
				 <tr><td>Street Address:</td><td><input type='text' id='saddress' name='saddress' value='${my_profile.street_add}'  disabled></td>
				 <td> <input name="streetAddrError" value="<c:out value='${profileerrorMsgs.streetAddrError}'/>" type="text" style ="background-color: white; color: red; border: none; width: 800px" disabled="disabled" maxlength="60"> </td></tr>
				 <tr><td>City:</td><td><input type='text' id='city' name='city' value='${my_profile.city}'  disabled></td>
				 <td> <input name="cityError" value="<c:out value='${profileerrorMsgs.cityError}'/>" type="text" style ="background-color: white; color: red; border: none; width: 800px" disabled="disabled" maxlength="60"> </td></tr>
				 <tr><td>State:</td><td><input type='text' id='state' name='state' value='${my_profile.state}'  disabled></td>
				 <td> <input name="stateError" value="<c:out value='${profileerrorMsgs.stateError}'/>" type="text" style ="background-color: white; color: red; border: none; width: 800px" disabled="disabled" maxlength="60"> </td></tr>
				 <tr><td>Zip:</td><td><input type='text' id='zip' name='zip' value='${my_profile.getZip_code()}'  disabled></td>
				 <td> <input name="zipCodeError" value="<c:out value='${profileerrorMsgs.zipCodeError}'/>" type="text" style ="background-color: white; color: red; border: none; width: 800px" disabled="disabled" maxlength="60"> </td></tr>
				 <tr><td>Permit ID:</td><td><input id='permit_id' type='text' name='permit_id'  value='${my_profile.permit_id}' disabled></td>
				 <td> <input name="permitIdError" value="<c:out value='${profileerrorMsgs.permitIdError}'/>" type="text" style ="background-color: white; color: red; border: none; width: 800px" disabled="disabled" maxlength="60"> </td></tr>
				 <tr><td>Permit type:</td><td>
				 <select id="permit_type" name="permit_type" >
				 <option value = "Select" ${my_profile.permit_type == 'Basic' ? 'selected' : ''}>Basic</option>				 
				 <option value = "Select" ${my_profile.permit_type == 'Premium' ? 'selected' : ''}>Premium</option>
				 <option value = "Select" ${my_profile.permit_type == 'Midrange' ? 'selected' : ''}>Midrange</option>	
				 <option value = "Select" ${my_profile.permit_type == 'Access' ? 'selected' : ''}>Access</option>			 
				 </select></td></tr>
				 <tr><td>Car Number Plate:</td><td><input id='num_plate' type='text' name='car_num_plate' value='${my_profile.getCar_plate_num()}'disabled></td>
				 <td> <input name="carNmbrError" value="<c:out value='${profileerrorMsgs.carNmbrError}'/>" type="text" style ="background-color: white; color: red; border: none; width: 800px" disabled="disabled" maxlength="60"> </td></tr>
				 <tr><td><input id='update' type='submit' value='Update' disabled></td></tr>
				 </table></form>
				 <button id='edit' onclick='editMode();'>Edit</button>
				 <a href='${home}'>Back</a>
				 
				</body>
				</html>
