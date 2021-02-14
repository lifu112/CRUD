package com.lifu.test;

import com.lifu.bean.Employee;
import com.lifu.dao.EmployeeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

import static org.junit.Assert.*;

/**
 * @Description
 * @Author lifu
 * @Date 2021/2/11 10:51
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"classpath:applicationContext.xml"} )
public class EmployeeMapperTest {
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Test
    public void deleteByPrimaryKey() {

    }

    @Test
    public void insert() {
//        employeeMapper.insert(new Employee(null,"Tom","男","tom@qq.com",1));
//        employeeMapper.insert(new Employee(null,"Jerry","男","tom@qq.com",2));
        EmployeeMapper mapper = sqlSessionTemplate.getMapper(EmployeeMapper.class);
        for (int i=0;i<100;i++){
            String name = UUID.randomUUID().toString().substring(0, 5);
            mapper.insert(new Employee(null,name,"男",name+"@qq.com",1));
        }
    }

    @Test
    public void selectByPrimaryKey() {
    }

    @Test
    public void selectAll() {
    }

    @Test
    public void selectByPrimaryKeyWithDept() {
    }

    @Test
    public void selectAllWithDept() {
    }

    @Test
    public void updateByPrimaryKey() {
    }
}