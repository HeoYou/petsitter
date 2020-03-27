package kr.ac.bu.service;
 
import java.util.List;

import kr.ac.bu.domain.PetSitterList;
import kr.ac.bu.domain.Petsitter;
import kr.ac.bu.domain.Reservation;
 
public interface PetsitterService {

	  List<PetSitterList> psList();
	  List<PetSitterList> psList2();
	  Petsitter petsitter(int psId);
	  List<PetSitterList> findByName(String sName);
	  String petsitterName(int psId);
	  List<String> images(int psId);
	List<PetSitterList> findByAddress(String sAddress);
	List<PetSitterList> findByPrice(int sPrice, int minPrice, int maxPrice);
	
	Petsitter detail(int psId);

	String psName(int psId);
	
	int rvCplt(int psId);
	
	void accept1(int psId);

	void deny1(int psId);
	
} 
