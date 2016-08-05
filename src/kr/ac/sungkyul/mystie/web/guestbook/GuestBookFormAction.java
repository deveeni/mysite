package kr.ac.sungkyul.mystie.web.guestbook;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.sungkyul.mystie.dao.GuestBookDao;
import kr.ac.sungkyul.mystie.vo.GuestBookVo;
import kr.ac.sungkyul.web.Action;
import kr.ac.sungkyul.web.WebUtil;

public class GuestBookFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestBookDao dao = new GuestBookDao();
		List<GuestBookVo> list = dao.getList();
		
		//request범위에 list저장
		request.setAttribute("list", list);
		
		
		//fowarding
		WebUtil.forward("/WEB-INF/views/guestbook/list.jsp", request, response);
	}

}
