package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.db.BoardDAO;
import net.board.db.BoardDTO;

public class BoardAddAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		BoardDAO boarddao = new BoardDAO();
	   	BoardDTO boarddata = new BoardDTO();
	   	ActionForward forward = new ActionForward();
	   	
		String realFolder="";
   		String saveFolder="./upload";
   		
   		int fileSize = 5*1024*1024;
   		
   		realFolder = request.getSession().getServletContext().getRealPath(saveFolder);
   		// System.out.println(realFolder);
   		
   		boolean result=false;
   		
   		try{
   			
   			MultipartRequest multi = null;
   			
   			multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
   			
   			boarddata.setBoardName(multi.getParameter("boardName"));
   			boarddata.setBoardPass(multi.getParameter("boardPass"));
	   		boarddata.setBoardSubject(multi.getParameter("boardSubject"));
	   		boarddata.setBoardContent(multi.getParameter("boardContent"));
	   		boarddata.setBoardFile(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
	   		
	   		result=boarddao.boardInsert(boarddata);
	   		
	   		if(result==false){
	   			System.out.println("게시판 등록 실패");
	   			return null;
	   		}
	   		System.out.println("게시판 등록 완료");
	   		
	   		forward.setRedirect(true);
	   		forward.setPath("./BoardList.bo");
	   		return forward;
	   		
  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}  	
}