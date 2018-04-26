package org.snnu.edu.controller;

import com.google.gson.JsonObject;
import org.snnu.edu.service.AddressService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by 小贝 on 2018/1/14.
 */
public class AddAddressController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String detailAddress=req.getParameter("detailAddress");
        String name=req.getParameter("name");
        String phone=req.getParameter("phone");
        boolean msg=AddressService.addAddress(req.getSession(),detailAddress,name,phone);
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        JsonObject jsonObject=new JsonObject();
        jsonObject.addProperty("msg",msg);
        out.write(jsonObject.toString());
        out.flush();
        out.close();
    }
}
