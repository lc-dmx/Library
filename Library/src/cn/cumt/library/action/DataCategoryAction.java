package cn.cumt.library.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForward;
import org.apache.struts.action.Action;

import java.util.List;

import cn.cumt.library.dao.DataCategoryDao;
import cn.cumt.library.form.DataCategoryForm;


//商品大类别信息
public class DataCategoryAction
    extends Action {
	

	
  private int action;
  private DataCategoryDao dao = null;
  public ActionForward execute(ActionMapping mapping,
                               ActionForm form,
                               HttpServletRequest request,
                               HttpServletResponse response) {
    dao = new DataCategoryDao();
    this.action = Integer.parseInt(request.getParameter("action"));
    switch (action) {
      case 0: {
        return dataCategorySelect(mapping, form, request, response); //全部查询商品信息
      }
      case 2: {
        return dataCategoryInsert(mapping, form, request, response); //添加大类别的信息
      }
      case 3: {
        return dataCategoryDelete(mapping, form, request, response); //删除大类别的信息
      }
    }

    throw new java.lang.UnsupportedOperationException(
        "Method $execute() not yet implemented.");
  }


//删除大类别的信息
  public ActionForward dataCategoryDelete(ActionMapping mapping,
                                     ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {
    if (dao.deleteDataCategory(Integer.valueOf(request.getParameter("id")))) {
      request.setAttribute("result", "删除大类别信息成功");
    }
    else {
      request.setAttribute("result", "小类别还存在此信息，请先删除小类别信息");
    }

    return mapping.findForward("resultBigType");
  }

  
  
  
//添加大类别的信息
  public ActionForward dataCategoryInsert(ActionMapping mapping,
                                     ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {
	  DataCategoryForm dataCategoryForm=(DataCategoryForm) form;
    dao.insertDataCategory(dataCategoryForm);
    request.setAttribute("result", "添加大类别信息成功");
    return mapping.findForward("resultBigType");
  }



//全部查询商品信息
  public ActionForward dataCategorySelect(ActionMapping mapping,
                                     ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {
    List<DataCategoryForm> list = dao.selectDataCategory();
    int pageNumber = list.size(); //计算出有多少条记录
    int maxPage = pageNumber; //计算有多少页数
    String number = request.getParameter("i");
    if (maxPage % 6 == 0) {
      maxPage = maxPage / 6;
    }
    else {
      maxPage = maxPage / 6 + 1;
    }
    if (number == null) {
      number = "0";
    }
    request.setAttribute("number", String.valueOf(number));
    request.setAttribute("maxPage", String.valueOf(maxPage));
    request.setAttribute("pageNumber", String.valueOf(pageNumber));
    request.setAttribute("list", list);
    return mapping.findForward("bigTypeSelect");
  }

}
