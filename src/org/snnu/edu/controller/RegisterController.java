package org.snnu.edu.controller;

import com.google.gson.JsonObject;
import org.snnu.edu.service.SessionService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by 小贝 on 2017/12/14.
 */
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName=req.getParameter("userName");
        String passWord=req.getParameter("passWord");
        String email=req.getParameter("email");
        String phone=req.getParameter("phone");
        String msg="fail";
        boolean result= SessionService.register(userName,passWord,phone,email);
        if(result){
            msg="success";
        }
        JsonObject jsonObject=new JsonObject();
        jsonObject.addProperty("msg",msg);
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.write(jsonObject.toString());
        out.flush();
        out.close();
    }
}

