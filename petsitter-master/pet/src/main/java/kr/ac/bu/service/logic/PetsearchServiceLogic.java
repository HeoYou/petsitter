package kr.ac.bu.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.bu.domain.PetSitterList;
import kr.ac.bu.service.PetsearchService;
import kr.ac.bu.store.PetsearchStore;

@Service
public class PetsearchServiceLogic implements PetsearchService{

	@Autowired
	PetsearchStore psearchStore;
	
	@Override
	public List<PetSitterList> PetsearchList(boolean psOption10) {
		System.out.println(psOption10);
		return psearchStore.psearchList(psOption10);
	}
	
  
}
