package org.snnu.edu.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.snnu.edu.service.CartsService;
import org.snnu.edu.utils.CamelUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * Created by 小贝 on 2017/12/29.
 */
public class CartsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String msg="fail";
        List<Map<String,Object>> result= CartsService.getCarts(session);
        JsonObject jsonObject=new JsonObject();
        System.out.println();
        if(result!=null&&result.size()!=0){
            msg="success";
            Gson gson=new Gson();
            jsonObject.addProperty("msg",msg);
            jsonObject.addProperty("data", CamelUtil.underlineToCamel(gson.toJson(result)));

        }
        else {
            jsonObject.addProperty("msg",msg);
        }
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        out.write(jsonObject.toString());
        out.flush();
        out.close();
    }
}
