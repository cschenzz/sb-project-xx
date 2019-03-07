package com.sibo.framework.web.service;

import com.sibo.project.system.config.service.IConfigService;
import com.sibo.project.system.user.entity.User;
import com.sibo.project.system.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author chenzz
 */
@Service("sysuser")
public class UserService {

    @Autowired
    private IUserService userService;

    /**
     * 根据ID查询用户名
     *
     * @param id 用户id
     * @return 参数键值
     */
    public Map<String,Object> getKey(Long id) {
        Map<String,Object> map=new HashMap<>();

        User entity= userService.selectUserById(id);
        if(entity!=null){
            map.put("loginname",entity.getLoginName());
            map.put("phonenumber",entity.getPhonenumber());
            map.put("username",entity.getUserName());
            map.put("email",entity.getEmail());
        }
        return map;
    }

}
