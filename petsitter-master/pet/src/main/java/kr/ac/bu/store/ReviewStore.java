package kr.ac.bu.store;

import java.util.List;

import kr.ac.bu.domain.Review;

public interface ReviewStore {
	
	List<Review> rvList(int psId);
	int rvWrite(Review review);
	int rvCount(int psId);
	

}
