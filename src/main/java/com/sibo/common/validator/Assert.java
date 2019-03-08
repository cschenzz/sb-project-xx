package com.sibo.common.validator;

import com.sibo.common.exception.base.BaseException;
import org.apache.commons.lang3.StringUtils;

/**
 * 数据校验
 *
 * @author chenzz
 * @email cs.chenzz@qq.com
 * @date 2019-01-28 10:32:21
 */
public abstract class Assert {

    public static void isBlank(String str, String message) {
        if (StringUtils.isBlank(str)) {
            throw new BaseException(message);
        }
    }

    public static void isNull(Object object, String message) {
        if (object == null) {
            throw new BaseException(message);
        }
    }
}
