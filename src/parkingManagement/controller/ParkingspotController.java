package parkingManagement.controller;

import parkingManagement.model.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import parkingManagement.data.ParkingspotDao;
import parkingManagement.data.ReservationDao;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/parkingspotController")
public class ParkingspotController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		session.setAttribute("parkingspots", null);	
		String action = request.getParameter("action");
		
		ParkingspotDao parkingSpotDao = new ParkingspotDao();
		ReservationDao reservationDao = new ReservationDao();
		
		ParkingArea parkingarea = new ParkingArea();
		parkingarea.setParkingarea_name(request.getParameter("parkingarea"));
		parkingarea.setParkingtype(request.getParameter("parkingtype"));
		java.util.Date utilDate = new java.util.Date();
		Date today = new Date(utilDate.getTime());
		
		Time from = null;
		Time to = null;
		DateFormat formatter = new SimpleDateFormat("HH:mm");
		try {
			from = new Time(formatter.parse(request.getParameter("reservationfrom")).getTime());
			to = new Time(formatter.parse(request.getParameter("reservationto")).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String rawFrom = request.getParameter("reservationfrom");
		String rawTo = request.getParameter("reservationto");
//		List parkingspots
		if (action.equalsIgnoreCase("searchparkingspot")) {
			SearchParkingspotErrorMsgs errorMsgs = new SearchParkingspotErrorMsgs();
			parkingarea.ValidateSearchParkingSpot(parkingarea, errorMsgs, rawFrom, rawTo);
			
			session.setAttribute("parkingArea",parkingarea);
			session.setAttribute("reservationfromtime",rawFrom);
			session.setAttribute("reservationtotime",rawTo);
			session.setAttribute("errorMsgs",errorMsgs);
			
			if (errorMsgs.getErrorMsg().equals("")) {
					 //save user if no errors
				/*session.removeAttribute("parkingArea");
				session.removeAttribute("reservationfromtime");
				session.removeAttribute("reservationtotime");*/
				
				ArrayList<ParkingArea> parkingAreaList = new ArrayList<ParkingArea>();
				ArrayList<Integer> parkingAreaIdList = new ArrayList<Integer>();
				parkingAreaList=parkingSpotDao.getParkingAreaList(parkingarea);
				for(ParkingArea pa : parkingAreaList){
					parkingAreaIdList.add(pa.getParkingarea_id());
				}
				Map<Integer, Integer> parkingcountMap = new HashMap<Integer, Integer>();
				parkingcountMap = reservationDao.getParkingAreaCountList(parkingAreaIdList, from, to, today);
				
				Map<Integer, Integer> availabilitycountMap = new HashMap<Integer, Integer>();
				int reserved = 0;
				for(ParkingArea pa : parkingAreaList){
					reserved = parkingcountMap.get(pa.getParkingarea_id());
					availabilitycountMap.put(pa.getParkingarea_id(), (pa.getCapacity()-reserved));
				}
				session.setAttribute("parkingspots", parkingAreaList);
				session.setAttribute("availabilitymap", availabilitycountMap);			
				
			}
			getServletContext().getRequestDispatcher("/searchparkingspot.jsp").forward(request, response);
		}
	}
}
