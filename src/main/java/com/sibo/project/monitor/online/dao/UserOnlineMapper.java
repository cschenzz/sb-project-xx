package com.sibo.project.monitor.online.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sibo.project.monitor.online.entity.UserOnlineEntity;

import java.util.List;

/**
 * 在线用户 数据层
 *
 * @author chenzz
 */
public interface UserOnlineMapper extends BaseMapper<UserOnlineEntity> {
    /**
     * 通过会话序号查询信息
     *
     * @param sessionId 会话ID
     * @return 在线用户信息
     */
    UserOnlineEntity selectOnlineById(String sessionId);

    /**
     * 通过会话序号删除信息
     *
     * @param sessionId 会话ID
     * @return 在线用户信息
     */
    int deleteOnlineById(String sessionId);

    /**
     * 保存会话信息
     *
     * @param online 会话信息
     * @return 结果
     */
    int saveOnline(UserOnlineEntity online);

    /**
     * 查询会话集合
     *
     * @param userOnline 会话参数
     * @return 会话集合
     */
    List<UserOnlineEntity> selectUserOnlineList(UserOnlineEntity userOnline);

    /**
     * 查询过期会话集合
     *
     * @param lastAccessTime 过期时间
     * @return 会话集合
     */
    List<UserOnlineEntity> selectOnlineByExpired(String lastAccessTime);
}
