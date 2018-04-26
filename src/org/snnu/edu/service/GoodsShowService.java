package org.snnu.edu.service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.snnu.edu.utils.CamelUtil;
import org.snnu.edu.utils.DealSql;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by 小贝 on 2018/1/6.
 */
public class GoodsShowService {
    public static JsonObject getGoodsShow(HttpSession session){
        JsonObject jsonObject=new JsonObject();
        String goodsId=(String)session.getAttribute("goodsId");
        if(goodsId!=null&&!goodsId.equals("")){
            DealSql.connSQL();
            //查询商品基本信息
            List<String> good=new ArrayList<>();
            good.add("goods_id");
            good.add("goods_title");
            good.add("goods_price");
            good.add("goods_info");
            good.add("goods_photo");
            good.add("goods_describe");
            //查询条件
            Map<String,Object> map=new HashMap<>();
            map.put("goods_id",goodsId);
            //查询结果
            List<Map<String,Object>> goods=DealSql.queryByTerms("goods",good,map);
            //将结果写进json
            for(String s:goods.get(0).keySet()){
                String key= CamelUtil.underlineToCamel(s);
                String value=(String)goods.get(0).get(s);
                if(s.equals("goods_photo")){
                    session.setAttribute("goodsPhoto",value);
                }
                if(s.equals("goods_title")){
                    session.setAttribute("goodsTitle",value);
                }
                jsonObject.addProperty(key,value);
                System.out.println("=========="+jsonObject.toString());
            }
            //查询商品其他图片
            List<String> photo=new ArrayList<>();
            photo.add("goods_photo");
            List<Map<String,Object>> photos=DealSql.queryByTerms("goods_photo",photo,map);
            JsonArray jsonArray=new JsonArray();
            for(Map<String,Object> map1: photos){
                JsonObject jsonObject1=new JsonObject();
                for(String s1:map1.keySet()){
                    String key= CamelUtil.underlineToCamel(s1);
                    String value=(String)map1.get(s1);
                    jsonObject1.addProperty(key,value);
                    System.out.println("------------"+jsonObject1.toString());
                }
                jsonArray.add(jsonObject1);
            }
            jsonObject.addProperty("smallPhoto",jsonArray.toString());

            //查询商品size
            List<String> size=new ArrayList<>();
            size.add("goods_size");
            List<Map<String,Object>> goodsSize=DealSql.queryByTerms("goods_size",size,map);

            JsonArray jsonArray1=new JsonArray();
            for(Map<String,Object> map2: goodsSize){
                JsonObject jsonObject2=new JsonObject();
                for(String s1:map2.keySet()){
                    String key= CamelUtil.underlineToCamel(s1);
                    String value=(String)map2.get(s1);
                    jsonObject2.addProperty(key,value);
                    System.out.println("------------"+jsonObject2.toString());
                }
                jsonArray1.add(jsonObject2);
            }
            jsonObject.addProperty("size",jsonArray1.toString());

            //查询商品color
            List<String> color=new ArrayList<>();
            color.add("goods_color");
            List<Map<String,Object>> goodsColor=DealSql.queryByTerms("goods_color",color,map);

            JsonArray jsonArray2=new JsonArray();
            for(Map<String,Object> map2: goodsColor){
                JsonObject jsonObject2=new JsonObject();
                for(String s1:map2.keySet()){
                    String key= CamelUtil.underlineToCamel(s1);
                    String value=(String)map2.get(s1);
                    jsonObject2.addProperty(key,value);
                    System.out.println("------------"+jsonObject2.toString());
                }
                jsonArray2.add(jsonObject2);
            }
            jsonObject.addProperty("color",jsonArray2.toString());
        }
        System.out.println("================jsp"+jsonObject.toString());
        return jsonObject;
    }
}
