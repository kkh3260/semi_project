package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.*;

 public class BoardModifyAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 request.setCharacterEncoding("UTF-8");
		 
		 boolean result = false;
		 
		 int num = Integer.parseInt(request.getParameter("boardNum"));
		 
		 BoardDAO boarddao = new BoardDAO();
		 BoardDTO boarddata = new BoardDTO();
		 
		 boolean usercheck=boarddao.isBoardWriter(num, request.getParameter("boardPass"));
		 if(usercheck == false){
		   		response.setContentType("text/html;charset=UTF-8");
		   		PrintWriter out = response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('수정할 권한이 없습니다.');");
		   		out.println("location.href='./BoardList.bo';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
		 }
		 
		 try{
			 boarddata.setBoardNum(num);
			 boarddata.setBoardSubject(request.getParameter("boardSubject"));
			 boarddata.setBoardContent(request.getParameter("boardContent"));
			 
			 result = boarddao.boardModify(boarddata);
			 if(result==false){
		   		System.out.println("게시판 수정 실패");
		   		return null;
		   	 }
		   	 System.out.println("게시판 수정 완료");
		   	 
		   	 ActionForward forward = new ActionForward();
		   	 forward.setRedirect(true);
		   	 forward.setPath("./BoardDetailAction.bo?num="+boarddata.getBoardNum());
		   	 return forward;
	   	 }catch(Exception ex){
	   		 ex.printStackTrace();	 
		 }
		 
		 return null;
	 }
}