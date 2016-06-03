package cn.cumt.library.form;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

//资料bean
public class DataForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private Integer dataId;

	private Integer dataCategoryId;

	private String userId;

	private String dataName;

	private String dataDate;

	private String dataScore;

	private String dataPicture;

	private FormFile dataFormFile;
	
	private String material;
	
	private FormFile materialFormFile;
	

	public Integer getDataId() {
		return dataId;
	}

	public void setDataId(Integer dataId) {
		this.dataId = dataId;
	}

	public Integer getDataCategoryId() {
		return dataCategoryId;
	}

	public void setDataCategoryId(Integer dataCategoryId) {
		this.dataCategoryId = dataCategoryId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDataName() {
		return dataName;
	}

	public void setDataName(String dataName) {
		this.dataName = dataName;
	}

	public String getDataScore() {
		return dataScore;
	}

	public void setDataScore(String dataScore) {
		this.dataScore = dataScore;
	}

	public String getDataPicture() {
		return dataPicture;
	}

	public void setDataPicture(String dataPicture) {
		this.dataPicture = dataPicture;
	}

	public String getDataDate() {
		return dataDate;
	}

	public void setDataDate(String dataDate) {
		this.dataDate = dataDate;
	}

	public FormFile getDataFormFile() {
		return dataFormFile;
	}

	public void setDataFormFile(FormFile dataFormFile) {
		this.dataFormFile = dataFormFile;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public FormFile getMaterialFormFile() {
		return materialFormFile;
	}

	public void setMaterialFormFile(FormFile materialFormFile) {
		this.materialFormFile = materialFormFile;
	}

}
