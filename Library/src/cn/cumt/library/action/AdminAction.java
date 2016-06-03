package cn.cumt.library.action;

import org.apache.struts.action.*;
import javax.servlet.http.*;
import cn.cumt.library.dao.AdminDao;
import cn.cumt.library.form.AdminForm;
import java.util.*;

//后台管理员的Action
public class AdminAction extends Action {
	private AdminDao dao = null;
	private int action;

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		dao = new AdminDao();
		action = Integer.parseInt(request.getParameter("action"));
		switch (action) {
		case 0: {
			return adminCheck(mapping, form, request, response); // 判断管理员登录后台
		}
		case 1: {
			return adminSelect(mapping, form, request, response); // 查询所有的管理员信息
		}
		case 2: {
			return adminInsert(mapping, form, request, response); // 添加管理员信息
		}
		case 3: {
			return adminDelete(mapping, form, request, response); // 删除管理员信息
		}
		case 4: {
			return adminUpdatePassword(mapping, form, request, response); // 转向修改密码的页面
		}
		}
		throw new java.lang.UnsupportedOperationException(
				"Method $execute() not yet implemented.");
	}

	// 0 判断管理员登录后台
	public ActionForward adminCheck(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String adminName = request.getParameter("adminName");
		AdminForm adminForm = dao.selectAdminName(adminName);
		if (adminForm == null) {
			request.setAttribute("result", "您输入的账号不存在！");
		} else if (!adminForm.getAdminPassword().equals(
				request.getParameter("adminPassword"))) {
			request.setAttribute("result", "您输入的密码不存在！");
		} else {
			request.setAttribute("admin", adminForm);
		}
		return mapping.findForward("checkAdminResult");
	}
	// 1查询所有的管理员信息
	public ActionForward adminSelect(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List<AdminForm> list = dao.selectAdmin();
		int pageNumber = list.size(); // 计算出有多少条记录
		int maxPage = pageNumber; // 计算有多少页数
		String number = request.getParameter("i");
		if (maxPage % 14 == 0) {
			maxPage = maxPage / 14;
		} else {
			maxPage = maxPage / 14 + 1;
		}
		if (number == null) {
			number = "0";
		}
		request.setAttribute("number", String.valueOf(number));
		request.setAttribute("maxPage", String.valueOf(maxPage));
		request.setAttribute("pageNumber", String.valueOf(pageNumber));
		
		request.setAttribute("list", list);
		return mapping.findForward("adminSelect");
	}
	// 1添加管理员信息
	public ActionForward adminInsert(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		AdminForm adminForm = (AdminForm) form;
		
		AdminForm admin = dao.selectAdminName(adminForm.getAdminName());
		if (admin == null || admin.equals("")) {
			dao.insertAdmin(adminForm);
			return adminSelect(mapping, form, request, response);
		} else {
			request.setAttribute("result", "此用户名已经存在！！");
			return mapping.findForward("adminInsert");
		}
	}
	
	// 2修改管理员密码
	public ActionForward adminUpdatePassword(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		AdminForm adminForm = (AdminForm) form;
		adminForm.setAdminId(Integer.valueOf(request.getParameter("adminId")));
		adminForm.setAdminPassword(request.getParameter("adminPassword"));
		dao.updateAdminPassword(adminForm);
		request.setAttribute("result", "修改后台管理员密码成功，请重新登录！！");
		return mapping.findForward("adminUpdatePassword");
	}

	// 3删除管理员信息
	public ActionForward adminDelete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		dao.deleteAdmin(Integer.valueOf(request.getParameter("adminId")));
		request.setAttribute("result", "删除此用户名成功！");
		return adminSelect(mapping, form, request, response);
	}


}
