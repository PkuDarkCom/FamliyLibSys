package com.ch.fls.utils;

import java.util.UUID;

public class UUIDUtils {
    /**
     * 获取UUID
     *
     * @return
     */
    public static String getUUID() {
         return UUID.randomUUID().toString().replace("-", "");
    }
    
    public static String getUUID20() {
         return UUID.randomUUID().toString().replace("-", "").substring(0, 20);
    }

}
