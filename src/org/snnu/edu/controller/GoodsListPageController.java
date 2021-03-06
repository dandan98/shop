package org.snnu.edu.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by 小贝 on 2017/12/12.
 */
public class GoodsListPageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        session.setAttribute("typeId",req.getParameter("typeId"));
        req.getRequestDispatcher("../WEB-INF/jsp/goodsListPage.jsp").forward(req, resp);
    }
}
