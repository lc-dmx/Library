package cn.cumt.library.form;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

//用户表的bean
public class UserForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private String userId; // 用户ID

	private String userPassword; // 用户密码

	private String userNumber; // 用户学号

	private String userNickName; // 用户昵称

	private Integer userScore; // 用户积分

	private String userEmail; // 用户电子邮件

	private Integer userSex; // 用户性别

	private String userStatus; // 用户封号判断

	private String userBirthday; // 用户生日

	private String userPicture;// 用户图片路径

	private FormFile userFormFile;// 用户上传图片

	private String userPhone; // 用户电话

	private String userQuestion;// 用户密保问题

	private String userAnswer; // 用户密保答案
	
	private String userSort; //用户类别

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public Integer getUserScore() {
		return userScore;
	}

	public void setUserScore(Integer userScore) {
		this.userScore = userScore;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Integer getUserSex() {
		return userSex;
	}

	public void setUserSex(Integer userSex) {
		this.userSex = userSex;
	}



	public String getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(String userBirthday) {
		this.userBirthday = userBirthday;
	}

	public String getUserPicture() {
		return userPicture;
	}

	public void setUserPicture(String userPicture) {
		this.userPicture = userPicture;
	}

	public FormFile getUserFormFile() {
		return userFormFile;
	}

	public void setUserFormFile(FormFile userFormFile) {
		this.userFormFile = userFormFile;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserQuestion() {
		return userQuestion;
	}

	public void setUserQuestion(String userQuestion) {
		this.userQuestion = userQuestion;
	}

	public String getUserAnswer() {
		return userAnswer;
	}

	public void setUserAnswer(String userAnswer) {
		this.userAnswer = userAnswer;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	public String getUserSort() {
		return userSort;
	}

	public void setUserSort(String userSort) {
		this.userSort = userSort;
	}

}
