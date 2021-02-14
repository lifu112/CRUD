package com.lifu.service;

import com.lifu.bean.Department;
import com.lifu.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description
 * @Author lifu
 * @Date 2021/2/12 16:02
 */
@Service
public class DepartmentService {
    @Autowired
    DepartmentMapper departmentMapper;

    public List<Department> getDepts() {
        List<Department> departments = departmentMapper.selectAll();
        return departments;
    }
}
