package org.snnu.edu;

import com.google.gson.Gson;
import org.snnu.edu.service.CartsService;
import org.snnu.edu.service.GoodsListService;
import org.snnu.edu.service.GoodsShowService;
import org.snnu.edu.service.TypeListService;
import org.snnu.edu.utils.CamelUtil;
import org.snnu.edu.utils.DealSql;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by 小贝 on 2017/12/27.
 */
public class main {
    public static void main(String[]args){
        boolean result=false;
        DealSql.connSQL();

            System.out.println("==========");
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
            vaules.add("1");
            vaules.add("1");
            vaules.add("123");
            vaules.add("2");
            vaules.add("12313");
            vaules.add("红色");
            List<List<String>> lists=new ArrayList<>();
            lists.add(vaules);
            int i=DealSql.insert("myOrder",terms,lists);
            if(i>0){
                result=true;
            }

        DealSql.deconnSQL();
    }
}
