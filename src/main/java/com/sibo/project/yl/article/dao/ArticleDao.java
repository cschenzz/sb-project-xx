package com.sibo.project.yl.article.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sibo.project.yl.article.entity.ArticleEntity;
import org.apache.ibatis.annotations.Param;

/**
 * 文章表
 *
 * @author chenzz
 * @email cs.chenzz@qq.com
 * @date 2018-09-14 16:30:25
 */
public interface ArticleDao extends BaseMapper<ArticleEntity> {

    /**
     * <p>
     * 查询 : 根据state状态查询用户列表，分页显示
     * 注意!!: 如果入参是有多个,需要加注解指定参数名才能在xml中取值
     * </p>
     *
     * @param page    分页对象,xml中可以从里面进行取值,传递参数 Page 即自动分页,必须放在第一位(你可以继承Page实现自己的分页对象)
     * @param typeKey 查询条件值
     * @return 分页对象
     */
    IPage<ArticleEntity> selectPageVo(Page page, @Param("type_key") String typeKey);

    IPage<ArticleEntity> selectPageVoWhere(Page page, @Param("type_key") String typeKey, @Param("searchValue") String searchValue);
    //----------------------------------------
}
