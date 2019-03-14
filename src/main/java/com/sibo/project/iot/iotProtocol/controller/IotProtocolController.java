package com.sibo.project.iot.iotProtocol.controller;

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
import java.util.List;
//-----------------------
import com.sibo.project.iot.iotProtocol.entity.IotProtocolEntity;
import com.sibo.project.iot.iotProtocol.service.IIotProtocolService;

/**
 * 协议 信息操作处理
 * 
 * @author chenzz
 * @date 2019-03-14
 */
@Controller
@RequestMapping("iot/iotProtocol")
public class IotProtocolController extends BaseController {

    private String prefix = "iot/iotProtocol";
	
	@Autowired
	private IIotProtocolService iotProtocolService;

    /**
     * 协议列表
     */
	@RequiresPermissions("iot:iotProtocol:view")
	@GetMapping()
	public String iotProtocol(ModelMap mmap) {
        putBaseModelMap(mmap, "iot:iotProtocol:view");
	    return prefix + "/iotProtocol";
	}

	/**
	 * 新增协议
	 */
	@GetMapping("/add")
	public String add() {
	    return prefix + "/add";
	}
	
	/**
	 * 修改协议
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap) {
		IotProtocolEntity iotProtocol = iotProtocolService.getById(id);
		mmap.put("iotProtocol", iotProtocol);
	    return prefix + "/edit";
	}

    /**
     * 详情页面
     */
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Integer id, ModelMap mmap) {
		IotProtocolEntity iotProtocol = iotProtocolService.getById(id);
        mmap.put("iotProtocol", iotProtocol);
        return prefix + "/detail";
    }

    //-----------------json----------------

    /**
     * 列表
     */
    @RequestMapping("/list")
    @ResponseBody
    @RequiresPermissions("iot:iotProtocol:list")
    public R listPage(IotProtocolEntity iotProtocol) {
        //-----------------------
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String keyWord = pageDomain.getSearchKeyWord();

        if (!StringUtils.isEmpty(keyWord)) {
            //-----------------------
            Wrapper<IotProtocolEntity> wrapper = new LambdaQueryWrapper<IotProtocolEntity>()
                    //.like(IotProtocolEntity::getTitle, keyWord)
                    //.or().like(IotProtocolEntity::getSummary, keyWord)
                    .orderByDesc(IotProtocolEntity::getId);

            //---------------------------
            IPage<IotProtocolEntity> pageList = iotProtocolService.page(new Page<>(pageNum, pageSize), wrapper);
            return R.ok().dataRows(pageList.getTotal(), pageList.getPages(), pageList.getRecords());
            //-----------
        }

        IPage<IotProtocolEntity> pageList = iotProtocolService.page(new Page<>(pageNum, pageSize), null);
        return R.ok().dataRows(pageList.getTotal(), pageList.getPages(), pageList.getRecords());
        //----------------------------------------------
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @ResponseBody
    @RequiresPermissions("iot:iotProtocol:info")
    public R info(@PathVariable("id") Integer id) {
		IotProtocolEntity iotProtocol = iotProtocolService.getById(id);
        return R.ok().data(iotProtocol);
    }

    /**
     * 新增保存协议
     */
    @RequiresPermissions("iot:iotProtocol:add")
    @Log(title = "协议", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public R addSave(IotProtocolEntity iotProtocol) {
        ValidatorUtils.validateEntity(iotProtocol, AddGroup.class);
		iotProtocolService.save(iotProtocol);
        return R.ok();
    }

    /**
	 * 修改保存协议
	 */
	@RequiresPermissions("iot:iotProtocol:edit")
	@Log(title = "协议", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public R editSave(IotProtocolEntity iotProtocol) {
        ValidatorUtils.validateEntity(iotProtocol, UpdateGroup.class);
		iotProtocolService.updateById(iotProtocol);
        return R.ok();
	}

    /**
     * 删除协议(多个id用逗号隔开)
     */
    @RequiresPermissions("iot:iotProtocol:remove")
    @Log(title = "协议", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public R remove(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        boolean result = iotProtocolService.removeByIds(idList);
        return result ? R.ok() : R.error();
    }
    //-------------------
	
}
