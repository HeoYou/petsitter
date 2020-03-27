package kr.ac.bu.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.bu.domain.Review;
import kr.ac.bu.store.ReviewStore;

@Repository
public class ReviewStoreLogic implements ReviewStore {
	
	private static final String namespace = "kr.ac.bu.mappers.review-mapper"; // user-mapper.xml�쓽 namespace媛�

	@Autowired
	SqlSession session;

	@Override
	public List<Review> rvList(int psId) {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".reviewlist" , psId);
	}

	@Override
	public int rvWrite(Review review) {
		// TODO Auto-generated method stub
		return session.insert(namespace + ".reviewwrite", review);
	}
	
	public int rvCount(int psId)	{
		return session.selectOne(namespace + ".rvcount" , psId);
	}
 
}
