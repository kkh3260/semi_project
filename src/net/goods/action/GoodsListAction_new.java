package net.goods.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.goods.db.*;

public class GoodsListAction_new implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
		ActionForward forward=new ActionForward();
		GoodsDAO goodsdao=new GoodsDAO();
		
		List itemList=null;
		List beerlist=null;
		List ricelist=null;
		List winelist=null;
		List whiskeylist = null;
		String item=null;
		String beer="beer";
		String rice="rice";
		String wine="wine";
		String whiskey = "whiskey";
		String price="";
		int count=1;
		int page=1;
		
		// count
		int countBeer=1;
		int countrice=1;
		int countWine=1;
		int countWhiskey=1;
		
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		
		item=request.getParameter("item");
		
		if(request.getParameter("item")=="new_item") {
			beerlist= goodsdao.item_List(beer,page);
			countBeer = goodsdao.getCount(beer);
			
			ricelist= goodsdao.item_List(rice,page);
			countrice = goodsdao.getCount(rice);
			
			winelist= goodsdao.item_List(wine,page);
			countWine =goodsdao.getCount(wine);
			
			winelist= goodsdao.item_List(whiskey,page);
			countWine =goodsdao.getCount(whiskey);
		}
		
		if (request.getParameter("searchprice")==null || request.getParameter("searchprice").equals("")) {
			itemList= goodsdao.item_List(item,page);
			beerlist= goodsdao.item_List(beer,page);
			ricelist= goodsdao.item_List(rice,page);
			winelist= goodsdao.item_List(wine,page);
			whiskeylist= goodsdao.item_List(whiskey,page);
			count=goodsdao.getCount(item);
		} else {
			price=request.getParameter("searchprice");
			itemList= goodsdao.item_List(item,page,price);
			beerlist= goodsdao.item_List(beer,page,price);
			ricelist= goodsdao.item_List(rice,page,price);
			winelist= goodsdao.item_List(wine,page,price);
			count=goodsdao.getCount(item, price);
		}
		
		int pageSize=12;
		int pageCount=count/pageSize+(count % pageSize==0 ? 0:1);
		int startPage=(int)((page-1)/10)*10+1;
		int endPage=startPage+10-1;
		if (endPage>pageCount) endPage=pageCount;
		
		request.setAttribute("beerlist", beerlist);
		request.setAttribute("ricelist", ricelist);
		request.setAttribute("winelist", winelist);
		request.setAttribute("whiskeylist", whiskeylist);
		request.setAttribute("itemList", itemList);
		request.setAttribute("category", item);
		request.setAttribute("count", count);
		request.setAttribute("price", price);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		forward.setRedirect(false);
		forward.setPath("./goods/goods_list_new.jsp");
		return forward;
	}
}
