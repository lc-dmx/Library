package cn.cumt.library.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import cn.cumt.library.dao.CommentDao;
import cn.cumt.library.dao.PostDao;
import cn.cumt.library.form.PostForm;
import cn.cumt.library.tool.UploadFile;

public class PostAction extends Action {

	private int action;
	private PostDao post = null;
	private CommentDao comment=null;

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		post = new PostDao();
		comment = new CommentDao();
		this.action = Integer.parseInt(request.getParameter("action"));
		switch (action) {
		case 0: {
			return selectPost(mapping, form, request, response); // 查询所有帖子
		}
		case 1: {
			return insertPost(mapping, form, request, response); // 添加帖子
		}
		case 2: {
			return deletePost(mapping, form, request, response); // 删除帖子
		}
		case 3: {
			return selectPostUser(mapping, form, request, response); // 以用户ID查询帖子
		}
		case 4: {
			return selectPostId(mapping, form, request, response); // 以postID查询帖子
		}

		}
		throw new java.lang.UnsupportedOperationException(
				"Method $execute() not yet implemented.");
	}

	// 0查询所有操作
	public ActionForward selectPost(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List<PostForm> list = null;
		list = post.selectPost();
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
		return mapping.findForward("selectPost");
	}

	// 1添加操作
	public ActionForward insertPost(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		// 调用上传工具类，指定图片存放地址
		UploadFile uploadFile1 = new UploadFile();
		UploadFile uploadFile2 = new UploadFile();
		UploadFile uploadFile3 = new UploadFile();
		PostForm postForm = (PostForm) form;

		String dir = servlet.getServletContext().getRealPath("/postPicture");

		FormFile postFormFile1 = postForm.getPostFormFile1();
		FormFile postFormFile2 = postForm.getPostFormFile2();
		FormFile postFormFile3 = postForm.getPostFormFile3();

		String getType1 = postFormFile1.getFileName().substring(
				postFormFile1.getFileName().lastIndexOf(".") + 1);
		// 限定上传图片类型
		String getType2 = postFormFile2.getFileName().substring(
				postFormFile1.getFileName().lastIndexOf(".") + 1);
		// 限定上传图片类型
		String getType3 = postFormFile3.getFileName().substring(
				postFormFile1.getFileName().lastIndexOf(".") + 1);
		// 限定上传图片类型

		String result = "上传图片格式不对";
		String imageType[] = { "JPG", "jpg", "gif", "bmp", "BMP", "PNG", "png" };
		for (int ii = 0; ii < imageType.length; ii++) {
			if ((imageType[ii].equals(getType1))
					&& (imageType[ii].equals(getType2))
					&& (imageType[ii].equals(getType3))) {
				postForm.setUserId(request.getParameter("userId"));
				postForm.setPostTitle(request.getParameter("postTitle"));
				postForm.setPostContent(request.getParameter("postContent"));

				postForm.setPostPicture1("postPicture/"
						+ uploadFile1.upload(dir, postFormFile1));
				postForm.setPostPicture2("postPicture/"
						+ uploadFile2.upload(dir, postFormFile2));
				postForm.setPostPicture3("postPicture/"
						+ uploadFile3.upload(dir, postFormFile3));
				postForm.setPostPosition(request.getParameter("postPosition"));
				post.insertPost(postForm);
				result = "帖子发布成功";
			}
		}
		request.setAttribute("result", result);
		return mapping.findForward("insertPost");
	}

	// 2删除操作
	public ActionForward deletePost(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		comment.deleteCommentPost(Integer.valueOf(request.getParameter("postId"))); 
		post.deletePost(Integer.valueOf(request.getParameter("postId"))); 
			return mapping.findForward("deletePost");
	}

	// 3用户ID查询帖子
	public ActionForward selectPostUser(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("postForm",
				post.selectPostUser(request.getParameter("userId")));
		return mapping.findForward("selectPostUser");
	}

	// 4postID查询帖子
	public ActionForward selectPostId(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("postForm",
				post.selectPostId(Integer.valueOf(request.getParameter("postId"))));
		return mapping.findForward("selectPostId");
	}
}
