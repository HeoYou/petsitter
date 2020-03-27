package kr.ac.bu.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.bu.domain.Review;
import kr.ac.bu.service.ReviewService;
import kr.ac.bu.store.ReviewStore;


@Service
public class ReviewServiceLogic implements ReviewService {
	
	@Autowired
	ReviewStore rvStore;


	@Override
	public List<Review> rvList(int psId) {
		// TODO Auto-generated method stub
		return rvStore.rvList(psId);
	}

	@Override
	public int rvWrite(Review review) {
		// TODO Auto-generated method stub
		return rvStore.rvWrite(review);
	}

	@Override
	public int rvCount(int psId) {
		// TODO Auto-generated method stub
		return rvStore.rvCount(psId);
	}

}
