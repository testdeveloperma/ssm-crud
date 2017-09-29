package com.mcj.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.*;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.mcj.crud.bean.Department;
import com.mcj.crud.bean.Employee;
import com.mcj.crud.dao.DepartmentMapper;
import com.mcj.crud.dao.EmployeeMapper;
/**
 * 1、导入SpringTest模块
 * 2、@ContextConfiguration指定Spring配置文件的位置
 * 3、直接Autowired
 * @author Troy
 *
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MappperTest {

	@Autowired
	DepartmentMapper departmentMapper;
	
	
	@Test
	public void  testCrud(){
		
//		ApplicationContext act = new ClassPathXmlApplicationContext("applicationContext.xml");	
//		DepartmentMapper departmentMapper = act.getBean(DepartmentMapper.class);
		
		//1、创建部门
//		System.out.println(departmentMapper);
//		departmentMapper.insertSelective(new Department(null, "测试部"));
//		departmentMapper.insertSelective(new Department(null, "开发部"));
		//2、生成员工数据
//		EmployeeMapper employeeMapper = act.getBean(EmployeeMapper.class);
//		employeeMapper.insertSelective(new Employee(null, "Troy", "M", "troy@elong.com", 1, null));
		//3、批量生成员工数据
		
//		SqlSession sqlSession= (SqlSession) act.getBean("sqlSession");
//		EmployeeMapper employeeMapper2 = sqlSession.getMapper(EmployeeMapper.class);
//		for (int i = 0; i < 1000; i++) {
//			String uid = UUID.randomUUID().toString().substring(0, 5) + i;
//			employeeMapper2.insertSelective(new Employee(null, uid, "M", uid+"@elong.com", 1, null));
//		}
		
		Department department = departmentMapper.selectByPrimaryKey(1);
		System.out.println(department);
	}
}
