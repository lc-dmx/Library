package cn.cumt.library.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForward;

import cn.cumt.library.dao.UserDao;
import cn.cumt.library.form.UserForm;
import cn.cumt.library.tool.UploadFile;

import org.apache.struts.action.Action;
import org.apache.struts.upload.FormFile;

import java.io.IOException;
import java.util.*;

//用户管理Action
public class UserAction extends Action {
	private int action;
	private UserDao dao = null;

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		dao = new UserDao();
		action = Integer.parseInt(request.getParameter("action"));

		switch (action) {
		case 0: {
			return selectUser(mapping, form, request, response); // 管理员查看全部用户信息
		}
		case 1: {
			return insertUser(mapping, form, request, response); // 添加用户信息
		}
		case 2: {
			return deleteUser(mapping, form, request, response); // 管理员删除用户信息
		}
		case 3: {
			return updateUser(mapping, form, request, response); // 修改用户属性
		}
		case 4: {
			return selectUserId(mapping, form, request, response); // 用户查询用户的信息
		}
		case 5: {
			return selectUserDetail(mapping, form, request, response); // 查看用户的详细信息
		}
		case 6: {
			return userLogin(mapping, form, request, response); // 用户登录
		}
		case 7: {
			return checkUserPassword(mapping, form, request, response); // 用户、邮箱找回密码
		}
		case 8: {
			return updateUserPassword(mapping, form, request, response); // 用户修改密码
		}
		case 9: {
			return updateUserPicture(mapping, form, request, response); // 用户修改头像
		}

		}
		throw new java.lang.UnsupportedOperationException(
				"Method $execute() not yet implemented.");
	}

	// 0管理员查看全部用户信息
	public ActionForward selectUser(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List<UserForm> list = dao.selectUser();
		int pageNumber = list.size(); // 计算出有多少条记录
		int maxPage = pageNumber; // 计算有多少页数
		String number = request.getParameter("i");
		if (maxPage % 7 == 0) {
			maxPage = maxPage / 7;
		} else {
			maxPage = maxPage / 7 + 1;
		}
		if (number == null) {
			number = "0";
		}
		request.setAttribute("number", String.valueOf(number));
		request.setAttribute("maxPage", String.valueOf(maxPage));
		request.setAttribute("pageNumber", String.valueOf(pageNumber));
		request.setAttribute("list", list);
		return mapping.findForward("selectUser");
	}

	// 1添加用户信息
	public ActionForward insertUser(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// 先把数据库的信息放到userForm里，检验是否重名
		UserForm userForm = (UserForm) form;
		UserForm formSelect = dao.selectUserId(userForm.getUserId());
		if (formSelect == null || formSelect.equals("")) {
			dao.insertUser(userForm);
			request.setAttribute("result", "注册成功");
		} else {
			request.setAttribute("result", "该会员名称已经存在,请重新注册！！");
		}
		return mapping.findForward("insertUser");
	}

	// 2管理员删除用户信息
	public ActionForward deleteUser(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		if (!dao.deleteUser(request.getParameter("userId"))) {
			return mapping.findForward("deleteUserFalse");
		} else {
			return selectUser(mapping, form, request, response);
		}
	}

	// 3修改用户信息
	public ActionForward updateUser(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		UserForm userForm = (UserForm) form;
				userForm.setUserId(request.getParameter("userId"));
				userForm.setUserNickName(request.getParameter("userNickName"));
				userForm.setUserNumber(request.getParameter("userNumber"));
				userForm.setUserEmail(request.getParameter("userEmail"));
				userForm.setUserSex(Integer.valueOf(request
						.getParameter("userSex")));
				userForm.setUserBirthday(request.getParameter("userBirthday"));
				userForm.setUserPhone(request.getParameter("userPhone"));
				userForm.setUserQuestion(request.getParameter("userQuestion"));
				userForm.setUserAnswer(request.getParameter("userAnswer"));
				dao.updateUser(userForm);
				String result = "资料更新成功";
		request.setAttribute("result", result);
		return mapping.findForward("updateUser");
	}

	// 4用户查询用户信息
	public ActionForward selectUserId(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("form",
				dao.selectUserId(request.getParameter("userId")));
		return mapping.findForward("selectUserId");
	}

	// 5管理员查看用户详细信息
	public ActionForward selectUserDetail(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		String userId = request.getParameter("id");
		request.setAttribute("form", dao.selectUserId(userId));
		return mapping.findForward("selectUserDetail");
	}

	// 6用户登录
	public ActionForward userLogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("userPassword");
		String flag = request.getParameter("flag");
		UserForm userForm = dao.selectUserId(userId);
		String input = request.getParameter("input");
		HttpSession session = request.getSession();
		String code = (String) session.getAttribute("code");

		// set cookie
		if (flag != null && flag.equals("1")) {
			Cookie cookie = new Cookie("cookie_user", userId + "-"
					+ userPassword);
			cookie.setMaxAge(60 * 60 * 24 * 30); // cookie 保存30天
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("cookie_user", userId + "-" + null);
			cookie.setMaxAge(60 * 60 * 24 * 30); // cookie 保存30天
			response.addCookie(cookie);
		}

		if (userForm == null || userForm.equals("")) {
			request.setAttribute("result", "不存在此用户，请重新登录！！！");
		} else if (!userForm.getUserPassword().equals(userPassword)) {
			request.setAttribute("result", "密码错误，请重新登录！！！");
		} else if (!input.equals(code)) {
			request.setAttribute("result", "验证码错误，请重新登录！！！");
		} else if (!userForm.getUserStatus().equals("正常")) {
			request.setAttribute("result", "该账号已被停用!!!");
		} else {
			request.setAttribute("userForm", userForm);
		}
		return mapping.findForward("userLogin");
	}

	// 7用户密码找回
	public ActionForward checkUserPassword(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		String userId = request.getParameter("userId");
		String userEmail = request.getParameter("userEmail");
		UserForm userForm = dao.selectUserEmail(userId, userEmail);
		if (userForm == null || userForm.equals("")) {
			request.setAttribute("result", "此用户名或邮箱有错误,请重新输入！！！");
			return mapping.findForward("checkUserPasswordFalse");
		} else {
			request.setAttribute("userForm", userForm);
		}
		return mapping.findForward("checkUserPassword");
	}

	// 8修改用户信息
	public ActionForward updateUserPassword(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("userPassword");
		if (!dao.updateUserPassword(userId, userPassword)) {
			request.setAttribute("result", "修改失败，请重新尝试！");
		} else {
			request.setAttribute("result", "修改成功");
		}
		return mapping.findForward("userFindPasswordResult");
	}

	// 9修改用户图片
	public ActionForward updateUserPicture(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// 调用上传工具类，指定图片存放地址
		UploadFile uploadFile = new UploadFile();
		UserForm userForm = (UserForm) form;

		String dir = servlet.getServletContext().getRealPath("/userPicture");
		FormFile userFormFile = userForm.getUserFormFile();
		String getType = userFormFile.getFileName().substring(
				userFormFile.getFileName().lastIndexOf(".") + 1);
		// 限定上传图片类型
		String result = "上传图片格式不对";
		String imageType[] = { "JPG", "jpg", "gif", "bmp", "BMP","PNG","png" };
		for (int ii = 0; ii < imageType.length; ii++) {
			if (imageType[ii].equals(getType)) {
				userForm.setUserId(request.getParameter("userId"));
				userForm.setUserPicture("userPicture/"
						+ uploadFile.upload(dir, userFormFile));
				dao.updateUserPicture(userForm);
				result = "头像更新成功";
			}
		}
		request.setAttribute("result", result);
		return mapping.findForward("updateUser");
	}

	
	
}
