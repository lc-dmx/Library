package cn.cumt.library.action;

import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;

import cn.cumt.library.dao.CommentDao;
import cn.cumt.library.form.CommentForm;
import org.apache.struts.action.ActionForward;

public class CommentAction extends Action{
	private int action;
	private CommentDao dao = null;

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		dao = new CommentDao();
		this.action = Integer.parseInt(request.getParameter("action"));
		switch (action) {
		case 0: {
			return selectComment(mapping, form, request, response); // 查询所有评论
		}
		case 1: {
			return insertComment(mapping, form, request, response); // 添加评论
		}
		case 2: {
			return deleteComment(mapping, form, request, response); // 删除评论
		}
		case 3: {
			return selectCommentUser(mapping, form, request, response); // 以用户ID查询评论
		}

		}
		throw new java.lang.UnsupportedOperationException(
				"Method $execute() not yet implemented.");
	}

	// 0查询所有操作
	public ActionForward selectComment(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List<CommentForm> list = dao.selectComment();
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
		return mapping.findForward("selectComment");
	}

	// 1添加操作
	public ActionForward insertComment(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		// 调用上传工具类，指定图片存放地址
//		UploadFile uploadFile = new UploadFile();
		CommentForm commentForm = (CommentForm) form;

//		String dir = servlet.getServletContext().getRealPath("/commentPicture");
//		FormFile commentFormFile = commentForm.getCommentFormFile();
//		String getType = commentFormFile.getFileName().substring(
//				commentFormFile.getFileName().lastIndexOf(".") + 1);
		// 限定上传图片类型
//		String result = "上传图片格式不对";
//		String imageType[] = { "JPG", "jpg", "gif", "bmp", "BMP", "PNG", "png" };
//		for (int ii = 0; ii < imageType.length; ii++) {
//			if (imageType[ii].equals(getType)) {
//				commentForm.setPostId(Integer.valueOf(request.getParameter("postId")));
//				commentForm.setUserId(request.getParameter("userId"));
//				commentForm.setCommentContent(request.getParameter("commentContent"));
//				commentForm.setCommentPicture1("postPicture/"
//						+ uploadFile.upload(dir, commentFormFile));
				dao.insertComment(commentForm);
			String result = "评论发布成功";
//			}
//		}
		request.setAttribute("result", result);
		return mapping.findForward("insertComment");
	}

	// 2删除操作
	public ActionForward deleteComment(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		dao.deleteComment(Integer.valueOf(request.getParameter("commentId")));
			return mapping.findForward("deleteComment");
	}
	
	
	// 3用户ID查询帖子
	public ActionForward selectCommentUser(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("form",
				dao.selectCommentUser(request.getParameter("userId")));
		return mapping.findForward("selectCommentUser");
	}

}
