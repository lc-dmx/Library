package cn.cumt.library.form;

import javax.servlet.http.*;

import org.apache.struts.action.*;
import org.apache.struts.upload.FormFile;

//座位预定表的bean
public class OrderForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private Integer orderId;

	private String userId;

	private String orderStatus;

	private String orderDate;

	private String orderAddress;

	private String orderPicture;
	
	private String orderSeat;
	
	private String orderMajor;
	
	private String orderSubject;

	private FormFile orderFormFile;// 用户上传图片

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public String getOrderPicture() {
		return orderPicture;
	}

	public void setOrderPicture(String orderPicture) {
		this.orderPicture = orderPicture;
	}

	public FormFile getOrderFormFile() {
		return orderFormFile;
	}

	public void setOrderFormFile(FormFile orderFormFile) {
		this.orderFormFile = orderFormFile;
	}

	public ActionErrors validate(ActionMapping actionMapping,
			HttpServletRequest httpServletRequest) {
		return null;
	}

	public void reset(ActionMapping actionMapping,
			HttpServletRequest servletRequest) {
	}

	public String getOrderSeat() {
		return orderSeat;
	}

	public void setOrderSeat(String orderSeat) {
		this.orderSeat = orderSeat;
	}

	public String getOrderMajor() {
		return orderMajor;
	}

	public void setOrderMajor(String orderMajor) {
		this.orderMajor = orderMajor;
	}

	public String getOrderSubject() {
		return orderSubject;
	}

	public void setOrderSubject(String orderSubject) {
		this.orderSubject = orderSubject;
	}

}
