package com.sibo.project.yl.article.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.project.yl.article.dao.ArticleDao;
import com.sibo.project.yl.article.entity.ArticleEntity;
import com.sibo.project.yl.article.service.IArticleService;
import org.springframework.stereotype.Service;

//------------------------


@Service("articleService")
public class ArticleServiceImpl extends ServiceImpl<ArticleDao, ArticleEntity> implements IArticleService {

    public IPage<ArticleEntity> selectArticlePage(Page page) {
        // 不进行 count sql 优化，解决 MP 无法自动优化 SQL 问题，这时候你需要自己查询 count 部分
        // page.setOptimizeCountSql(false);
        // 当 total 为非 0 时(默认为 0),分页插件不会进行 count 查询
        // 要点!! 分页返回的对象与传入的对象是同一个
        return baseMapper.selectPageVo(page, null);
    }

    public IPage<ArticleEntity> selectArticlePageWhere(Page page, String typeKey, String searchValue) {
        return baseMapper.selectPageVoWhere(page, typeKey, searchValue);
    }

}
