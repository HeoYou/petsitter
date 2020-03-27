package kr.ac.bu.store;

import java.util.List;

import kr.ac.bu.domain.PetSitterList;

public interface PetsearchStore {
	List<PetSitterList> psearchList(boolean psOption10);
}
