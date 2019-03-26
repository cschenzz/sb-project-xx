package com.sibo.project.monitor.online.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.common.utils.DateUtils;
import com.sibo.common.utils.StringUtils;
import com.sibo.framework.shiro.session.OnlineSessionDAO;
import com.sibo.framework.web.page.PageDomain;
import com.sibo.framework.web.page.TableSupport;
import com.sibo.project.monitor.online.dao.UserOnlineMapper;
import com.sibo.project.monitor.online.entity.UserOnlineEntity;
import com.sibo.project.monitor.online.service.IUserOnlineService;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 在线用户 服务层处理
 *
 * @author chenzz
 */
@Service
public class UserOnlineServiceImpl extends ServiceImpl<UserOnlineMapper, UserOnlineEntity> implements IUserOnlineService {
    @Autowired
    private UserOnlineMapper userOnlineDao;

    @Autowired
    private OnlineSessionDAO onlineSessionDAO;

    @Override
    public IPage<?> listPage(UserOnlineEntity userOnline) {
        //-----------------------
        //http://localhost:5000/sys/user/listFuncs?limit=10&page=1&sidx=create_time&asc=desc&_=1534490135367
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String keyWord = pageDomain.getSearchKeyWord();

        if (!StringUtils.isEmpty(keyWord)) {
            //-----------------------
            Wrapper<UserOnlineEntity> wrapper = new LambdaQueryWrapper<UserOnlineEntity>()
                    .like(UserOnlineEntity::getLoginName, keyWord)
                    //.or().like(UserEntity::getEmail, keyWord)
                    .orderByDesc(UserOnlineEntity::getSessionId);

            //---------------------------
            IPage<UserOnlineEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapper);
            return pageList;
            //-----------
        }

        Wrapper<UserOnlineEntity> wrapperSort = new LambdaQueryWrapper<UserOnlineEntity>()
                .orderByDesc(UserOnlineEntity::getSessionId);

        IPage<UserOnlineEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapperSort);
        return pageList;
        //----------------------------------------------
    }

    /**
     * 通过会话序号查询信息
     *
     * @param sessionId 会话ID
     * @return 在线用户信息
     */
    @Override
    public UserOnlineEntity selectOnlineById(String sessionId) {
        return userOnlineDao.selectOnlineById(sessionId);
    }

    /**
     * 通过会话序号删除信息
     *
     * @param sessionId 会话ID
     * @return 在线用户信息
     */
    @Override
    public void deleteOnlineById(String sessionId) {
        UserOnlineEntity userOnline = selectOnlineById(sessionId);
        if (StringUtils.isNotNull(userOnline)) {
            userOnlineDao.deleteOnlineById(sessionId);
        }
    }

    /**
     * 通过会话序号删除信息
     *
     * @param sessions 会话ID集合
     * @return 在线用户信息
     */
    @Override
    public void batchDeleteOnline(List<String> sessions) {
        for (String sessionId : sessions) {
            UserOnlineEntity userOnline = selectOnlineById(sessionId);
            if (StringUtils.isNotNull(userOnline)) {
                userOnlineDao.deleteOnlineById(sessionId);
            }
        }
    }

    /**
     * 保存会话信息
     *
     * @param online 会话信息
     */
    @Override
    public void saveOnline(UserOnlineEntity online) {
        userOnlineDao.saveOnline(online);
    }

    /**
     * 查询会话集合
     *
     * @param userOnline 分页参数
     */
    @Override
    public List<UserOnlineEntity> selectUserOnlineList(UserOnlineEntity userOnline) {
        return userOnlineDao.selectUserOnlineList(userOnline);
    }

    /**
     * 强退用户
     *
     * @param sessionId 会话ID
     */
    @Override
    public void forceLogout(String sessionId) {
        Session session = onlineSessionDAO.readSession(sessionId);
        if (session == null) {
            return;
        }
        session.setTimeout(1000);
        userOnlineDao.deleteOnlineById(sessionId);
    }

    /**
     * 查询会话集合
     *
     * @param expiredDate 会话信息
     */
    @Override
    public List<UserOnlineEntity> selectOnlineByExpired(Date expiredDate) {
        String lastAccessTime = DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD_HH_MM_SS, expiredDate);
        return userOnlineDao.selectOnlineByExpired(lastAccessTime);
    }
}
