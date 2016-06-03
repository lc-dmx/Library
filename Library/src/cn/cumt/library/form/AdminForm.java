package cn.cumt.library.form;

import org.apache.struts.action.*;

//管理员bean
public class AdminForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private Integer adminId;// 管理员账号

	private String adminName;// 管理员名称

	private String adminPassword;// 管理员登录密码

	public Integer getAdminId() {
		return adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

}
