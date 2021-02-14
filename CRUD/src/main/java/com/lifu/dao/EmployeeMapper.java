package com.lifu.dao;

import com.lifu.bean.Employee;
import java.util.List;

public interface EmployeeMapper {
    int deleteByPrimaryKey(Integer empId);

    int insert(Employee record);

    Employee selectByPrimaryKey(Integer empId);

    List<Employee> selectAll();

    Employee selectByPrimaryKeyWithDept(Integer empId);

    List<Employee> selectAllWithDept();

    int updateByPrimaryKey(Employee record);
}