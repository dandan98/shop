package org.snnu.edu.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.snnu.edu.utils.CamelUtil;
import org.snnu.edu.utils.DealSql;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * Created by 小贝 on 2018/1/10.
 */
public class GetIndexPhoto extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JsonObject jsonObject=new JsonObject();
        String msg="fail";
        DealSql.connSQL();
        List<Map<String,Object>> result= DealSql.queryAll("goods");
        Gson gson=new Gson();
        if(result!=null&&result.size()>0){
            msg="success";
            jsonObject.addProperty("data", CamelUtil.underlineToCamel(gson.toJson(result)));
        }
        jsonObject.addProperty("msg",msg);
        DealSql.deconnSQL();
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        out.write(jsonObject.toString());
        out.flush();
        out.close();
    }
}
