package org.snnu.edu.controller;

import com.google.gson.JsonObject;
import org.snnu.edu.service.GetLoginStatus;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by 小贝 on 2017/12/21.
 */
public class GetStatusController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JsonObject jsonObject=new JsonObject();
        String msg="fail";
        if(GetLoginStatus.getStatus(req.getSession())){
            msg="success";
        }
        jsonObject.addProperty("msg",msg);
        jsonObject.addProperty("userName",(String)req.getSession().getAttribute("userName"));
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        out.write(jsonObject.toString());
        out.flush();
        out.close();
    }
}
