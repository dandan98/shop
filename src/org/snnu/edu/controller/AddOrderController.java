package org.snnu.edu.controller;

import com.google.gson.JsonObject;
import org.snnu.edu.service.AddOrderService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by 小贝 on 2018/1/11.
 */
public class AddOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String msg="fail";
        String userId=(String)req.getSession().getAttribute("userId");
        String goodsId=req.getParameter("goodsId");
        String goodsPrice=req.getParameter("goodsPrice");
        String goodsQuantity=req.getParameter("goodsQuantity");
        String goodsSize=req.getParameter("goodsSize");
        String goodsColor=req.getParameter("goodsColor");
        if(AddOrderService.addOrder(req.getSession(),goodsId,goodsQuantity,goodsPrice,goodsColor,goodsSize)){
            msg="success";
        }
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        JsonObject jsonObject=new JsonObject();
        jsonObject.addProperty("msg",msg);
        out.write(jsonObject.toString());
        out.flush();
        out.close();

    }
}
