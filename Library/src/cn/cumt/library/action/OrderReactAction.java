package cn.cumt.library.action;

import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;

import cn.cumt.library.dao.OrderReactDao;
import cn.cumt.library.form.OrderReactForm;

import org.apache.struts.action.ActionForward;

public class OrderReactAction extends Action{
	private int action;
	private OrderReactDao dao = null;

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		dao = new OrderReactDao();
		this.action = Integer.parseInt(request.getParameter("action"));
		switch (action) {
		case 0: {
			return selectOrderReact(mapping, form, request, response); // 查询所有评论
		}
		case 1: {
			return insertOrderReact(mapping, form, request, response); // 添加约吧
		}
		case 2: {
			return deleteOrderReact(mapping, form, request, response); // 删除约吧
		}
		case 3: {
			return selectOrderReactUser(mapping, form, request, response); // 以用户ID查询约吧信息
		}

		}
		throw new java.lang.UnsupportedOperationException(
				"Method $execute() not yet implemented.");
	}

	// 0查询所有操作
	public ActionForward selectOrderReact(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		Integer orderId=Integer.valueOf(request.getParameter("orderId"));
		List<OrderReactForm> list = dao.selectOrderReact(orderId);
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
		return mapping.findForward("selectOrderReact");
	}

	// 1添加操作
	public ActionForward insertOrderReact(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		OrderReactForm orderReactForm = (OrderReactForm) form;
				dao.insertOrderReact(orderReactForm);
		return mapping.findForward("insertOrderReact");
	}

	// 2删除操作
	public ActionForward deleteOrderReact(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		dao.deleteOrderReact(Integer.valueOf(request
				.getParameter("orderReactId")));
			return mapping.findForward("deleteOrderReact");
	}
	
	
	// 3用户ID查询帖子
	public ActionForward selectOrderReactUser(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("form",
				dao.selectOrderReactUser(request.getParameter("userId")));
		return mapping.findForward("selectOrderReactUser");
	}

}
