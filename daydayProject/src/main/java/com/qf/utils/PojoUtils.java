package com.qf.utils;

import com.qf.pojo.User;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;

public class PojoUtils {
    /**
     * @param object      对象
     * @param isEmptyArgs 哪些对象的属性可以为null或者""
     * @return
     * @throws Exception
     */
    public static boolean isEmpty(Object object, String... isEmptyArgs) {
        try {
            BeanInfo beanInfo = Introspector.getBeanInfo(object.getClass());
            PropertyDescriptor[] pds = beanInfo.getPropertyDescriptors();
            out:
            for (PropertyDescriptor pd : pds) {
                for (String emptyArg : isEmptyArgs) {
                    if (pd.getName().equals(emptyArg)) {
                        continue out;
                    }
                }
                Method rm = pd.getReadMethod();
                Object value = rm.invoke(object);
                if (value == null) {
                    return true;
                }
                if (value instanceof String) {
                    String str = (String) value;
                    if (str.equals("")) {
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
