package cn.cumt.library.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import cn.cumt.library.dao.ReserveDao;
import cn.cumt.library.form.ReserveForm;



//后台订单管理的Action
public class ReserveAction extends Action {

	private int action;
	private ReserveDao dao = null;

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		dao = new ReserveDao();
		this.action = Integer.parseInt(request.getParameter("action"));
		switch (action) {

		case 1: {
			return checkReserve(mapping, form, request, response); // 抢到预约座位约小伙伴加入
		}
		case 6: {
			return orderJudge(mapping, form, request, response); // 抢到预约座位约小伙伴加入
		}


		}
		throw new java.lang.UnsupportedOperationException(
				"Method $execute() not yet implemented.");
	}

	// 1抢到预约座位约小伙伴加入
	public ActionForward checkReserve(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {	
		String userId = request.getParameter("userId");
		ReserveForm reserveForm = dao.selectReserveUserId(userId);
		if (reserveForm != null) {
			request.setAttribute("result", "您已预约过座位喽！如不合适请删除重新选座哦！");
		}
		return mapping.findForward("checkReserve");
	}	
	// 6抢到预约座位约小伙伴加入
	public ActionForward orderJudge(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
	String userId = request.getParameter("userId");
	ReserveForm reserveForm = dao.selectReserveUserId(userId);
	if (reserveForm == null) {
		request.setAttribute("result", "请先预约座位！！！");
	} 
	return mapping.findForward("orderJudge");
	}	
	
	
	
}



