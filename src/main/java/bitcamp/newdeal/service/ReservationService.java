package bitcamp.newdeal.service;

import java.util.List;

import bitcamp.newdeal.domain.Reservation;

public interface ReservationService {

	List<Reservation> list(int memberNo);

	Reservation get(int no);

	int delete(int no, int travelNo, int seatClass);

	int insert(int memberNo, int travelNo, int seatClass);

	List<Reservation> futureList(int memberNo);

}
