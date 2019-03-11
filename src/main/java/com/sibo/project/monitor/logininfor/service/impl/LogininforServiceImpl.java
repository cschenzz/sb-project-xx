package com.sibo.project.monitor.logininfor.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.project.monitor.logininfor.dao.LogininforMapper;
import com.sibo.project.monitor.logininfor.entity.Logininfor;
import com.sibo.project.monitor.logininfor.service.ILogininforService;
import org.springframework.stereotype.Service;

/**
 * 系统访问日志情况信息 服务层处理
 *
 * @author chenzz
 */
@Service
public class LogininforServiceImpl extends ServiceImpl<LogininforMapper, Logininfor> implements ILogininforService {
}
