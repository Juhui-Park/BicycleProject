package com.two.bicyclePrj;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class dispatcherServlet
 */
@WebServlet("/DispatcherServlet")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	bicycleDAO dao = new bicycleDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String path = "index.jsp";
		String reqCommand = request.getRequestURI();
		if ("/index.do".equals(reqCommand)) {

			ArrayList<bicycleVo> startList = dao.getStartList();

			request.setAttribute("startList", startList);
			path = "predTime.jsp";

		} else if ("/repair.do".equals(reqCommand)) {
			path = "brokenBike.jsp";

		} else if ("/top.do".equals(reqCommand)) {
			ArrayList<String> rank = dao.getRankOffice();
			request.setAttribute("rank", rank);
			path = "resultRankOffice.jsp";

		} else if ("/recommend.do".equals(reqCommand)) {
			ArrayList<bicycleVo> startList = dao.getStartList();

			request.setAttribute("startList", startList);
			path = "recommend.jsp";
			
		} else if ("/closeOffice.do".equals(reqCommand)) {
			ArrayList<String> closeOfficeList = dao.getCloseOffice();
			request.setAttribute("closeOfficeList", closeOfficeList);
			path = "closeOffice.jsp";

		}

		RequestDispatcher disp = request.getRequestDispatcher(path);
		disp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String reqCommand = request.getRequestURI();
		String path = "index.jsp";

		if ("/main.do".equals(reqCommand)) {
			String text_search_rental = request.getParameter("text_search_rental");
			String text_search_return = request.getParameter("text_search_return");
			String time = dao.getAvgTime(text_search_rental, text_search_return);
			
			request.setAttribute("text_search_rental",text_search_rental);
			request.setAttribute("text_search_return",text_search_return);
			request.setAttribute("time", time);
			path = "resultPredTime.jsp";

		} else if ("/brokenBike.do".equals(reqCommand)) {
			String meterStr = request.getParameter("textMeter");
			int meter = Integer.parseInt(meterStr);
			ArrayList<bicycleVo> repair = dao.getRepair(meter);

			request.setAttribute("repair", repair);
			path = "resultBrokenBike.jsp";

		} else if ("/resultRecommend.do".equals(reqCommand)) {
	         String recommend = request.getParameter("textRecommend");
	         int preTime = Integer.parseInt(request.getParameter("time"));

	         ArrayList<bicycleVo> recommendList = dao.getRecommendOffice(recommend, preTime);
	         request.setAttribute("recommendList", recommendList);
	         
	         path = "resultRecommend.jsp";
		}
		RequestDispatcher disp = request.getRequestDispatcher(path);
		disp.forward(request, response);
	}

}
