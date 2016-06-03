package cn.cumt.library.form;

import java.util.List;

import org.apache.struts.action.ActionForm;

//资料目录bean
public class DataCategoryForm extends ActionForm {
	private static final long serialVersionUID = 1L;

	private Integer dataCategoryId;

	private Integer dataUpperCategoryId;
	
	private String dataCategoryName;

	private String dataDescription;

	private List<DataCategoryForm> childCategory;

	public Integer getDataCategoryId() {
		return dataCategoryId;
	}

	public void setDataCategoryId(Integer dataCategoryId) {
		this.dataCategoryId = dataCategoryId;
	}

	public String getDataCategoryName() {
		return dataCategoryName;
	}

	public void setDataCategoryName(String dataCategoryName) {
		this.dataCategoryName = dataCategoryName;
	}

	public String getDataDescription() {
		return dataDescription;
	}

	public void setDataDescription(String dataDescription) {
		this.dataDescription = dataDescription;
	}

	public Integer getDataUpperCategoryId() {
		return dataUpperCategoryId;
	}

	public void setDataUpperCategoryId(Integer dataUpperCategoryId) {
		this.dataUpperCategoryId = dataUpperCategoryId;
	}

	public List<DataCategoryForm> getChildCategory() {
		return childCategory;
	}

	public void setChildCategory(List<DataCategoryForm> childCategory) {
		this.childCategory = childCategory;
	}

}
