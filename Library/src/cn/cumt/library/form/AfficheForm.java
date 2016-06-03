package cn.cumt.library.form;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import javax.servlet.http.HttpServletRequest;

//公告栏
public class AfficheForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private Integer afficheId;

	private String afficheName;

	private String afficheContent;

	private String afficheDate;

	public Integer getAfficheId() {
		return afficheId;
	}

	public void setAfficheId(Integer afficheId) {
		this.afficheId = afficheId;
	}

	public String getAfficheName() {
		return afficheName;
	}

	public void setAfficheName(String afficheName) {
		this.afficheName = afficheName;
	}

	public String getAfficheContent() {
		return afficheContent;
	}

	public void setAfficheContent(String afficheContent) {
		this.afficheContent = afficheContent;
	}

	public String getAfficheDate() {
		return afficheDate;
	}

	public void setAfficheDate(String afficheDate) {
		this.afficheDate = afficheDate;
	}

	public ActionErrors validate(ActionMapping actionMapping,
			HttpServletRequest httpServletRequest) {
		return null;
	}

	public void reset(ActionMapping actionMapping,
			HttpServletRequest servletRequest) {
	}
}
