package com.sibo.framework.web.entity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 操作消息提醒
 *
 * @author chenzz
 */
public class R extends HashMap<String, Object> {

    private static final long serialVersionUID = 1L;

    private R() {
        put("code", 200);
        put("msg", "success");
    }

    /**
     * 500错误
     *
     * @return
     */
    public static R error() {
        return error(500, "操作失败,未知异常");
    }

    /**
     * 自定义错误msg
     * usage:R.error("password error");
     *
     * @param msg
     * @return
     */
    public static R error(String msg) {
        return error(500, msg);
    }

    /**
     * 自定义错误code,msg
     *
     * @param code
     * @param msg
     * @return
     */
    public static R error(int code, String msg) {
        R r = new R();
        r.put("code", code);
        r.put("msg", msg);
        return r;
    }

    /**
     * 返回成功,code=200
     *
     * @param msg 成功消息
     * @return
     */
    public static R ok(String msg) {
        R r = new R();
        r.put("msg", msg);
        return r;
    }

    /**
     * 返回成功,code=200
     *
     * @return
     */
    public static R ok() {
        return new R();
    }

    //-------------------------------

    /**
     * 设置返回的Data值
     * usage:R.ok().data(bean);
     *
     * @param o
     * @return
     */
    public R data(Object o) {
        // super.put("data", o);
        // return this;
        return put("data", o);
    }


    /**
     * 返回符合bootstrap表格分页的数据
     * eg:
     * {"msg": "success","total": 1000,"pageCount": 30,"code": 200,"rows": []}
     * usage:R.ok().dataRows(pageList.getTotal(), pageList.getPages(), pageList.getRecords());
     *
     * @param total     记录条数
     * @param pageCount 总页数
     * @param rows      数据列表
     * @return
     */
    public R dataRows(long total, long pageCount, List<?> rows) {
        put("total", total).put("pageCount", pageCount).put("rows", rows);
        return this;
    }
    //-----------------------

    /**
     * 添加自定义key,value值
     * usage:R.ok().put("comment", comment);
     *
     * @param key
     * @param value
     * @return
     */
    @Override
    public R put(String key, Object value) {
        super.put(key, value);
        return this;
    }

    /**
     * 添加map
     *
     * @param map
     * @return
     */
    public R putMap(Map<String, Object> map) {
        super.putAll(map);
        return this;
    }

    //-----------------------

}
