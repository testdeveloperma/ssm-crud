package com.mcj.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mcj.crud.bean.Employee;
import com.mcj.crud.bean.Msg;
import com.mcj.crud.service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;

	
	@ResponseBody
	@RequestMapping(value="/emp/{ids_str}",method=RequestMethod.DELETE)
	public Msg deleteEmp(@PathVariable("ids_str")String ids){
		if(ids.contains("-")){
			List<Integer> idList = new ArrayList<>();
			String[] ids_str = ids.split("-");
			for (String id_str : ids_str) {
				idList.add(Integer.parseInt(id_str));
			}
			employeeService.deleteEmpByBatch(idList);
			
		}else{
			
			int id = Integer.parseInt(ids);
			employeeService.deleteEmp(id);
			
		}
		
		 return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping(value="/emp/{id}",method=RequestMethod.PUT)
	public Msg updateEmp(Employee employee){
		System.out.println(employee);
		employeeService.updateEmp(employee);
		return Msg.success();
	}
	
	/**
	 * 根据id查询员工
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	 public Msg getEmp(@PathVariable("id") Integer id){
		 Employee employee = employeeService.getEmp(id);
		 return Msg.success().add("emp", employee);
	 }
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkUser(String name){
		
		String regex= "(^[A-Za-z0-9]{5,10}$)|(^[\u4e00-\u9fa5]{3,5}$)";
		boolean matches = name.matches(regex);
		if(!matches){
			return Msg.fail().add("va_msg", "name必须是3-5位中文 或者5-10位英文字母和数字");
		}
		
		boolean b = employeeService.checkUser(name);
		if(b){
			return Msg.success();
		}else{
			return Msg.fail().add("va_msg", "用户名已存在");
		}
		
	}
	
	
	@RequestMapping(value="/emp",method=RequestMethod.POST)	
	@ResponseBody
	public Msg saveEmp(@Validated Employee employee,BindingResult result){
		if(result.hasErrors()){
			Map<String, String> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名: " + fieldError.getField());
				
				System.out.println("错误信息: " + fieldError.getDefaultMessage());
				
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			
			
			return Msg.fail().add("errorMsg", map);
		}else{
			employeeService.save(employee);
			
			return Msg.success();
		}
		
	}
	
	
	@RequestMapping("/empss")
	@ResponseBody
	public Msg getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 分页查询
		PageHelper.startPage(pn, 5);
		List<Employee> emps = employeeService.getAll();
		PageInfo page = new PageInfo<>(emps);
		return Msg.success().add("pageInfo", page);
	}
	
	@RequestMapping("/emps")
	public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn,Model model) {
		// 分页查询
		PageHelper.startPage(pn, 5);
		List<Employee> emps = employeeService.getAll();
		PageInfo page = new PageInfo<>(emps);
		model.addAttribute("pageInfo", page);
		return "list";
	}

}
