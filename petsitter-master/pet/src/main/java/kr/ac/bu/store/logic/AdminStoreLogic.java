package kr.ac.bu.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.bu.domain.Admin;
import kr.ac.bu.domain.PetSitterList;
import kr.ac.bu.store.AdminStore;


@Repository
public class AdminStoreLogic implements AdminStore {
	
	private static final String namespace = "kr.ac.bu.mappers.admin-mapper"; //user-mapper.xml�쓽 namespace媛�

	@Autowired
	SqlSession session;
	
	@Override
	public List<PetSitterList> psList() {
		
		return session.selectList(namespace + ".petsitterlist");
	}

	@Override
	public void accept(int psId) {
		
		session.update(namespace + ".accept", psId);
		
	}
	

	@Override
	public void deny(int psId) {
		
		session.update(namespace + ".deny", psId);
	}
}
