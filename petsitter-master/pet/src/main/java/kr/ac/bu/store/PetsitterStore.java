package kr.ac.bu.store;
 
import java.util.List;

import kr.ac.bu.domain.PetSitterList;
import kr.ac.bu.domain.Petsitter;
import kr.ac.bu.domain.Reservation;
 
public interface PetsitterStore {
	
	List<PetSitterList> psList();

	List<PetSitterList> psList2();
	
	Petsitter petsitter(int psId);

	List<PetSitterList> readByName(String sName);
	List<PetSitterList> readByAddress(String sAddress);
	String petsitterName(int psId);
	List<String> images(int psId);
	List<PetSitterList> readByPrice(int sPrice, int minPrice, int maxPrice);

	Petsitter detail(int psId);

	String psName(int psId);
	
	int rvCplt(int psId);

	void accept1(int psId);

	void deny1(int psId);
}
 