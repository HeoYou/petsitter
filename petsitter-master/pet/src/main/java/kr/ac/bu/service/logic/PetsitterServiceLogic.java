package kr.ac.bu.service.logic;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.bu.domain.PetSitterList;
import kr.ac.bu.domain.Petsitter;
import kr.ac.bu.domain.Reservation;
import kr.ac.bu.service.PetsitterService;
import kr.ac.bu.store.PetsitterStore;
 
@Service
public class PetsitterServiceLogic implements PetsitterService {
	
	@Autowired
	PetsitterStore psStore;

	@Override
	public List<PetSitterList> psList() {
		
		return psStore.psList();
	}

	@Override
	public List<PetSitterList> psList2() {
		
		return psStore.psList2();
	}
	
	@Override
	public Petsitter petsitter(int psId) {
		
		return psStore.petsitter(psId);
	}
	public String petsitterName(int psId) {
		
		return psStore.petsitterName(psId);
	}

	@Override 
	public List<PetSitterList> findByName(String sName) {

		return psStore.readByName(sName);
	}

	@Override
	public List<PetSitterList> findByAddress(String sAddress) {

		return psStore.readByAddress(sAddress);
	}
	
	@Override
	public Petsitter detail(int psId) {
		return psStore.detail(psId);
	}

	@Override
	public String psName(int psId) {

		return psStore.psName(psId);
	}

	
	@Override
	public List<String> images(int psId) {
		
		return psStore.images(psId);
	}

	@Override
	public List<PetSitterList> findByPrice(int sPrice, int minPrice, int maxPrice) {

		return psStore.readByPrice(sPrice, minPrice, maxPrice);
	}

	@Override
	public int rvCplt(int psId) {
		// TODO Auto-generated method stub
		return psStore.rvCplt(psId);
	}

	@Override
	public void accept1(int psId) {
		
		psStore.accept1(psId);
	}
	
	@Override
	public void deny1(int psId) {
		
		psStore.deny1(psId);
	}


	
}
