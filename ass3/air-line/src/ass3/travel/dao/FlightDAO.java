package ass3.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ass3.travel.model.Flight;

public class FlightDAO {
	public List<Flight> find(String query, Connection conn)
	{
		List<Flight> flightlist = new ArrayList<Flight>();
		try
		{
			PreparedStatement statement = conn.prepareStatement(query);					
			ResultSet resultset = statement.executeQuery();
			while(resultset.next())
			{
				Flight flight = new Flight();
				flight.setFlightno(resultset.getString("flightno"));
				flight.setDeparturecity(resultset.getString("departurecity"));
				flight.setArrivalcity(resultset.getString("arrivalcity"));
				flight.setCost(resultset.getInt("cost"));
				flight.setDeparturetime(resultset.getString("departuretime"));
				flight.setArrivaltime(resultset.getString("arrivaltime"));
				flight.setLegs(resultset.getInt("legs"));
				flightlist.add(flight);
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return flightlist;
	}
}
