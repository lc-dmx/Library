package cn.cumt.library.form;

import org.apache.struts.action.ActionForm;

public class SeatForm extends ActionForm {

	private static final long serialVersionUID = 1L;
	
	private String userId;
	
	private String rows;
	
	private String cols;
	
	private String status;
	
	private String reserveDate;
	
	private String reserveUseTime;
	
	private int reserveDuration;
	

	public String getRows() {
		return rows;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public String getCols() {
		return cols;
	}

	public void setCols(String cols) {
		this.cols = cols;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}

	public String getReserveUseTime() {
		return reserveUseTime;
	}

	public void setReserveUseTime(String reserveUseTime) {
		this.reserveUseTime = reserveUseTime;
	}

	public int getReserveDuration() {
		return reserveDuration;
	}

	public void setReserveDuration(int reserveDuration) {
		this.reserveDuration = reserveDuration;
	}


	
}
