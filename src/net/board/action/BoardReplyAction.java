package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;

public class BoardReplyAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 	request.setCharacterEncoding("UTF-8");
		 	
			BoardDAO boarddao = new BoardDAO();
	   		BoardDTO boarddata = new BoardDTO();
	   		int result = 0;
	   		
	   		boarddata.setBoardNum(Integer.parseInt(request.getParameter("boardNum")));
	   		boarddata.setBoardName(request.getParameter("boardName"));
	   		boarddata.setBoardPass(request.getParameter("boardPass"));
	   		boarddata.setBoardSubject(request.getParameter("boardSubject"));
	   		boarddata.setBoardContent(request.getParameter("boardContent"));
	   		boarddata.setBoardReplyRef(Integer.parseInt(request.getParameter("boardReplyRef")));
	   		boarddata.setBoardReplyLev(Integer.parseInt(request.getParameter("boardReplyLev")));
	   		boarddata.setBoardReplySeq(Integer.parseInt(request.getParameter("boardReplySeq")));
	   		
	   		result = boarddao.boardReply(boarddata);
	   		
	   		if(result == 0){
	   			System.out.println("답장 실패");
	   			return null;
	   		}
	   		System.out.println("답장 완료");
	   		
	   		ActionForward forward = new ActionForward();
	   		
	   		forward.setRedirect(true);
	   		forward.setPath("./BoardDetailAction.bo?num="+result);
	   		return forward;
	}  	
}