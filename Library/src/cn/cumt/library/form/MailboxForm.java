package cn.cumt.library.form;
import org.apache.struts.action.ActionForm;

//邮箱bean
public class MailboxForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private Integer mailboxId;
	
	private String sender;

	private String receiver;

	private String title;

	private String comment;
	
	private String email;
	
	private String date;

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Integer getMailboxId() {
		return mailboxId;
	}

	public void setMailboxId(Integer mailboxId) {
		this.mailboxId = mailboxId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}

