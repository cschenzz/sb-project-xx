package com.sibo.project.iot.iotModelRule.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.project.iot.iotModelRule.dao.IotModelRuleDao;
import com.sibo.project.iot.iotModelRule.entity.IotModelRuleEntity;
import com.sibo.project.iot.iotModelRule.service.IIotModelRuleService;

/**
 * 规则 服务层实现
 * 
 * @author chenzz
 * @date 2019-03-14
 */
@Service("iotModelRuleService")
public class IotModelRuleServiceImpl extends ServiceImpl<IotModelRuleDao, IotModelRuleEntity> implements IIotModelRuleService {
}
