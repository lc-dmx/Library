package cn.cumt.library.form;

import org.apache.struts.action.*;

//座位预定表的bean
public class OrderReactForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private Integer orderReactId;

	private Integer orderId;
	
	private String userId;

	private String orderReactDate;

	private String orderReactStatus;
	
	private String orderPhone;
	
	private String orderReactContent;

	public Integer getOrderReactId() {
		return orderReactId;
	}

	public void setOrderReactId(Integer orderReactId) {
		this.orderReactId = orderReactId;
	}



	public String getOrderReactDate() {
		return orderReactDate;
	}

	public void setOrderReactDate(String orderReactDate) {
		this.orderReactDate = orderReactDate;
	}

	public String getOrderReactStatus() {
		return orderReactStatus;
	}

	public void setOrderReactStatus(String orderReactStatus) {
		this.orderReactStatus = orderReactStatus;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	public String getOrderReactContent() {
		return orderReactContent;
	}

	public void setOrderReactContent(String orderReactContent) {
		this.orderReactContent = orderReactContent;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
