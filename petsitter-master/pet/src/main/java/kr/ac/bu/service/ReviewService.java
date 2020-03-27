package kr.ac.bu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ac.bu.domain.Review;


public interface ReviewService {
	
	List<Review> rvList(int psId);
	int rvWrite(Review review);
	int rvCount(int psId);

}
