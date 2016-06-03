package cn.cumt.library.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import cn.cumt.library.dao.MailboxDao;
import cn.cumt.library.form.MailboxForm;

public class MailboxAction extends Action {

	private int action;
	private MailboxDao dao = null;

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		dao = new MailboxDao();
		this.action = Integer.parseInt(request.getParameter("action"));
		switch (action) {
		case 0: {
			return selectMailbox(mapping, form, request, response); // 查询所有邮件
		}
		case 1: {
			return insertMailbox(mapping, form, request, response); // 发送邮件
		}
/*		case 2: {
			return deletePost(mapping, form, request, response); // 删除帖子
		}
		case 3: {
			return selectPostUser(mapping, form, request, response); // 以用户ID查询帖子
		}
		case 4: {
			return selectPostId(mapping, form, request, response); // 以postID查询帖子
		}*/

		}
		throw new java.lang.UnsupportedOperationException(
				"Method $execute() not yet implemented.");
	}

	// 0查询所有操作
	public ActionForward selectMailbox(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String receiver=request.getParameter("receiver");
		List<MailboxForm> list = null;
		list = dao.selectMailboxReceiver(receiver);
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
		return mapping.findForward("selectMailbox");
	}

	// 1添加操作
	public ActionForward insertMailbox(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		MailboxForm mailboxForm = (MailboxForm) form;
				dao.insertMailbox(mailboxForm);
			String	result = "投寄成功";
		request.setAttribute("result", result);
		return mapping.findForward("insertMailbox");
	}

/*	// 2删除操作
	public ActionForward deletePost(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		if (!dao.deletePost(Integer.valueOf(request.getParameter("postId")))) {
			return mapping.findForward("deletePost");
		}
		return selectPost(mapping, form, request, response);
	}

	// 3用户ID查询帖子
	public ActionForward selectPostUser(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("postForm",
				dao.selectPostUser(request.getParameter("userId")));
		return mapping.findForward("selectPostUser");
	}

	// 4postID查询帖子
	public ActionForward selectPostId(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("postForm",
				dao.selectPostId(Integer.valueOf(request.getParameter("postId"))));
		return mapping.findForward("selectPostId");
	}*/
}
