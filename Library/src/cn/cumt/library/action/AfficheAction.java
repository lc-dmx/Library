package cn.cumt.library.action;

import org.apache.struts.action.*;

import javax.servlet.http.*;

import cn.cumt.library.dao.AfficheDao;
import cn.cumt.library.form.AfficheForm;

import java.util.List;


//公告信息的Action
public class AfficheAction
    extends Action {
  private AfficheDao dao = null;
  private int action;
  public ActionForward execute(ActionMapping mapping,
                               ActionForm form,
                               HttpServletRequest request,
                               HttpServletResponse response) {
    dao = new AfficheDao();
    this.action = Integer.parseInt(request.getParameter("action"));
    switch (action) {
    case 0: {
        return afficheSelect(mapping, form, request, response); //对公告信息全部查询功能
      }
      case 2: {
        return afficheInsert(mapping, form, request, response); //添加公告信息
      }
      case 3: {
        return afficheDelete(mapping, form, request, response); //以数据库流水号为条件删除公告信息
      }
      case 4: {
        return afficheSelectOne(mapping, form, request, response); //以数据库流水号为条件查询公告信息
      }
      case 5: {
        return afficheUpdate(mapping, form, request, response); //以数据库流水号为条件修改公告信息
      }
      case 6: {
      return afficheContent(mapping, form, request, response);   //以数据库流水号为条件查询公告信息的内容
    }
    }
    throw new java.lang.UnsupportedOperationException(
        "Method $execute() not yet implemented.");
  }

  //以数据库流水号为条件查询公告信息的内容
  public ActionForward afficheContent(ActionMapping mapping, ActionForm form,
                                       HttpServletRequest request,
                                       HttpServletResponse response){
   request.setAttribute("affiche",dao.selectOneAffiche(Integer.valueOf(request.getParameter("id"))));
   return mapping.findForward("afficheContent");
  }
  //以数据库流水号为条件查询公告信息
      public ActionForward afficheSelectOne(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) {
    request.setAttribute("affiche",
                         dao.selectOneAffiche(Integer.valueOf(request.
        getParameter("id"))));

    return mapping.findForward("afficheSelectOne");
  }

    //以数据库流水号为条件修改公告信息
  public ActionForward afficheUpdate(ActionMapping mapping, ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {
    AfficheForm afficheForm = (AfficheForm) form;
    dao.updateAffiche(afficheForm);
    return afficheSelect(mapping, form, request, response);
  }

  //对公告信息的全部查询功能
  public ActionForward afficheSelect(ActionMapping mapping, ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {
    List<AfficheForm> list = dao.selectAffiche();
    int pageNumber = list.size(); //计算出有多少条记录
    int maxPage = pageNumber; //计算有多少页数
    String number = request.getParameter("i");
    if (maxPage % 7 == 0) {
      maxPage = maxPage / 7;
    }
    else {
      maxPage = maxPage / 7 + 1;
    }
    if (number == null) {
      number = "0";
    }
    request.setAttribute("number", String.valueOf(number));
    request.setAttribute("maxPage", String.valueOf(maxPage));
    request.setAttribute("pageNumber", String.valueOf(pageNumber));
    request.setAttribute("list", list);
    return mapping.findForward("afficheSelect");
  }


  //添加公告信息
  public ActionForward afficheInsert(ActionMapping mapping, ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {
    AfficheForm afficheForm = (AfficheForm) form;
    dao.insertAffiche(afficheForm);
    return afficheSelect(mapping, form, request, response);
  }

  //以数据库流水号为条件删除公告信息
  public ActionForward afficheDelete(ActionMapping mapping, ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {
    dao.deleteAffiche(Integer.valueOf(request.getParameter("id")));
    return afficheSelect(mapping, form, request, response);
  }

}
