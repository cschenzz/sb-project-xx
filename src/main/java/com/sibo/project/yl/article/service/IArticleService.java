package com.sibo.project.yl.article.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sibo.project.yl.article.entity.ArticleEntity;

/**
 * 文章 服务层
 *
 * @author chenzz
 * @date 2018-10-20
 */
public interface IArticleService extends IService<ArticleEntity> {

    IPage<ArticleEntity> selectArticlePage(Page page);

    IPage<ArticleEntity> selectArticlePageWhere(Page page, String typeKey, String searchValue);

}
