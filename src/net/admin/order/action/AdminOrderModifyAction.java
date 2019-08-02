package net.admin.order.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.order.db.AdminOrderDAO;
import net.member.db.MemberBillBean;
import net.member.db.MemberBillDAO;
import net.order.db.OrderBean;

public class AdminOrderModifyAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		HttpSession session=request.getSession();
		AdminOrderDAO orderdao=new AdminOrderDAO();
		MemberBillDAO mmbdao = new MemberBillDAO();
		
		OrderBean order=new OrderBean();
		MemberBillBean mbb = new MemberBillBean();
		
		boolean result=false;
		request.setCharacterEncoding("utf-8");
		order.setORDER_NUM(Integer.parseInt(request.getParameter("num")));
		order.setORDER_TRANS_NUM(request.getParameter("transportnum"));
		order.setORDER_MEMO(request.getParameter("memo"));
		order.setORDER_STATUS(Integer.parseInt(request.getParameter("status")));
		
		// 결제금액 저장
		/*
		 * if(Integer.parseInt(request.getParameter("status"))==4) {
		 * System.out.println((String) request.getAttribute("summoney"));
		 * mbb.setMEMBER_ID((String)session.getAttribute("id"));
		 * mbb.setMEMBER_BILL(Integer.parseInt((String)
		 * request.getAttribute("summoney"))); mmbdao.updateMemberBill(mbb); }
		 */
		
		result=orderdao.modifyOrder(order);
		if(result==false){
			System.out.println("상품 수정 실패");
			return null;
		}
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./AdminOrderList.ao");
		return forward;
	 } 
}
