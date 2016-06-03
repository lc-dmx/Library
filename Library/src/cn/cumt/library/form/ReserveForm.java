package cn.cumt.library.form;

import org.apache.struts.action.ActionForm;

//用户表的bean
public class ReserveForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private Integer reserveId;
	
	private String userId;
	
	private String roomId;
	
	private int reserveSeat;
	

	public Integer getReserveId() {
		return reserveId;
	}

	public void setReserveId(Integer reserveId) {
		this.reserveId = reserveId;
	}



	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public int getReserveSeat() {
		return reserveSeat;
	}

	public void setReserveSeat(int reserveSeat) {
		this.reserveSeat = reserveSeat;
	}


}


