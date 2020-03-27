package kr.ac.bu.store.logic;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.bu.domain.PetSitterList;
import kr.ac.bu.store.PetsearchStore;

@Repository
public class PetsearchStoreLogic implements PetsearchStore{

	private static final String namespace = "kr.ac.bu.mappers.petsitter-mapper";
	
	@Autowired
	SqlSession session;
	
	@Override
	public List<PetSitterList> psearchList(boolean psOption10) {
		System.out.println(psOption10);
		return session.selectList(namespace + ".petsearch", psOption10);
	}

}
