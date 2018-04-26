package org.snnu.edu.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.mysql.jdbc.StringUtils;
import org.snnu.edu.service.TypeListService;
import org.snnu.edu.service.GoodsListService;
import org.snnu.edu.utils.CamelUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * Created by 小贝 on 2017/12/13.
 */
public class GoodsListController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String msg="fail";
        String typeId=(String)req.getSession().getAttribute("typeId");
        List<Map<String,Object>> result=null;
        List<Map<String, Object>> typeResult=null;
        if(StringUtils.isNullOrEmpty(typeId)){
            result= GoodsListService.getGoodsList();
            if(result!=null){
                msg = "success";
            }
        }
        else {
            result = GoodsListService.getGoodsList(typeId);
            typeResult = TypeListService.getTypeList(typeId);

            if (result != null && typeResult != null) {
                msg = "success";
            }
        }
        JsonObject jsonObject = new JsonObject();
        Gson gson=new Gson();
        jsonObject.addProperty("msg",msg);
        jsonObject.addProperty("data", CamelUtil.underlineToCamel(gson.toJson(result)));
        if(typeResult!=null&&typeResult.size()>0){
            jsonObject.addProperty("type",CamelUtil.underlineToCamel(gson.toJson(typeResult)));

        }
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        out.write(jsonObject.toString());
        out.flush();
        out.close();
    }
}
