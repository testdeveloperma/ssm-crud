package com.mcj.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.mcj.crud.bean.Employee;
import com.mcj.crud.bean.EmployeeExample;
import com.mcj.crud.bean.EmployeeExample.Criteria;
import com.mcj.crud.dao.EmployeeMapper;

@Service
public class EmployeeService {

	@Autowired
	EmployeeMapper employeeMapper;
	
	public List<Employee> getAll(){		
	
		List<Employee> emps = employeeMapper.selectByExampleWithDept(null);
		
		return emps;
		
	}

	public void save(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.insertSelective(employee);
	}

	public boolean checkUser(String name) {
		// TODO Auto-generated method stub
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(name);
		
		long l = employeeMapper.countByExample(example);
		return l==0;
	}

	public Employee getEmp(Integer id) {
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		return employee;
	}

	public void updateEmp(Employee employee) {
		employeeMapper.updateByPrimaryKeySelective(employee);
		
	}

	public void deleteEmp(Integer id) {
		
		employeeMapper.deleteByPrimaryKey(id);
	}

	public void deleteEmpByBatch(List<Integer> idList) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdIn(idList);
		
		employeeMapper.deleteByExample(example);
		
	}
	
}
