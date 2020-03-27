package kr.ac.bu.store.logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.bu.domain.Reservation;
import kr.ac.bu.store.RsvStore;
import kr.ac.bu.store.factory.ConnectionFactory;
import kr.ac.bu.store.factory.JdbcUtils;

@Repository
public class RsvStroreLogic implements RsvStore {

	private static final String namespace = "kr.ac.bu.mappers.reservation-mapper"; // user-mapper.xml�쓽 namespace媛�

	@Autowired
	SqlSession session;

	@Override
	public Reservation rsvInfo(int rId) {
		Reservation rsvInfo = new Reservation();

		rsvInfo = (Reservation) session.selectOne(namespace + ".rsvInfo", rId);
		rsvInfo.setuName((String) session.selectOne(namespace + ".rsvInfoName", rId));

		return rsvInfo;
	}

	@Override
	public int reservation(Reservation rsv) {

		session.insert(namespace + ".reservation", rsv);
		return 0;
	}

	@Override
	public Reservation read(String rId) {
		
		String sql = "SELECT rId, rSdate, rEdate, rStation, rPrice, uId, rStatus FROM reservation WHERE rId = ?";
		
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Reservation reservation = null;
		
		try {
			conn = ConnectionFactory.createConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				reservation = new Reservation();
				reservation.setrId(rs.getInt(1));
				reservation.setrSdate(rs.getDate(2));
				reservation.setrEdate(rs.getDate(3));
				reservation.setrStation(rs.getString(4));
				reservation.setrPrice(rs.getInt(5));
				reservation.setuId(rs.getString(6));
				reservation.setrStatus(rs.getInt(7));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(conn, rs, pstmt); 
		}
	
		return reservation;
	}
	
	
	@Override
	public List<Reservation> readAll() {

		String sql = "SELECT rId, rSdate, rEdate, rStation, rPrice, uId, rStatus FROM reservation";

		Connection conn = null;
		Statement statement = null;
		ResultSet rs = null;
		List<Reservation> list = new ArrayList<Reservation>();

		try {
			conn = ConnectionFactory.createConnection();
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				System.out.println(rs.getString(1));
				Reservation reservation = new Reservation();
				reservation.setrId(rs.getInt(1));
				reservation.setrSdate(rs.getDate(2));
				reservation.setrEdate(rs.getDate(3));
				reservation.setrStation(rs.getString(4));
				reservation.setrPrice(rs.getInt(5));
				reservation.setuId(rs.getString(6));
				reservation.setrStatus(rs.getInt(7));
				
				list.add(reservation);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(rs, statement, conn);
		}
		return list;
	}
	
	@Override
	public List<Reservation> readMe(String uId) {
		
		List<Reservation> rsvList = session.selectList(namespace + ".rsvlist", uId);
		
		return rsvList;
		
//		String sql = "SELECT rId, rSdate, rEdate, rStation, rPrice, uId, rStatus FROM reservation WHERE uId = '"+uId+"'";
//
//		Connection conn = null;
//		Statement statement = null;
//		ResultSet rs = null;
//
//		List<Reservation> list = new ArrayList<Reservation>();
//		
//		try {
//			conn = ConnectionFactory.createConnection();
//			statement = conn.createStatement();
//			rs = statement.executeQuery(sql);
//			
//			while (rs.next()) {
//				Reservation reservation = new Reservation();
//				reservation.setrId(rs.getString(1));
//				reservation.setrSdate(rs.getDate(2));
//				reservation.setrEdate(rs.getDate(3));
//				reservation.setrStation(rs.getString(4));
//				reservation.setrPrice(rs.getInt(5));
//				reservation.setUId(rs.getString(6));
//				reservation.setrStatus(rs.getInt(7));
//				list.add(reservation);
//			}
//		} catch (SQLException e) {
//			throw new RuntimeException(e);
//		} finally {
//			JdbcUtils.close(rs, statement, conn);
//		}
//		//System.out.println("store:"+list);
//		
//		return list;		
	}

	@Override
	public List<Reservation> psReservationList(String uId) {
		
		List<Reservation> psRsvList = session.selectList(namespace + ".psreservation", uId);
		List<String> nameList = session.selectList(namespace + ".username", uId);
		
		//List<Reservation> temp = new ArrayList<Reservation>();
		System.out.println(psRsvList.size());
		System.out.println(nameList.size());
		
		for (int i = 0; i < psRsvList.size(); i++) {
			psRsvList.get(i).setuName(nameList.get(i)); 
			/*
			 * Reservation rsv = psRsvList.get(i); rsv.setuName(nameList.get(i));
			 * temp.set(i,rsv);
			 */
		}
		for (int i = 0; i < psRsvList.size();i++) {
			
			System.out.println(psRsvList.get(i).toString());
		}
		
		return psRsvList;
	}

	@Override
	public Reservation detail(int rId) {
		
		return session.selectOne(namespace + ".reservationdetail", rId);
	}

	@Override
	public String psName(int rId) {
		
		return session.selectOne(namespace + ".reservationpsname", rId);
	}

	@Override
	public void accept(int rId) {
		
		session.update(namespace + ".accept", rId);
		
	}

	@Override
	public void deny(int rId) {
		// TODO Auto-generated method stub
		session.update(namespace + ".deny", rId);
	}

	@Override
	public void success(int rId) {
		// TODO Auto-generated method stub
		session.update(namespace + ".success", rId);
	}
	
}
