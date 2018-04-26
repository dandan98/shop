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
 * Created by 小贝 on 2018/1/14.
 */
public class AddressService {
    public static JsonArray queryAddress(HttpSession session){
        JsonArray jsonArray=new JsonArray();
        String userId=(String)session.getAttribute("userId");
        if(userId!=null&&!userId.equals("")){
            DealSql.connSQL();
            List<String> fields=new ArrayList<>();
            fields.add("address_id");
            fields.add("detail_address");
            fields.add("name");
            fields.add("phone");
            fields.add("state");
            Map<String,Object> map=new HashMap<>();
            map.put("user_id",userId);
            List<Map<String,Object>> result=DealSql.queryByTerms("address",fields,map);
            for(Map<String,Object> map1:result){
                JsonObject jsonObject=new JsonObject();
                for(String s:map1.keySet()){
                    String key= CamelUtil.underlineToCamel(s);
                    String value=(String)map1.get(s);
                    jsonObject.addProperty(key,value);
                    System.out.println("=========="+jsonObject.toString());
                }
                jsonArray.add(jsonObject);
            }
        }
        return jsonArray;
    }

    public static boolean addAddress(HttpSession session,String detailAddress,String name,String phone){
        boolean result=false;
        String userId=(String)session.getAttribute("userId");
        if(userId!=null&&detailAddress!=null&&name!=null&&phone!=null){
            List<String> field=new ArrayList<>();
            field.add("address_id");
            field.add("user_id");
            field.add("detail_address");
            field.add("name");
            field.add("phone");
            List<String> value=new ArrayList<>();
            value.add(String.valueOf(System.currentTimeMillis()));
            value.add(userId);
            value.add(detailAddress);
            value.add(name);
            value.add(phone);
            List<List<String>> lists=new ArrayList<>();
            lists.add(value);
            int i=DealSql.insert("address",field,lists);
            if(i>0){
                result=true;
            }
        }
        return result;
    }

    public static boolean editAddress(HttpSession session,String detailAddress,String name,String phone,String state){
        boolean result=false;
        String userId=(String)session.getAttribute("userId");
        Map<String,Object> map=new HashMap<>();
        Map<String,Object> map1=new HashMap<>();
        map1.put("user_id",userId);
        if(detailAddress!=null&&!detailAddress.equals("")){
            map.put("detail_address",detailAddress);
        }
        if(name!=null&&!name.equals("")){
            map.put("name",name);
        }
        if (phone!=null&&!phone.equals("")){
            map.put("phone",phone);
        }
        if(state!=null&&!state.equals("")){
            map.put("state",state);
        }
        DealSql.connSQL();
        if(!map.isEmpty()&&DealSql.update("address",map,map1)>0){
            result=true;
        }

        return result;
    }
}
