package com.mcj.crud.bean;

import java.util.HashMap;

public class Msg {

	//״̬��  �ɹ� 1 ʧ�� 0
	private int code;
	
	//��������Ϣ
	private String msg;

	private HashMap<String, Object> map = new HashMap<>();

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public HashMap<String, Object> getMap() {
		return map;
	}

	public void setMap(HashMap<String, Object> map) {
		this.map = map;
	}

	public Msg(int code, String msg, HashMap<String, Object> map) {
		super();
		this.code = code;
		this.msg = msg;
		this.map = map;
	}

	public Msg() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public static Msg success(){
		Msg result = new Msg();
		result.setCode(1);
		result.setMsg("����ɹ�");
		
		return result;
		
	}
	
	public static Msg fail(){
		Msg result = new Msg();
		result.setCode(0);
		result.setMsg("����ʧ��");
		
		return result;
		
	}
	
	public Msg add(String key,Object obj){
			
		this.map.put(key, obj);
	
		return this;
		
	}
}
