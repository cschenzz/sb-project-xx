package com.sibo.common.validator.group;

import javax.validation.GroupSequence;

/**
 * 定义校验顺序，如果AddGroup组失败，则UpdateGroup组不会再校验
 * @author chenzz
 * @email cs.chenzz@qq.com
 * @date 2019-01-28 10:32:21
 */
@GroupSequence({AddGroup.class, UpdateGroup.class})
public interface Group {
}
