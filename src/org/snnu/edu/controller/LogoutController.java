package org.snnu.edu.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Enumeration;

/**
 * Created by 小贝 on 2018/1/10.
 */
public class LogoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Enumeration em = req.getSession().getAttributeNames();
        while(em.hasMoreElements()){
            req.getSession().removeAttribute(em.nextElement().toString());
        }
    }
}
