package org.snnu.edu.controller;

import com.google.gson.JsonObject;
import org.snnu.edu.service.SessionService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by 小贝 on 2017/12/6.
 */
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String msg="参数为空";
        boolean result;
        HttpSession session=req.getSession();
        String userName=req.getParameter("userName");
        String passWord=req.getParameter("passWord");
        if(userName!=null&&passWord!=null){
            result=SessionService.login(session,userName,passWord);
            if(result){
                session.setAttribute("userName",userName);
                msg="success";
            }
            else {
                msg="fail";
            }
        }
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        JsonObject jsonObject=new JsonObject();
        jsonObject.addProperty("msg",msg);
        out.write(jsonObject.toString());
        out.flush();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        JsonObject jsonObject=new JsonObject();
        jsonObject.addProperty("s","i");
        out.write(jsonObject.toString());
        out.flush();
        out.close();
    }
}
