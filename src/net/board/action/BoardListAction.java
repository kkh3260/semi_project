package net.board.action;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDTO;
import net.board.db.BoardDAO;

 public class BoardListAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		BoardDAO boarddao = new BoardDAO();
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		
		int page = 1;
		int limit = 10;
		
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int listcount = boarddao.getListCount(); // 총 리스트 수를 받아옴
		boardlist = boarddao.getBoardList(page, limit); // 리스트를 받아옴
		
		//총 페이지 수
		// ex : 11페이지의 경우 1.1+0.95 = 2.05 => 2 최대 페이지는 2가됨 
 		int maxpage=(int)((double)listcount/limit+0.95); // 0.95를 더해서 올림 처리
 		
 		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
 		int startpage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
 		
 		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = startpage+10-1;
		
		// 현재페이지의 마지막 페이지 표기
 		if (endpage > maxpage) endpage= maxpage;

 		request.setAttribute("page", page); // 현재 페이지 수
 		request.setAttribute("maxpage", maxpage); // 최대 페이지 수
 		request.setAttribute("startpage", startpage); // 현재 페이지에 표시할 첫 페이지 수
 		request.setAttribute("endpage", endpage); // 현재 페이지에 표시할 끝 페이지 수
		request.setAttribute("listcount", listcount); // 글 수
		request.setAttribute("boardlist", boardlist);
		
		ActionForward forward= new ActionForward();
	 	forward.setRedirect(false);
 		forward.setPath("./board/qna_board_list.jsp");
 		return forward;
	 }
 }