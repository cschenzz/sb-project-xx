package com.sibo.project.system.dept.service.impl;

import com.sibo.common.constant.UserConstants;
import com.sibo.common.utils.StringUtils;
import com.sibo.common.utils.security.ShiroUtils;
import com.sibo.framework.aspectj.lang.annotation.DataScope;
import com.sibo.project.system.dept.dao.DeptMapper;
import com.sibo.project.system.dept.entity.Dept;
import com.sibo.project.system.dept.service.IDeptService;
import com.sibo.project.system.role.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 部门管理 服务实现
 *
 * @author chenzz
 */
@Service
public class DeptServiceImpl implements IDeptService {

    @Autowired
    private DeptMapper deptMapper;

    /**
     * 查询部门管理数据
     *
     * @return 部门信息集合
     */
    @Override
    @DataScope(tableAlias = "d")
    public List<Dept> selectDeptList(Dept dept) {
        return deptMapper.selectDeptList(dept);
    }

    /**
     * 查询部门管理树
     *
     * @return 所有部门信息
     */
    @Override
    public List<Map<String, Object>> selectDeptTree() {
        List<Map<String, Object>> trees = new ArrayList<Map<String, Object>>();
        List<Dept> deptList = selectDeptList(new Dept());
        trees = getTrees(deptList, false, null);
        return trees;
    }

    /**
     * 根据角色ID查询部门（数据权限）
     *
     * @param role 角色对象
     * @return 部门列表（数据权限）
     */
    @Override
    public List<Map<String, Object>> roleDeptTreeData(Role role) {
        Long roleId = role.getRoleId();
        List<Map<String, Object>> trees = new ArrayList<Map<String, Object>>();
        List<Dept> deptList = selectDeptList(new Dept());
        if (StringUtils.isNotNull(roleId)) {
            List<String> roleDeptList = deptMapper.selectRoleDeptTree(roleId);
            trees = getTrees(deptList, true, roleDeptList);
        } else {
            trees = getTrees(deptList, false, null);
        }
        return trees;
    }

    /**
     * 对象转部门树
     *
     * @param deptList     部门列表
     * @param isCheck      是否需要选中
     * @param roleDeptList 角色已存在菜单列表
     * @return
     */
    public List<Map<String, Object>> getTrees(List<Dept> deptList, boolean isCheck, List<String> roleDeptList) {

        List<Map<String, Object>> trees = new ArrayList<Map<String, Object>>();
        for (Dept dept : deptList) {
            if (UserConstants.DEPT_NORMAL.equals(dept.getStatus())) {
                Map<String, Object> deptMap = new HashMap<String, Object>();
                deptMap.put("id", dept.getDeptId());
                deptMap.put("pId", dept.getParentId());
                deptMap.put("name", dept.getDeptName());
                deptMap.put("title", dept.getDeptName());
                if (isCheck) {
                    deptMap.put("checked", roleDeptList.contains(dept.getDeptId() + dept.getDeptName()));
                } else {
                    deptMap.put("checked", false);
                }
                trees.add(deptMap);
            }
        }
        return trees;
    }

    /**
     * 查询部门人数
     *
     * @param parentId 部门ID
     * @return 结果
     */
    @Override
    public int selectDeptCount(Long parentId) {
        Dept dept = new Dept();
        dept.setParentId(parentId);
        return deptMapper.selectDeptCount(dept);
    }

    /**
     * 查询部门是否存在用户
     *
     * @param deptId 部门ID
     * @return 结果 true 存在 false 不存在
     */
    @Override
    public boolean checkDeptExistUser(Long deptId) {
        int result = deptMapper.checkDeptExistUser(deptId);
        return result > 0 ? true : false;
    }

    /**
     * 删除部门管理信息
     *
     * @param deptId 部门ID
     * @return 结果
     */
    @Override
    public int deleteDeptById(Long deptId) {
        return deptMapper.deleteDeptById(deptId);
    }

    /**
     * 新增保存部门信息
     *
     * @param dept 部门信息
     * @return 结果
     */
    @Override
    public int insertDept(Dept dept) {
        Dept info = deptMapper.selectDeptById(dept.getParentId());
        dept.setCreateBy(ShiroUtils.getLoginName());
        dept.setAncestors(info.getAncestors() + "," + dept.getParentId());
        return deptMapper.insertDept(dept);
    }

    /**
     * 修改保存部门信息
     *
     * @param dept 部门信息
     * @return 结果
     */
    @Override
    public int updateDept(Dept dept) {
        Dept info = deptMapper.selectDeptById(dept.getParentId());
        if (StringUtils.isNotNull(info)) {
            String ancestors = info.getAncestors() + "," + dept.getParentId();
            dept.setAncestors(ancestors);
            updateDeptChildren(dept.getDeptId(), ancestors);
        }
        dept.setUpdateBy(ShiroUtils.getLoginName());
        return deptMapper.updateDept(dept);
    }

    /**
     * 修改子元素关系
     *
     * @param deptId    部门ID
     * @param ancestors 元素列表
     */
    public void updateDeptChildren(Long deptId, String ancestors) {
        Dept dept = new Dept();
        dept.setParentId(deptId);
        List<Dept> childrens = deptMapper.selectDeptList(dept);
        for (Dept children : childrens) {
            children.setAncestors(ancestors + "," + dept.getParentId());
        }
        if (childrens.size() > 0) {
            deptMapper.updateDeptChildren(childrens);
        }
    }

    /**
     * 根据部门ID查询信息
     *
     * @param deptId 部门ID
     * @return 部门信息
     */
    @Override
    public Dept selectDeptById(Long deptId) {
        return deptMapper.selectDeptById(deptId);
    }

    /**
     * 校验部门名称是否唯一
     *
     * @param dept 部门信息
     * @return 结果
     */
    @Override
    public String checkDeptNameUnique(Dept dept) {
        Long deptId = StringUtils.isNull(dept.getDeptId()) ? -1L : dept.getDeptId();
        Dept info = deptMapper.checkDeptNameUnique(dept.getDeptName(), dept.getParentId());
        if (StringUtils.isNotNull(info) && info.getDeptId().longValue() != deptId.longValue()) {
            return UserConstants.DEPT_NAME_NOT_UNIQUE;
        }
        return UserConstants.DEPT_NAME_UNIQUE;
    }
}
