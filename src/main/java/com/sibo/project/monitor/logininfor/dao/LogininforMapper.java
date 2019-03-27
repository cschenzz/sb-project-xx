package com.sibo.project.monitor.logininfor.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sibo.project.monitor.logininfor.entity.LogininforEntity;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 系统访问日志情况信息 数据层
 *
 * @author chenzz
 */
public interface LogininforMapper extends BaseMapper<LogininforEntity> {
    /**
     * 清空系统登录日志
     *
     * @return 结果
     */
    @Delete("truncate table sys_logininfor")
    int cleanLogininfor();

    //------------------------------
    @Select("SELECT * FROM users")
    @Results({
            //@Result(property = "userSex", column = "user_sex", javaType = UserSexEnum.class),
            @Result(property = "nickName", column = "nick_name")
    })
    List<LogininforEntity> getAll();
}