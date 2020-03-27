package kr.ac.bu.store;

import java.util.List;


import kr.ac.bu.domain.PetSitterList;

public interface AdminStore {

	List<PetSitterList> psList();
	void accept(int psId);
	void deny(int psId);
}
