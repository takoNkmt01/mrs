package mrs.domain.service.reservation;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mrs.domain.model.ReservableRoom;
import mrs.domain.model.ReservableRoomId;
import mrs.domain.model.Reservation;
import mrs.domain.model.RoleName;
import mrs.domain.model.User;
import mrs.domain.repository.reservation.ReservationRepository;
import mrs.domain.repository.room.ReservableRoomRepository;

@Service
@Transactional
public class ReservationService {

	@Autowired
	ReservationRepository reservationRepository;
	@Autowired
	ReservableRoomRepository reservableRoomRepository;

	public List<Reservation> findReservations(ReservableRoomId reservableRoomId){
		return reservationRepository.findByReservableRoom_ReservableRoomIdOrderByStartTimeAsc(reservableRoomId);
	}

	public Reservation Reserve(Reservation reservation) {
		ReservableRoomId reservableRoomId = reservation.getReservableRoom().getReservableRoomId();
		System.out.println(reservableRoomId);
		//対象の部屋が予約可能かどうかチェック
		ReservableRoom reservable = reservableRoomRepository.findOne(reservableRoomId);
		if(reservable == null) {
			throw new UnavailableReservationException("入力日付・部屋の組み合わせは予約できません");
		}
		//重複をチェックする
		boolean overlap = reservationRepository
						.findByReservableRoom_ReservableRoomIdOrderByStartTimeAsc(reservableRoomId)
						.stream()
						.anyMatch(x -> x.overlap(reservation));

		if(overlap) {
			throw new AlreadyReservedException("入力の時間帯はすでに予約済みです");
		}
		//予約情報の登録
		reservationRepository.save(reservation);
		return reservation;
	}

	public void cancel(Integer reservationId, User requestUser) {
		Reservation reservation = reservationRepository.findOne(reservationId);
		if(RoleName.ADMIN != requestUser.getRoleName() &&
				!Objects.equals(reservation.getUser().getUserId(), requestUser.getUserId())) {
			throw new AccessDeniedException("要求されたキャンセルは許可できません");
		}
		reservationRepository.delete(reservationId);
	}
}
