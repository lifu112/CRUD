package com.lifu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lifu.bean.Employee;
import com.lifu.bean.Msg;
import com.lifu.service.EmployeeService;
import jdk.swing.interop.SwingInterOpUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description
 * @Author lifu
 * @Date 2021/2/11 13:50
 */
@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

//    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        PageHelper.startPage(pn,5);
        List<Employee> employees = employeeService.getAll();
        PageInfo pageInfo = new PageInfo(employees,5);
        model.addAttribute("pageInfo",pageInfo);
        return "list";
    }

    @RequestMapping("/emps")
    @ResponseBody//将返回结果自动封装成json
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        List<Employee> employees = employeeService.getAll();
        PageInfo pageInfo = new PageInfo(employees,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody//将返回结果自动封装成json
    public Msg getEmp(@PathVariable("id") Integer id){
        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp",employee);
    }

    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody//将返回结果自动封装成json
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            Map<String,Object> map = new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError : fieldErrors){
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map);
        }else {
            employeeService.saveEmp(employee);
            System.out.println(employee);
            return Msg.success();
        }
    }

    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    @ResponseBody//将返回结果自动封装成json
    public Msg updateEmp(Employee employee){
        System.out.println(employee);
        employeeService.updateEmp(employee);
        return Msg.success();
    }

    @RequestMapping(value = "/emp/{id}",method = RequestMethod.DELETE)
    @ResponseBody//将返回结果自动封装成json
    public Msg deleteEmpById(@PathVariable("id") String id){
        if(id.contains("-")){
            //批量刪除
            String[] str_ids = id.split("-");
            for(String str_id : str_ids){
                employeeService.deleteEmpById(Integer.parseInt(str_id));
            }
            return Msg.success();
        }else {
            employeeService.deleteEmpById(Integer.parseInt(id));
            return Msg.success();
        }

    }
}
