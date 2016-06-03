package cn.cumt.library.form;

import org.apache.struts.action.ActionForm;

public class RoomForm extends ActionForm{

	private static final long serialVersionUID = 1L;
	
	private String roomId;
	
	private String roomName;
	
	private int roomSeatSum;
	
	private int roomSeatRest;
	

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getRoomSeatSum() {
		return roomSeatSum;
	}

	public void setRoomSeatSum(int roomSeatSum) {
		this.roomSeatSum = roomSeatSum;
	}

	public int getRoomSeatRest() {
		return roomSeatRest;
	}

	public void setRoomSeatRest(int roomSeatRest) {
		this.roomSeatRest = roomSeatRest;
	}


}
