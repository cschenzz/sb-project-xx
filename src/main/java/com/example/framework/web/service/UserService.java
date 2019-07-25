package com.example.framework.web.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.project.system.user.entity.UserEntity;
import com.example.project.system.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * chenzz首创 html调用 thymeleaf 实现用户读取
 *
 * @author chenzz
 */
@Service("xxuser")
public class UserService {

    @Autowired
    private IUserService userService;


    public List<Map<String, Object>> getUsers() {
        Wrapper<UserEntity> wrapper = new LambdaQueryWrapper<UserEntity>()
                .select(UserEntity::getUserId, UserEntity::getLoginName, UserEntity::getPhonenumber, UserEntity::getUserName)
                .gt(UserEntity::getUserId, 0)
                //--------------------
                .orderByDesc(UserEntity::getUserId);

        return userService.listMaps(wrapper);
    }

}
