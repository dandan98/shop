package org.snnu.edu.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.snnu.edu.utils.CamelUtil;
import org.snnu.edu.utils.DealSql;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 小贝 on 2018/1/11.
 */
public class AddOrderService {
    public static boolean addOrder(HttpSession session, String goodsId, String goodsQuantity, String goodsPrice, String goodsColor, String goodsSize){
        boolean result=false;
        if(goodsId!=null&&goodsColor!=null&&goodsQuantity!=null&&goodsPrice!=null&&goodsSize!=null){

            JsonArray jsonArray=new JsonArray();
            JsonObject jsonObject=new JsonObject();
            jsonObject.addProperty("goodsPrice",goodsPrice);
            jsonObject.addProperty("goodsId",goodsId);
            jsonObject.addProperty("goodsColor",goodsColor);
            jsonObject.addProperty("goodsSize",goodsSize);
            jsonObject.addProperty("goodsQuantity",goodsQuantity);

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
                String value=(String)goods.get(0).get(s);
                if(s.equals("goods_photo")){
                    jsonObject.addProperty("goodsPhoto",value);
                }
                if(s.equals("goods_title")){
                    jsonObject.addProperty("goodsTitle",value);
                }
                else {
                    continue;
                }
            }
            jsonArray.add(jsonObject);
            session.setAttribute("goods",jsonArray);
            /*DealSql.connSQL();
            List<String> terms=new ArrayList<>();
            terms.add("user_goods_id");
            terms.add("goods_id");
            terms.add("user_id");
            terms.add("goods_price");
            terms.add("goods_quantity");
            terms.add("goods_size");
            terms.add("goods_color");
            List<String> vaules=new ArrayList<>();
            vaules.add(String.valueOf(System.currentTimeMillis()));
            vaules.add(goodsId);
            vaules.add(userId);
            vaules.add(goodsPrice);
            vaules.add(goodsQuantity);
            vaules.add(goodsSize);
            vaules.add(goodsColor);
            List<List<String>> lists=new ArrayList<>();
            lists.add(vaules);
            int i=DealSql.insert("my_order",terms,lists);
            if(i>0){
                result=true;
            }
*/
            result=true;
        }
        /*DealSql.deconnSQL();*/
        return result;
    }
}
