package com.sibo.common.validator;


import com.sibo.common.exception.base.BaseException;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import java.util.Set;

/**
 * @author chenzz
 * @email cs.chenzz@qq.com
 * @date 2019-01-28 10:32:21
 */
public class ValidatorUtils {
    private static Validator validator;

    static {
        validator = Validation.buildDefaultValidatorFactory().getValidator();
    }

    /**
     * 校验对象
     *
     * @param object 待校验对象
     * @param groups 待校验的组
     * @throws BaseException 校验不通过，则报BaseException异常
     */
    public static void validateEntity(Object object, Class<?>... groups)
            throws BaseException {
        Set<ConstraintViolation<Object>> constraintViolations = validator.validate(object, groups);
        if (!constraintViolations.isEmpty()) {
            System.out.println("-----------------------");
            StringBuilder sbMessage = new StringBuilder();
            constraintViolations.forEach((s) -> {
                System.out.println(s.getPropertyPath() + ":" + s.getMessage());
                System.out.println(s);
                //-------------
                sbMessage.append(s.getMessage()).append("<br/>");
            });
            //-------------------
            throw new BaseException(sbMessage.toString());
        }
    }
}
