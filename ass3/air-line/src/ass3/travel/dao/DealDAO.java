package ass3.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ass3.travel.model.Deal;

public class DealDAO {
	public List<Deal> find(String query, Connection conn)
	{
		List<Deal> offerlist = new ArrayList<Deal>();
		try {
			PreparedStatement statement = conn.prepareStatement(query);					
			ResultSet resultset = statement.executeQuery();
			while(resultset.next()) {
				Deal offer = new Deal();
				offer.setDeparturecity(resultset.getString("departurecity"));
				offer.setArrivalcity(resultset.getString("arrivalcity"));
				offer.setCost(resultset.getDouble("cost"));
				offerlist.add(offer);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return offerlist;
	}
}
