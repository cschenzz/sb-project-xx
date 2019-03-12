package com.sibo.project.iot.logOper.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.project.iot.logOper.dao.LogOperDao;
import com.sibo.project.iot.logOper.entity.LogOperEntity;
import com.sibo.project.iot.logOper.service.ILogOperService;

/**
 * 操作日志记录 服务层实现
 * 
 * @author chenzz
 * @date 2019-03-12
 */
@Service("logOperService")
public class LogOperServiceImpl extends ServiceImpl<LogOperDao, LogOperEntity> implements ILogOperService {
}
