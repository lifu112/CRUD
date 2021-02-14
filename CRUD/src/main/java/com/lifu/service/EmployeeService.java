package com.lifu.service;

import com.lifu.bean.Employee;
import com.lifu.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description
 * @Author lifu
 * @Date 2021/2/11 13:56
 */
@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;

    public List<Employee> getAll() {
        return employeeMapper.selectAllWithDept();
    }

    public void saveEmp(Employee employee) {
        employeeMapper.insert(employee);
    }

    public Employee getEmp(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    public void updateEmp(Employee employee) {
        employeeMapper.updateByPrimaryKey(employee);
    }

    public void deleteEmpById(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

}
