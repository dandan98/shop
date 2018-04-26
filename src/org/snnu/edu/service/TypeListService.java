package org.snnu.edu.service;

import org.snnu.edu.utils.DealSql;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 小贝 on 2017/12/27.
 */
public class TypeListService {
    public static List<Map<String,Object>> getTypeList(String type){
        DealSql.connSQL();
        //查询出的子类型结果
        List<Map<String,Object>> listResult=new ArrayList<>();
        //数据库需要查询的字段
        List<String> list=new ArrayList<>();
        list.add("type_id");
        list.add("type_name");
        list.add("parent_id");
        list.add("is_leaf");
        //查询条件
        Map<String,Object> map=new HashMap<>();
        map.put("type_id",type);
        //类型查询结果
        List<Map<String,Object>> typeResult= DealSql.queryByTerms("type",list,map);
        for(int i=0;i<typeResult.size();i++){
            if(typeResult.get(i).get("is_leaf").equals("0"));
            //查询所有typeId为parentId的type
            //数据库查询字段
            List<String> list2=new ArrayList<>();
            list2.add("type_id");
            list2.add("type_name");
            list2.add("type_photo");
            list2.add("type_info");
            //数据库查询条件
            Map<String,Object> map2=new HashMap<>();
            map2.put("parent_id",type);
            listResult=DealSql.queryByTerms("type",list2,map2);
        }
        DealSql.deconnSQL();
        return listResult;
    }

    //查询所有type
    public static List<Map<String,Object>> getTypeList(){
        DealSql.connSQL();
        //最终返回的结果
        List<Map<String,Object>> result=new ArrayList<>();
        Map<String,Object> mapResult=new HashMap<>();
        //查询出的子类型结果
        List<Map<String,Object>> listResult1=new ArrayList<>();
        List<Map<String,Object>> listResult2=new ArrayList<>();
        //查询所有一级子类
        List<String> list1=new ArrayList<>();
        list1.add("type_id");
        list1.add("type_name");
        list1.add("type_photo");
        list1.add("type_info");
        list1.add("is_leaf");
        //条件
        Map<String,Object> map1=new HashMap<>();
        map1.put("parent_id","0");

        listResult1=DealSql.queryByTerms("type",list1,map1);
        mapResult.put("grade","1");
        mapResult.put("parentType","0");
        mapResult.put("typeResult",listResult1);

        result.add(mapResult);;
        //查询后续子类型
        for(int i=0;i<listResult1.size();i++){
            if(listResult1.get(i).get("is_leaf").equals("0"));
            Map<String,Object> map=new HashMap<>();
            //查询所有typeId为parentId的type
            //数据库查询字段
            List<String> list2=new ArrayList<>();
            list2.add("type_id");
            list2.add("type_name");
            list2.add("type_photo");
            list2.add("type_info");
            //数据库查询条件
            Map<String,Object> map2=new HashMap<>();
            map2.put("parent_id",listResult1.get(i).get("type_id"));
            listResult2=DealSql.queryByTerms("type",list2,map2);
            map.put("grade","2");
            map.put("parentType",listResult1.get(i).get("type_id"));
            map.put("typeResult",listResult2);
            result.add(map);
        }
        DealSql.deconnSQL();
        return result;
    }
}
