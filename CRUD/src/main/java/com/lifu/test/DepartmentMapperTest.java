package com.lifu.test;

import com.lifu.bean.Department;
import com.lifu.dao.DepartmentMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

/**
 * @Description
 * @Author lifu
 * @Date 2021/2/11 10:52
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"classpath:applicationContext.xml"} )
public class DepartmentMapperTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Test
    public void insert() {
        departmentMapper.insert(new Department(null,"财务部"));
    }

    @Test
    public void deleteByPrimaryKey() {
    }

    @Test
    public void selectByPrimaryKey() {
        Department department = departmentMapper.selectByPrimaryKey(1);
        System.out.println(department);
    }

    @Test
    public void selectAll() {
        List<Department> departments = departmentMapper.selectAll();
        System.out.println(departments);
    }

    @Test
    public void updateByPrimaryKey() {
        departmentMapper.updateByPrimaryKey(new Department(3,"市场部"));
    }
}