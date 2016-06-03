package cn.cumt.library.form;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

//用户表的bean
public class PostForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private Integer postId;

	private String userId;

	private String postTitle;

	private String postContent;

	private String postDate;

	private String postClick;

	private String postPicture1;

	private String postPicture2;

	private String postPicture3;

	private String postPosition;

	private FormFile postFormFile1;

	private FormFile postFormFile2;

	private FormFile postFormFile3;

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

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPostDate() {
		return postDate;
	}

	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}

	public String getPostClick() {
		return postClick;
	}

	public void setPostClick(String postClick) {
		this.postClick = postClick;
	}

	public String getPostPicture1() {
		return postPicture1;
	}

	public void setPostPicture1(String postPicture1) {
		this.postPicture1 = postPicture1;
	}

	public String getPostPicture2() {
		return postPicture2;
	}

	public void setPostPicture2(String postPicture2) {
		this.postPicture2 = postPicture2;
	}

	public String getPostPicture3() {
		return postPicture3;
	}

	public void setPostPicture3(String postPicture3) {
		this.postPicture3 = postPicture3;
	}

	public String getPostPosition() {
		return postPosition;
	}

	public void setPostPosition(String postPosition) {
		this.postPosition = postPosition;
	}

	public FormFile getPostFormFile1() {
		return postFormFile1;
	}

	public void setPostFormFile1(FormFile postFormFile1) {
		this.postFormFile1 = postFormFile1;
	}

	public FormFile getPostFormFile2() {
		return postFormFile2;
	}

	public void setPostFormFile2(FormFile postFormFile2) {
		this.postFormFile2 = postFormFile2;
	}

	public FormFile getPostFormFile3() {
		return postFormFile3;
	}

	public void setPostFormFile3(FormFile postFormFile3) {
		this.postFormFile3 = postFormFile3;
	}

}
