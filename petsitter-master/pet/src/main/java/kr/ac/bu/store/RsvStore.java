package kr.ac.bu.store;

import java.util.List;

import kr.ac.bu.domain.Reservation;

public interface RsvStore {

	Reservation rsvInfo(int rId);

	int reservation(Reservation rsv);

	List<Reservation> readAll();

	Reservation read(String rId);

	List<Reservation> readMe(String uId);

	List<Reservation> psReservationList(String uId);

	Reservation detail(int rId);

	String psName(int rId);

	void accept(int rId);

	void deny(int rId);
	
	void success(int rId);

}
