package kr.ac.bu.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.bu.domain.Reservation;
import kr.ac.bu.service.RsvService;
import kr.ac.bu.store.RsvStore;

@Service
public class RsvServiceLogic implements RsvService {
	
	@Autowired
	private RsvStore rsvStore;

	@Override
	public Reservation rsvInfo(int rId) {
		return rsvStore.rsvInfo(rId);
	}

	@Override
	public int reservation(Reservation rsv) {
		rsvStore.reservation(rsv);
		return 0;
	}
	
	@Override
	public Reservation read(String rId) {
		
		return rsvStore.read(rId);
	}
	
	@Override
	public List<Reservation> readAll() {
		
		return rsvStore.readAll();
	}
	
	@Override
	public List<Reservation> readMe(String uId) {

		return rsvStore.readMe(uId);
	}

	@Override
	public List<Reservation> psReservationList(String uId) {
		
		return rsvStore.psReservationList(uId);
	}

	@Override
	public Reservation detail(int rId) {
		return rsvStore.detail(rId);
	}

	@Override
	public String psName(int rId) {

		return rsvStore.psName(rId);
	}

	@Override
	public void accept(int rId) {
		
		rsvStore.accept(rId);
		
	}

	@Override
	public void deny(int rId) {
		rsvStore.deny(rId);
	}

	@Override
	public void success(int rId) {
		rsvStore.success(rId);
		
	}
	
}
