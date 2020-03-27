package kr.ac.bu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ac.bu.domain.PetSitterList;

@Service
public interface PetsearchService {
	List<PetSitterList> PetsearchList(boolean Option10);
}
