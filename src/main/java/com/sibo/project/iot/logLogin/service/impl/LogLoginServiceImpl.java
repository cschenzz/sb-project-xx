package com.sibo.project.iot.logLogin.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.project.iot.logLogin.dao.LogLoginDao;
import com.sibo.project.iot.logLogin.entity.LogLoginEntity;
import com.sibo.project.iot.logLogin.service.ILogLoginService;

/**
 * 系统访问记录 服务层实现
 * 
 * @author chenzz
 * @date 2019-03-12
 */
@Service("logLoginService")
public class LogLoginServiceImpl extends ServiceImpl<LogLoginDao, LogLoginEntity> implements ILogLoginService {
}
