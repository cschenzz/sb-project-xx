package com.sibo.project.monitor.online.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sibo.project.monitor.online.entity.UserOnlineEntity;

import java.util.Date;
import java.util.List;

/**
 * 在线用户 服务层
 *
 * @author chenzz
 */
public interface IUserOnlineService extends IService<UserOnlineEntity> {

    IPage<?> listPage(UserOnlineEntity userOnline);

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
    void deleteOnlineById(String sessionId);

    /**
     * 通过会话序号删除信息
     *
     * @param sessions 会话ID集合
     * @return 在线用户信息
     */
    void batchDeleteOnline(List<String> sessions);

    /**
     * 保存会话信息
     *
     * @param online 会话信息
     */
    void saveOnline(UserOnlineEntity online);

    /**
     * 查询会话集合
     *
     * @param userOnline 分页参数
     * @return 会话集合
     */
    List<UserOnlineEntity> selectUserOnlineList(UserOnlineEntity userOnline);

    /**
     * 强退用户
     *
     * @param sessionId 会话ID
     */
    void forceLogout(String sessionId);

    /**
     * 查询会话集合
     *
     * @param expiredDate 有效期
     * @return 会话集合
     */
    List<UserOnlineEntity> selectOnlineByExpired(Date expiredDate);
}
