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

import kr.ac.bu.domain.PetSitterList;
import kr.ac.bu.domain.Petsitter;
import kr.ac.bu.domain.Reservation;
import kr.ac.bu.store.PetsitterStore;
import kr.ac.bu.store.factory.ConnectionFactory;
import kr.ac.bu.store.factory.JdbcUtils;
   
@Repository
public class PetsitterStoreLogic implements PetsitterStore {

	private static final String namespace = "kr.ac.bu.mappers.petsitter-mapper"; //user-mapper.xml�쓽 namespace媛�

	@Autowired
	SqlSession session;
	
	@Override
	public List<PetSitterList> psList() {
		
		List<PetSitterList> psList = session.selectList(namespace + ".petsitterlist");
		
		return psList;
	}

	@Override
	public List<PetSitterList> psList2() {
		
		List<PetSitterList> psList2 = session.selectList(namespace + ".petsitterlist2");
		return psList2;
	}
	
	@Override
	public Petsitter petsitter(int psId) {
		session.update(namespace +".count", psId);
		
		//session.selectOne(namespace+".complete",psId);
		
		return session.selectOne(namespace + ".petsitter", psId);
	}

	@Override
	public List<PetSitterList> readByName(String sName) {
		
		List<PetSitterList> psList = session.selectList(namespace + ".petsearchname", sName);
//		List<String> images = session.selectList(namespace + ".searchimage",sName);
//		for(int i = 0; i < psList.size(); i++)	{
//			PetSitterList list = psList.get(i);
//			list.setImgId(images.get(i));
//			
//		}
		return psList;
	}

	@Override
	public List<PetSitterList> readByAddress(String sAddress) {
		
		List<PetSitterList> psList = session.selectList(namespace + ".petsearchaddress", sAddress);
//		List<String> images = session.selectList(namespace + ".searchimage2",sAddress);
//		for(int i = 0; i < psList.size(); i++)	{
//			PetSitterList list = psList.get(i);
//			list.setImgId(images.get(i));
//			
//		}
		return psList;
	}

	@Override
	public Petsitter detail(int psId) {
		
		return session.selectOne(namespace + ".petsitterdetail", psId);
	}

	@Override
	public String psName(int psId) {
		
		return session.selectOne(namespace + ".petsitterpsname", psId);
	}

	
	@Override
	public String petsitterName(int psId) {
		
		return session.selectOne(namespace + ".petsittername", psId);
	}

	@Override
	public List<String> images(int psId) {
		
		return session.selectList(namespace + ".petsitterimage", psId);
	}

	@Override
	public List<PetSitterList> readByPrice(int sPrice, int minPrice, int maxPrice) {

//		return session.selectList(namespace + ".petsearchprice", sPrice, minPrice, maxPrice);
		return null;
	}

	@Override
	public int rvCplt(int psId) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".complete", psId);
	}
	
	@Override
	public void accept1(int psId) {
		
		session.update(namespace + ".accept1", psId);
		
	}

	@Override
	public void deny1(int psId) {

		session.update(namespace + ".deny1", psId);
	}
	
}