package cn.cumt.library.action;

import java.io.IOException;
import java.util.List;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForward;
import org.apache.struts.action.Action;
import org.apache.struts.upload.FormFile;

import cn.cumt.library.dao.OrderDao;
import cn.cumt.library.dao.OrderReactDao;
import cn.cumt.library.form.OrderForm;
import cn.cumt.library.tool.UploadFile;


//后台订单管理的Action
public class OrderAction extends Action {
	private int action;
	private OrderDao order = null;
	private OrderReactDao orderReact=null;
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		action = Integer.parseInt(request.getParameter("action"));
		order = new OrderDao();
		orderReact = new OrderReactDao();
		switch (action) {

		case 0: {
			return selectOrder(mapping, form, request, response); // 根据用户Id查询信息
		}
		case 1: {
			return insertOrder(mapping, form, request, response); // 插入订单
		}
		case 2: {
			return deleteOrder(mapping, form, request, response); // 删除邀约
		}
		case 4: {
			return selectOrderId(mapping, form, request, response); // 通过订单查询信息
		}


		}
		throw new java.lang.UnsupportedOperationException(
				"Method $execute() not yet implemented.");
	}

	
	// 0查询所有操作
	public ActionForward selectOrder(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List<OrderForm> list = null;
		list = order.selectOrder();
		int pageNumber = list.size(); // 计算出有多少条记录
		int maxPage = pageNumber; // 计算有多少页数
		String number = request.getParameter("i");
		if (maxPage % 4 == 0) {
			maxPage = maxPage / 4;
		} else {
			maxPage = maxPage / 4 + 1;
		}
		if (number == null) {
			number = "0";
		}
		request.setAttribute("number", String.valueOf(number));
		request.setAttribute("maxPage", String.valueOf(maxPage));
		request.setAttribute("pageNumber", String.valueOf(pageNumber));
		request.setAttribute("list", list);
		return mapping.findForward("selectOrder");
	}
	
	
	// 1插入订单	
	public ActionForward insertOrder(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// 调用上传工具类，指定图片存放地址
		UploadFile uploadFile = new UploadFile();
		OrderForm orderForm = (OrderForm) form;

		String dir = servlet.getServletContext().getRealPath("/orderPicture");
		FormFile orderFormFile = orderForm.getOrderFormFile();
		String getType = orderFormFile.getFileName().substring(
				orderFormFile.getFileName().lastIndexOf(".") + 1);
		// 限定上传图片类型
		String result = "上传图片格式不对";
		String imageType[] = { "JPG", "jpg", "gif", "bmp", "BMP" };
		for (int ii = 0; ii < imageType.length; ii++) {
			if (imageType[ii].equals(getType)) {
				orderForm.setUserId(request.getParameter("userId"));
				orderForm.setOrderAddress(request.getParameter("orderAddress"));
				orderForm.setOrderDate(request.getParameter("orderDate"));
				orderForm.setOrderSeat(request.getParameter("orderSeat"));
				orderForm.setOrderMajor(request.getParameter("orderMajor"));
				orderForm.setOrderSubject(request.getParameter("orderSubject"));
				orderForm.setOrderPicture("orderPicture/"
						+ uploadFile.upload(dir, orderFormFile));
				order.insertOrder(orderForm);
				result = "资料更新成功";
			}
		}
		request.setAttribute("result", result);
		return mapping.findForward("insertOrder");
	}
	
	// 2删除操作
	public ActionForward deleteOrder(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		orderReact.deleteOrderReactId(Integer.valueOf(request.getParameter("orderId"))); 
		order.deleteOrder(Integer.valueOf(request.getParameter("orderId"))); 
			return mapping.findForward("deleteOrder");
	}
	
	
	
	// 4 orderID查询邀请
	public ActionForward selectOrderId(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("orderForm",
				order.selectOrderId(Integer.valueOf(request.getParameter("orderId"))));
		return mapping.findForward("selectOrderId");
	}

	
	
	
}