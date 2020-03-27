package kr.ac.bu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ac.bu.domain.PetSitterList;

@Service
public interface AdminService {

	List<PetSitterList> psList();
	void accept(int psId);
	void deny(int psId);
}
