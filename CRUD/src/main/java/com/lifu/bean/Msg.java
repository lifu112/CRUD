package com.lifu.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * @Description
 * @Author lifu
 * @Date 2021/2/11 18:42
 */
public class Msg {
    //状态码
    private int code;
    //提示信息
    private String msg;
    //返回的数据
    private Map<String,Object> page = new HashMap<>();

    public static Msg success(){
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("处理成功");
        return result;
    }
    public static Msg fail(){
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("失败");
        return result;
    }
    public Msg add(String key, Object value){
        this.getPage().put(key,value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getPage() {
        return page;
    }

    public void setPage(Map<String, Object> page) {
        this.page = page;
    }
}
