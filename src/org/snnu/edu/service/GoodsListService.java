package org.snnu.edu.service;

import com.google.gson.Gson;
import org.snnu.edu.utils.CamelUtil;
import org.snnu.edu.utils.DealSql;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 小贝 on 2017/12/13.
 */
public class GoodsListService {
    public static List<Map<String,Object>> getGoodsList(String type){
        DealSql.connSQL();
        //保存返回结果
        List<Map<String,Object>> result=new ArrayList<>();

        //查询出的子类型结果
        List<Map<String,Object>> listResult=new ArrayList<>();
        //查询出的商品结果
        List<Map<String, Object>> goodsResult=new ArrayList<>();
        //查询所需显示的类型
        //数据库需要查询的字段
        List<String> list1=new ArrayList<>();
        list1.add("type_id");
        list1.add("type_name");
        list1.add("parent_id");
        list1.add("is_leaf");
        list1.add("type_photo");
        list1.add("type_info");
        //查询条件
        Map<String,Object> map1=new HashMap<>();
        map1.put("type_id",type);
        //类型查询结果
        List<Map<String,Object>> typeResult=DealSql.queryByTerms("type",list1,map1);
        for(int i=0;i<typeResult.size();i++){
            if(typeResult.get(i).get("is_leaf").equals("0")) {
                //查询所有typeId为parentId的type
                //数据库查询字段
                List<String> list2 = new ArrayList<>();
                list2.add("type_id");
                list2.add("type_name");
                list2.add("type_photo");
                //数据库查询条件
                Map<String, Object> map2 = new HashMap<>();
                map2.put("parent_id", type);
                listResult = DealSql.queryByTerms("type", list2, map2);
            }
            else if(typeResult.get(i).get("is_leaf").equals("1")){
                System.out.println("===============11111111");
                List<String> list = new ArrayList<>();
                list.add("goods_id");
                list.add("goods_title");
                list.add("goods_price");
                list.add("goods_photo");
                list.add("goods_info");
                //数据库查询条件
                Map<String, Object> map3 = new HashMap<>();
                map3.put("type_id", type);
                //数据库查询结果
                result = DealSql.queryByTerms("goods", list, map3);
            }
        }
        if(listResult!=null&&listResult.size()!=0) {
            for(Map<String,Object> map:listResult) {
                //保存单个类型的商品结果
                Map<String,Object> mapResult=new HashMap<>();
                //数据库需要查询的字段
                List<String> list = new ArrayList<>();
                list.add("goods_id");
                list.add("goods_title");
                list.add("goods_price");
                list.add("goods_photo");
                list.add("goods_info");
                //数据库查询条件
                Map<String, Object> map3 = new HashMap<>();
                map3.put("type_id", map.get("type_id"));
                //数据库查询结果
                goodsResult = DealSql.queryByTerms("goods", list, map3);
                mapResult.put("typeId",(String)map.get("type_id"));
                mapResult.put("goods",goodsResult);
                result.add(mapResult);
            }
        }
        DealSql.deconnSQL();
        return result;
    }
    public static List<Map<String,Object>> getGoodsList(){
        DealSql.connSQL();
        List<Map<String,Object>> result=DealSql.queryAll("goods");
        DealSql.deconnSQL();
        return result;
    }
}
