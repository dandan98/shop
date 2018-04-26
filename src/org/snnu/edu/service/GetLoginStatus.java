package org.snnu.edu.service;

import javax.servlet.http.HttpSession;

/**
 * Created by 小贝 on 2017/12/21.
 */
public class GetLoginStatus {
    public static boolean getStatus(HttpSession session){
        String userName=(String)session.getAttribute("userName");
        if(userName!=null&&!userName.equals("")){
            return true;
        }
        return false;
    }
}
