package org.snnu.edu.service;

import org.snnu.edu.utils.DealSql;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 小贝 on 2017/12/6.
 */
public class SessionService {
    public static boolean login(HttpSession session,String userName, String passWord){
        boolean result=false;
        //查询字段list
        List<String> fields=new ArrayList<>();
        fields.add("user_name");
        fields.add("pass_word");
        fields.add("user_id");
        fields.add("cart_id");
        //查询条件
        Map<String,Object> map=new HashMap<>();
        map.put("user_name",userName);
        map.put("pass_word",passWord);
        //查询比对数据库
        DealSql.connSQL();
        List<Map<String,Object>> list= DealSql.queryByTerms("user",fields,map);
        if(list.size()==1){
            result=true;
            session.setAttribute("userId",list.get(0).get("user_id"));
            session.setAttribute("cartId",list.get(0).get("cart_id"));
            //查询当前购物车中的信息
            List<Map<String,Object>> carts=new ArrayList<>();
            //查询字段
            List<String> carts1=new ArrayList<>();
            carts1.add("goods_id");
            carts1.add("goods_quantity");
            //查询条件
            Map<String,Object> cartsMap=new HashMap<>();
            cartsMap.put("cart_id",list.get(0).get("cart_id"));
            carts=DealSql.queryByTerms("goods_cart",carts1,cartsMap);
            session.setAttribute("num",carts.size());
        }
        DealSql.deconnSQL();
        return result;
    }

    public static boolean register(String userName,String passWord,String phone,String email){
        boolean result=false;
        DealSql.connSQL();
        if(userName!=null&&passWord!=null&&phone!=null&&email!=null)
        {
            //数据插入字段
            List<String> list=new ArrayList<>();
            list.add("user_name");
            list.add("pass_word");
            list.add("cart_id");
            list.add("user_email");
            list.add("user_phone");
            //数据库插入数据
            List<String> list1=new ArrayList<>();
            list1.add(userName);
            list1.add(passWord);
            list1.add(String.valueOf(System.currentTimeMillis()));
            list1.add(email);
            list1.add(phone);
            List<List<String>>lists=new ArrayList<>();
            lists.add(list1);
            int i=DealSql.insert("user",list,lists);
            if(i>0){
                result=true;
            }
        }
        return result;
    }
}
