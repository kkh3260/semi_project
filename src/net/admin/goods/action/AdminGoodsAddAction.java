package net.admin.goods.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.admin.goods.db.*;

public class AdminGoodsAddAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		AdminGoodsDAO agoodsdao = new AdminGoodsDAO();
		GoodsBean agb = new GoodsBean();
		String realPath = "";
		String savePath = "/upload";
		int maxSize = 5 * 1024 * 1024;
		realPath = request.getSession().getServletContext().getRealPath(savePath);
		List savefiles = new ArrayList();
		try {
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
			//
			Enumeration files = multi.getFileNames();
			while (files.hasMoreElements()) {
				String name = (String) files.nextElement();

				if (files.hasMoreElements()) {
					savefiles.add(multi.getFilesystemName(name) + ",");
				} else {
					savefiles.add(multi.getFilesystemName(name));
				}
			}
			StringBuffer fl = new StringBuffer();
			for (int i = 0; i < savefiles.size(); i++) {
				fl.append(savefiles.get(i));
			}
			agb.setGOODS_NAME(multi.getParameter("goods_name"));
			agb.setGOODS_CATEGORY(multi.getParameter("goods_category"));
			agb.setGOODS_PRICE(Integer.parseInt(multi.getParameter("goods_price")));
			agb.setGOODS_COUNTRY(multi.getParameter("goods_country"));
			agb.setGOODS_SIZE(multi.getParameter("goods_size"));
			agb.setGOODS_ABV(multi.getParameter("goods_abv"));
			agb.setGOODS_AMOUNT(Integer.parseInt(multi.getParameter("goods_amount")));
			agb.setGOODS_CONTENT(multi.getParameter("goods_content"));
			agb.setGOODS_IMAGE(fl.toString());
			int result = agoodsdao.insertGoods(agb);

			if (result <= 0) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('등록실패')");
				out.println("history.back()");
				out.println("</script>");
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("add action작동");
		forward.setRedirect(true);
		forward.setPath("./GoodsList.go?item=new_item");
		return forward;
	}
}
