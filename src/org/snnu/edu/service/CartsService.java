package org.snnu.edu.service;

import org.snnu.edu.utils.DealSql;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 小贝 on 2017/12/29.
 */
public class CartsService {
    public static List<Map<String,Object>> getCarts(HttpSession session){
        if(session.getAttribute("userName")!=null){
            List<Map<String,Object>> result=new ArrayList<>();
            DealSql.connSQL();
            String userName=(String)session.getAttribute("userName");
            //查询当前用户的相关信息
            List<Map<String,Object>> user=new ArrayList<>();
            //用户信息
            List<String> user1=new ArrayList<>();
            user1.add("cart_id");
            //查询条件
            Map<String,Object> userMap=new HashMap<>();
            userMap.put("user_name",userName);
            user=DealSql.queryByTerms("user",user1,userMap);

            //查询当前购物车中的信息
            List<Map<String,Object>> carts=new ArrayList<>();
            //查询字段
            List<String> carts1=new ArrayList<>();
            carts1.add("goods_id");
            carts1.add("goods_quantity");
            //查询条件
            Map<String,Object> cartsMap=new HashMap<>();
            cartsMap.put("cart_id",user.get(0).get("cart_id"));

            carts=DealSql.queryByTerms("goods_cart",carts1,cartsMap);
            System.out.println("==========="+carts.toString());

            //查询所有购物车中的商品详情
            for(Map<String,Object> cart:carts){
                //商品查询结果
                List<Map<String,Object>> goods=new ArrayList<>();
                //商品查询字段
                List<String> goods1=new ArrayList<>();
                goods1.add("goods_title");
                goods1.add("goods_price");
                goods1.add("goods_photo");
                //商品查询条件
                Map<String,Object> goodsMap=new HashMap<>();
                goodsMap.put("goods_id",cart.get("goods_id"));
                goods=DealSql.queryByTerms("goods",goods1,goodsMap);
                goods.get(0).put("goods_quantity",cart.get("goods_quantity"));
                System.out.println("========"+goods.get(0));
                result.add(goods.get(0));
            }
            System.out.println("========="+result);
            DealSql.deconnSQL();
            return result;
        }
        return null;
    }
    public static boolean addCart(String cartId,String goodsId,String goodsQuantity,String goodsColor,String goodsSize){
        boolean result=false;
        if(cartId!=null&&goodsId!=null&&goodsColor!=null&&goodsQuantity!=null&&goodsSize!=null){
            DealSql.connSQL();
            List<String> terms=new ArrayList<>();
            terms.add("goods_cart_id");
            terms.add("cart_id");
            terms.add("goods_id");
            terms.add("goods_quantity");
            terms.add("goods_size");
            terms.add("goods_color");
            List<String> vaules=new ArrayList<>();
            vaules.add(String.valueOf(System.currentTimeMillis()));
            vaules.add(cartId);
            vaules.add(goodsId);
            vaules.add(goodsQuantity);
            vaules.add(goodsSize);
            vaules.add(goodsColor);
            List<List<String>> lists=new ArrayList<>();
            lists.add(vaules);
            int i=DealSql.insert("goods_cart",terms,lists);
            if(i>0){
                result=true;
            }

        }
        DealSql.deconnSQL();
        return result;
    }
}
