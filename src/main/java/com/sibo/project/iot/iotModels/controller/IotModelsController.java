package com.sibo.project.iot.iotModels.controller;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
//----------------------------
import com.sibo.framework.aspectj.lang.annotation.Log;
import com.sibo.framework.aspectj.lang.enums.BusinessType;
import com.sibo.framework.web.controller.BaseController;
import com.sibo.framework.web.entity.R;
import com.sibo.framework.web.page.PageDomain;
import com.sibo.framework.web.page.TableSupport;
import com.sibo.common.validator.ValidatorUtils;
import com.sibo.common.validator.group.AddGroup;
import com.sibo.common.validator.group.UpdateGroup;
//-----------------------------
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
//-----------------------
import com.sibo.project.iot.iotModels.entity.IotModelsEntity;
import com.sibo.project.iot.iotModels.service.IIotModelsService;

/**
 * 模型 信息操作处理
 * 
 * @author chenzz
 * @date 2019-03-14
 */
@Controller
@RequestMapping("iot/iotModels")
public class IotModelsController extends BaseController {

    private String prefix = "iot/iotModels";
	
	@Autowired
	private IIotModelsService iotModelsService;

    /**
     * 模型列表
     */
	@RequiresPermissions("iot:iotModels:view")
	@GetMapping()
	public String iotModels(ModelMap mmap) {
        putBaseModelMap(mmap, "iot:iotModels:view");
	    return prefix + "/iotModels";
	}

	/**
	 * 新增模型
	 */
	@GetMapping("/add")
	public String add() {
	    return prefix + "/add";
	}
	
	/**
	 * 修改模型
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap) {
		IotModelsEntity iotModels = iotModelsService.getById(id);
		mmap.put("iotModels", iotModels);
	    return prefix + "/edit";
	}

    /**
     * 详情页面
     */
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Integer id, ModelMap mmap) {
		IotModelsEntity iotModels = iotModelsService.getById(id);
        mmap.put("iotModels", iotModels);
        return prefix + "/detail";
    }

    //-----------------json----------------

    /**
     * 列表
     */
    @RequestMapping("/list")
    @ResponseBody
    @RequiresPermissions("iot:iotModels:list")
    public R listPage(IotModelsEntity iotModels) {
        //-----------------------
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String keyWord = pageDomain.getSearchKeyWord();

        if (!StringUtils.isEmpty(keyWord)) {
            //-----------------------
            Wrapper<IotModelsEntity> wrapper = new LambdaQueryWrapper<IotModelsEntity>()
                    .like(IotModelsEntity::getModelName, keyWord)
                    //.or().like(IotModelsEntity::getSummary, keyWord)
                    .orderByDesc(IotModelsEntity::getId);

            //---------------------------
            IPage<IotModelsEntity> pageList = iotModelsService.page(new Page<>(pageNum, pageSize), wrapper);
            return R.ok().dataRows(pageList.getTotal(), pageList.getPages(), pageList.getRecords());
            //-----------
        }

        IPage<IotModelsEntity> pageList = iotModelsService.page(new Page<>(pageNum, pageSize), null);
        return R.ok().dataRows(pageList.getTotal(), pageList.getPages(), pageList.getRecords());
        //----------------------------------------------
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @ResponseBody
    @RequiresPermissions("iot:iotModels:info")
    public R info(@PathVariable("id") Integer id) {
		IotModelsEntity iotModels = iotModelsService.getById(id);
        return R.ok().data(iotModels);
    }

    /**
     * 新增保存模型
     */
    @RequiresPermissions("iot:iotModels:add")
    @Log(title = "模型", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public R addSave(IotModelsEntity iotModels) {
        ValidatorUtils.validateEntity(iotModels, AddGroup.class);
        iotModels.setCreateTime(new Date());
		iotModelsService.save(iotModels);
        return R.ok();
    }

    /**
	 * 修改保存模型
	 */
	@RequiresPermissions("iot:iotModels:edit")
	@Log(title = "模型", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public R editSave(IotModelsEntity iotModels) {
        ValidatorUtils.validateEntity(iotModels, UpdateGroup.class);
		iotModelsService.updateById(iotModels);
        return R.ok();
	}

    /**
     * 删除模型(多个id用逗号隔开)
     */
    @RequiresPermissions("iot:iotModels:remove")
    @Log(title = "模型", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public R remove(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        boolean result = iotModelsService.removeByIds(idList);
        return result ? R.ok() : R.error();
    }
    //-------------------
	
}
