package org.snnu.edu.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by zero on 2017/7/31.
 */
public class CamelUtil {


    public static final char UNDERLINE = '_';

    public static String camelToUnderline(String param) {
        if (param == null || "".equals(param.trim())) {
            return "";
        }
        int len = param.length();
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            char c = param.charAt(i);
            if (Character.isUpperCase(c)) {
                sb.append(UNDERLINE);
                sb.append(Character.toLowerCase(c));
            } else {
                sb.append(c);
            }
        }
        return sb.toString();
    }

    public static String underlineToCamel(String param) {
        if (param == null || "".equals(param.trim())) {
            return "";
        }
        int len = param.length();
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            char c = param.charAt(i);
            if (c == UNDERLINE) {
                if (++i < len) {
                    sb.append(Character.toUpperCase(param.charAt(i)));
                }
            } else {
                sb.append(c);
            }
        }
        return sb.toString();
    }

    public static String underlineToCamel2(String param) {
        if (param == null || "".equals(param.trim())) {
            return "";
        }
        StringBuilder sb = new StringBuilder(param);
        Matcher mc = Pattern.compile("_").matcher(param);
        int i = 0;
        while (mc.find()) {
            int position = mc.end() - (i++);
            //String.valueOf(Character.toUpperCase(sb.charAt(position)));
            sb.replace(position - 1, position + 1, sb.substring(position, position + 1).toUpperCase());
        }
        return sb.toString();
    }


    public static String[] camelToUnderline(String[] fields) {


        if (fields == null || fields.length < 0)
            return null;

        String[] data = new String[fields.length];

        for (int i = 0; i < fields.length; i++) {

            data[i] = camelToUnderline(fields[i]);

        }

        return data;
    }
}

