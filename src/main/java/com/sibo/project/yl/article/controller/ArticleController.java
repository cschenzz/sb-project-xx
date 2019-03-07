package com.sibo.project.yl.article.controller;

//----------------------

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sibo.common.exception.base.BaseException;
import com.sibo.framework.aspectj.lang.annotation.Log;
import com.sibo.framework.aspectj.lang.enums.BusinessType;
import com.sibo.framework.web.controller.BaseController;
import com.sibo.framework.web.entity.R;
import com.sibo.framework.web.page.PageDomain;
import com.sibo.framework.web.page.TableSupport;
import com.sibo.project.yl.article.entity.ArticleEntity;
import com.sibo.project.yl.article.service.IArticleService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Date;
import java.util.List;


/**
 * 文章表
 *
 * @author chenzz
 * @email cs.chenzz@qq.com
 * @date 2018-09-14 16:30:25
 */
@Controller
@RequestMapping("yl/article")
public class ArticleController extends BaseController {

    private String prefix = "yl/article";

    @Autowired
    private IArticleService articleService;

    /**
     * 列表html页面
     */
    @RequiresPermissions("yl:article:view")
    @GetMapping()
    public String article(ModelMap mmap) {
        putBaseModelMap(mmap, "yl:article:view");
        return prefix + "/article";
    }

    /**
     * 新增文章
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }


    @GetMapping("detail/{id}")
    public String viewArticle(@PathVariable("id") Long id, Model model) {
        ArticleEntity entity = articleService.getById(id);
        model.addAttribute("article", entity);
        return prefix + "/view";
    }


    /**
     * 修改
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        ArticleEntity article = articleService.getById(id);
        model.addAttribute("article", article);
        return prefix + "/edit";
    }

    //--------json----------

    /**
     * 列表
     */
    @RequestMapping("/list")
    @ResponseBody
    @RequiresPermissions("yl:article:list")
    public R listPage(@RequestParam(value = "type", required = false, defaultValue = "0") int type, ArticleEntity article) {
        //-----------------------
        //http://localhost:5000/sys/user/listFuncs?limit=10&page=1&sidx=create_time&asc=desc&_=1534490135367
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        //String orderBy = pageDomain.getOrderBy();

        String searchValue = article.getSearchValue();

        String typeKey = null;

        if (type == 1) typeKey = "健康资讯";
        else if (type == 2) typeKey = "健康小常识";

        IPage<ArticleEntity> pageList = articleService.selectArticlePageWhere(new Page<>(pageNum, pageSize), typeKey, searchValue);
        return R.ok().dataRows(pageList.getTotal(), pageList.getPages(), pageList.getRecords());
        //----------------------------------------------
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @ResponseBody
    @RequiresPermissions("yl:article:info")
    public R info(@PathVariable("id") Long id) {
        ArticleEntity article = articleService.getById(id);

        return R.ok().put("article", article);
    }

    /**
     * 新增保存文章
     */
    @RequiresPermissions("yl:article:add")
    @Log(title = "文章", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public R addSave(ArticleEntity article) {
        verifyForm(article);

        article.setAddUserId(getUserId());
        article.setCreateTime(new Date());
        articleService.save(article);

        return R.ok();
    }


    /**
     * 修改保存文章
     */
    @RequiresPermissions("yl:article:edit")
    @Log(title = "文章", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public R editSave(ArticleEntity article) {
        //verifyForm(entity);
        article.setUpdateUserId(getUserId());
        article.setUpdateTime(new Date());
        articleService.updateById(article);

        return R.ok();
    }


    /**
     * 删除文章
     */
    @RequiresPermissions("yl:article:remove")
    @Log(title = "文章", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public R remove(String ids) {
        List idList = Arrays.asList(ids.split(","));
        boolean result = articleService.removeByIds(idList);
        if (result) return R.ok();

        return R.error();
    }

    //-------------------

    /**
     * 数据校验
     */
    private void verifyForm(ArticleEntity entity) {
        if (StringUtils.isEmpty(entity.getTitle())) {
            throw new BaseException("名称不能为空");
        }
    }
    //--------------------

}
