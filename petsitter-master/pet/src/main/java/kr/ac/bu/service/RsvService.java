package kr.ac.bu.service;

import java.util.List;

import kr.ac.bu.domain.Reservation;

public interface RsvService {

	Reservation rsvInfo(int rId);

	int reservation(Reservation rsv);

	Reservation read(String rId);

	List<Reservation> readAll();

	List<Reservation> readMe(String uId);

	List<Reservation> psReservationList(String uId);

	Reservation detail(int rId);

	String psName(int rId);

	void accept(int rId);

	void deny(int rId);
	
	void success(int rId);
}
