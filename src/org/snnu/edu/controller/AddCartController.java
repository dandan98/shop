package org.snnu.edu.controller;

import com.google.gson.JsonObject;
import org.snnu.edu.service.CartsService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by 小贝 on 2018/1/11.
 */
public class AddCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String msg="fail";
        String cartId=(String)req.getSession().getAttribute("cartId");
        String goodsId=req.getParameter("goodsId");
        String goodsQuantity=req.getParameter("goodsQuantity");
        String goodsSize=req.getParameter("goodsSize");
        String goodsColor=req.getParameter("goodsColor");
        if(CartsService.addCart(cartId,goodsId,goodsQuantity,goodsColor,goodsSize)){
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
