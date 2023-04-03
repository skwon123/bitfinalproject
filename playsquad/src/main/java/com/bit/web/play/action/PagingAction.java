package com.bit.web.play.action;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import com.bit.web.play.dao.playDao;
import com.bit.web.play.vo.pageBean;
@Component
public class PagingAction {
	@Resource(name = "playDao")
	private playDao dao;
	
	public pageBean paging(HttpServletRequest request,HashMap<String, Object>map) {
		int pageScacle=10;
		int totalRow=dao.getTotalRow(map);
		int totalPage=totalRow%pageScacle==0?totalRow/pageScacle:(totalRow/pageScacle)+1;
		if(totalRow==0)totalPage=1;		
		int currentPage=1;
		try {
			currentPage=Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		int start=1+(currentPage-1)*pageScacle;
		int end=pageScacle+(currentPage-1)*pageScacle;
		
		int currentBlock=currentPage%pageScacle==0?currentPage/pageScacle:(currentPage/pageScacle)+1; 
		
		int startPage=1+(currentBlock-1)*pageScacle;
		int endPage=pageScacle+(currentBlock-1)*pageScacle;		
		endPage=totalPage<=endPage?totalPage:endPage;		
		return new pageBean(totalPage, start, end, currentPage, currentBlock, startPage, endPage);
	}
}
