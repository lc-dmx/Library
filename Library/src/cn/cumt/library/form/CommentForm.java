package cn.cumt.library.form;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

public class CommentForm extends ActionForm {
	private static final long serialVersionUID = 1L;

	private Integer commentId;// 评论ID

	private Integer postId;// 分享贴ID

	private String userId;// 用户ID

	private String commentContent;// 评论内容

	private String commentDate;// 评论时间

	private String commentPicture1;// 评论照片

	private String commentPicture2;// 评论照片

	private String commentPicture3;// 评论照片

	private FormFile commentFormFile;// 评论上传图片

	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public Integer getPostId() {
		return postId;
	}

	public void setPostId(Integer postId) {
		this.postId = postId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}

	public FormFile getCommentFormFile() {
		return commentFormFile;
	}

	public void setCommentFormFile(FormFile commentFormFile) {
		this.commentFormFile = commentFormFile;
	}

	public String getCommentPicture1() {
		return commentPicture1;
	}

	public void setCommentPicture1(String commentPicture1) {
		this.commentPicture1 = commentPicture1;
	}

	public String getCommentPicture2() {
		return commentPicture2;
	}

	public void setCommentPicture2(String commentPicture2) {
		this.commentPicture2 = commentPicture2;
	}

	public String getCommentPicture3() {
		return commentPicture3;
	}

	public void setCommentPicture3(String commentPicture3) {
		this.commentPicture3 = commentPicture3;
	}

}
