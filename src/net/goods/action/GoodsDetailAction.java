package net.goods.action;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.goods.db.*;

public class GoodsDetailAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		GoodsDAO goodsdao = new GoodsDAO();

		// 이미지 리스트
		List imgList = new ArrayList();

		//
		int gr_goods_num = 0;
		GoodsBean isnextpage = null;
		GoodsBean isprevpage = null;
		GoodsBean itemArray = null;
		GoodsBean next_Bean = null;
		GoodsBean prev_Bean = null;
		String item = null;
		String price = "no";

		// (1)파라미터 gr_goods_num값을 받음 (2)파라미터 item 을 값을 받음
		//
		gr_goods_num = Integer.parseInt(request.getParameter("gr_goods_num"));
		item = request.getParameter("item");

		//
		int nextpage = 0;
		int prevpage = 0;

		// 만약 (3)파라미터 price값이 있다면
		if (request.getParameter("price") != null && !request.getParameter("price").equals("")) {
			// 그 파라미터 값을 price변수에 넣음.
			price = request.getParameter("price");
		}

		// 만약 (4)파라미터 search 값이 있다면
		if (request.getParameter("search") != null) {
			if (request.getParameter("search").equals("next")) {
				// 파라미터 search=next 이면
				next_Bean = goodsdao.findDetail(gr_goods_num, item, price, "next");
				nextpage = next_Bean.getGOODS_NUM();
				itemArray = goodsdao.findDetailList(nextpage, item);
				isnextpage = goodsdao.findDetail(nextpage, item, price, "next");
				isprevpage = goodsdao.findDetail(nextpage, item, price, "prev");
			} else if (request.getParameter("search").equals("prev")) {
				// 파라미터 search=prev 이면
				prev_Bean = goodsdao.findDetail(gr_goods_num, item, price, "prev");
				prevpage = prev_Bean.getGOODS_NUM();
				itemArray = goodsdao.findDetailList(prevpage, item);
				isnextpage = goodsdao.findDetail(prevpage, item, price, "next");
				isprevpage = goodsdao.findDetail(prevpage, item, price, "prev");
			}
		} else {
			itemArray = goodsdao.findDetailList(gr_goods_num, item);

			if (request.getParameter("isitem").equals("new")) {
				item = "new_item";
			} else if (request.getParameter("isitem").equals("hit")) {
				item = "hit_item";
			}

			isnextpage = goodsdao.findDetail(gr_goods_num, item, price, "next");
			isprevpage = goodsdao.findDetail(gr_goods_num, item, price, "prev");
		}

		String images = itemArray.getGOODS_IMAGE();
		StringTokenizer st = new StringTokenizer(images, ",");
		while (st.hasMoreTokens()) {
			imgList.add(st.nextToken());
		}
		//수정
		String mainImage = (String) imgList.get(0);

		List contentImage = new ArrayList();
		for (int i = 1; i < imgList.size(); i++) {
			contentImage.add(imgList.get(i));
		}

		request.setAttribute("itemArray", itemArray);

		request.setAttribute("item", item);
		// 썸네일 이미지 변수 ★mainImage
		request.setAttribute("mainImage", mainImage);
		// 모든 이미지 변수 ★contentImage
		request.setAttribute("contentImage", contentImage);
		request.setAttribute("prevpage", isprevpage);
		request.setAttribute("nextpage", isnextpage);
		request.setAttribute("price", price);

		forward.setRedirect(false);
		forward.setPath("./goods/goods_detail.jsp");
		return forward;
	}
}
