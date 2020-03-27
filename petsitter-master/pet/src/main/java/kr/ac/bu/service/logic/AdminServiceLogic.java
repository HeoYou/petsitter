package kr.ac.bu.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.bu.domain.PetSitterList;
import kr.ac.bu.service.AdminService;
import kr.ac.bu.store.AdminStore;

@Service
public class AdminServiceLogic implements AdminService{

	@Autowired
	AdminStore adminStore;

	@Override
	public List<PetSitterList> psList() {
		
		return adminStore.psList();
	}

	@Override
	public void accept(int psId) {
		adminStore.accept(psId);
		
	}

	@Override
	public void deny(int psId) {
		adminStore.deny(psId);
	}

}
