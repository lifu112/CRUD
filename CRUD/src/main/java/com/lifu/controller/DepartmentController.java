package com.lifu.controller;

import com.lifu.bean.Department;
import com.lifu.bean.Msg;
import com.lifu.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Description
 * @Author lifu
 * @Date 2021/2/12 15:41
 */
@Controller
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        List<Department> departments= departmentService.getDepts();
        return Msg.success().add("depts",departments);
    }

}
