package org.snnu.edu.controller;

import com.google.gson.JsonObject;
import org.snnu.edu.service.GoodsShowService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by 小贝 on 2018/1/6.
 */
public class GoodsShowController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String msg="fail";
        HttpSession session=req.getSession();
        JsonObject jsonObject=GoodsShowService.getGoodsShow(session);
        if(jsonObject!=null&&!jsonObject.toString().equals("")){
            msg="success";
        }
        jsonObject.addProperty("msg",msg);
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        out.write(jsonObject.toString());
        out.flush();
        out.close();
    }
}
