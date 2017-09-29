<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">

<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 员工修改模态框 -->
	<div class="modal fade" id="emp_update_modal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">Name</label>
							<div class="col-sm-10">
								 <p class="form-control-static" id="name_update_static"></p>
								 <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="email_update_input"
									placeholder="email" name="email"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Gender</label> <label
								class="radio-inline"> <input type="radio" name="gender"
								id="inlineRadio1" value="M" checked="checked"> 男
							</label> <label class="radio-inline"> <input type="radio"
								name="gender" id="inlineRadio2" value="F"> 女
							</label>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">deptName</label>
							<div class="col-sm-4">
								<select class="form-control" name="dId" value="">

								</select>
							</div>

						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 员工添加模态框 -->
	<div class="modal fade" id="emp_add_modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">Name</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="name_input"
									placeholder="name" name="name"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="email_input"
									placeholder="email" name="email"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Gender</label> <label
								class="radio-inline"> <input type="radio" name="gender"
								id="inlineRadio1" value="M" checked="checked"> 男
							</label> <label class="radio-inline"> <input type="radio"
								name="gender" id="inlineRadio2" value="F"> 女
							</label>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">deptName</label>
							<div class="col-sm-4">
								<select class="form-control" name="dId" value="">

								</select>
							</div>

						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container ">
		<div class="row">
			<div class="col-md-6">
				<h2>SSM-CRUD</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-md-offset-8">
				<button type="button" class="btn btn-primary" id="emp_add_modal_btn">新增</button>
				<button type="button" class="btn btn-danger" id="emp_delete_all">删除</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all"/></th>
							<th>#</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>deptName</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6" id="page_info"></div>
			<div class="col-md-6 col-md-offset-4">
				<nav aria-label="Page navigation" id="page_nav"></nav>
			</div>

		</div>
	</div>


	</div>
	<script type="text/javascript">
		$(function() {
			var totalRecord;
			var currentPage;
			
			to_page(1);

		});

		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/empss",
				data : "pn=" + pn,
				type : "get",
				success : function(result) {
					//1、显示员工数据
					build_emps_table(result);
					//解析显示分页信息
					build_page_info(result);
					//解析显示分页导航
					build_page_nav(result);
				}
			})
		};
		function build_emps_table(result) {
			$("#emps_table tbody").empty();
			var emps = result.map.pageInfo.list;

			$.each(emps, function(index, item) {
				/* <button class="btn btn-info btn-sm">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
				编辑
				</button> */
				var checkBtn = $("<td><input type='checkbox' class='check_item'/></td>");
				var idBtn = $("<td></td>").append(item.id);
				var nameBtn = $("<td></td>").append(item.name);
				var genderBtn = $("<td></td>").append(
						item.gender == "M" ? "男" : "女");
				var emailBtn = $("<td></td>").append(item.email);
				var deptNameBtn = $("<td></td>").append(
						item.department.deptName);
				var editBtn = $("<button></button>").addClass(
						"btn btn-info btn-sm edit_btn").append("<span></span>")
						.addClass("glyphicon glyphicon-pencil").append("编辑");
				editBtn.attr("edit-id",item.id);
				var delteBtn = $("<button></button>").addClass(
						"btn btn-danger btn-sm delete_btn").append(
						"<span></span>").addClass("glyphicon glyphicon-trash")
						.append("删除");
				delteBtn.attr("delete-id",item.id);
				var btn = $("<td></td>").append(editBtn).append(delteBtn);
				$("<tr></tr>").append(checkBtn).append(idBtn).append(nameBtn).append(genderBtn)
						.append(emailBtn).append(deptNameBtn).append(btn)
						.appendTo($("#emps_table tbody"));
			})
		};

		//解析显示分页信息
		function build_page_info(result) {
			$("#page_info").empty();
			$("#page_info").append(
					"当前" + result.map.pageInfo.pageNum + "页,总共"
							+ result.map.pageInfo.pages + "页,总共"
							+ result.map.pageInfo.total + "条记录");
			totalRecord = result.map.pageInfo.total;
			currentPage = result.map.pageInfo.pageNum;
		};
		//解析显示分页导航
		function build_page_nav(result) {
			$("#page_nav").empty();
			var ul = $("<li></li>").addClass("pagination");
			var firstPage = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var prePage = $("<li></li>").append(
					$("<a></a>").append("&laquo;").attr("href", "#"));
			if (result.map.pageInfo.hasPreviousPage == false) {
				firstPage.addClass("disabled");
				prePage.addClass("disabled");
			} else {
				firstPage.click(function() {
					to_page(1);
				})
				prePage.click(function() {
					to_page(result.map.pageInfo.pageNum - 1);
				})
			}

			ul.append(firstPage).append(prePage);
			var nextPage = $("<li></li>").append(
					$("<a></a>").append("&raquo;").attr("href", "#"));
			var lastPage = $("<li></li>").append(
					$("<a></a>").append("末页").attr("href", "#"));
			if (result.map.pageInfo.hasNextPage == false) {
				nextPage.addClass("disabled");
				lastPage.addClass("disabled");

			} else {
				nextPage.click(function() {
					to_page(result.map.pageInfo.pageNum + 1);
				})
				lastPage.click(function() {
					to_page(result.map.pageInfo.pages);
				})
			}

			$.each(result.map.pageInfo.navigatepageNums, function(index,
					pageNum) {
				var numLi = $("<li></li>").append(
						$("<a></a>").append(pageNum).attr("href", "#"));
				if (result.map.pageInfo.pageNum == pageNum) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					to_page(pageNum);
				})

				ul.append(numLi);
			})
			ul.append(nextPage).append(lastPage).appendTo($("#page_nav"));

		};

		$("#emp_add_modal_btn").click(function() {

			//alert($("#emp_add_modal form")[0]);
			//清除表单信息

			clear_form("#emp_add_modal form");
			//获取部门信息
			getDepts("#emp_add_modal select");
			$("#emp_add_modal").modal({
				backdrop : "static"
			});
		});
		function clear_form(ele) {
			$(ele)[0].reset();
			$(ele).find("*").removeClass("has-success has-error");
			$(ele).find(".help-block").text("");
		}

		//获取所有部门信息
		function getDepts(ele) {
			$(ele).empty();
			$.ajax({
				url : "${APP_PATH}/depts",
				type : "get",
				success : function(result) {
					//{"code":1,"msg":"处理成功",
					//"map":{"depts":[{"deptId":1,"deptName":"测试部"},{"deptId":2,"deptName":"开发部"}]}}
					$.each(result.map.depts, function() {
						var option = $("<option></option>").append(
								this.deptName).attr("value", this.deptId);
						$(ele).append(option);
					})
				}
			})
		};

		function show_validate_msg(ele, status, msg) {
			//清除输入框样式
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}

		$("#name_input").change(
				function() {
					var nameVal = this.value;
					$.ajax({
						url : "${APP_PATH}/checkuser",
						data : "name=" + nameVal,
						type : "post",
						success : function(result) {
							if (result.code == 1) {
								show_validate_msg("#name_input", "success",
										"用户名验证通过");
								$("#name_input").attr("ajax_vl", "success");
							} else if (result.code == 0) {
								show_validate_msg("#name_input", "error",
										result.map.va_msg);
								$("#name_input").attr("ajax_vl", "error");
							}
						}
					})
				});

		function validate_add_form() {
			//校验姓名格式
			var name = $("#name_input").val();
			regName = /(^[A-Za-z0-9]{5,10}$)|(^[\u4e00-\u9fa5]{3,5}$)/;
			if (!regName.test(name)) {
				//alert("name必须是3-5位中文 或者5-10位英文字母和数字");
				show_validate_msg("#name_input", "error",
						"name必须是3-5位中文 或者5-10位英文字母和数字");
				return false;
			} else {
				show_validate_msg("#name_input", "success", "");

			}

			var email = $("#email_input").val();
			regEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			if (!regEmail.test(email)) {
				//alert("email格式不对")
				show_validate_msg("#email_input", "error", "email格式不对");
				return false;
			} else {
				show_validate_msg("#email_input", "success", "");
			}

			return true;
		}
		$("#emp_save_btn").click(
				function() {
					if (!validate_add_form()) {
						return false;
					}
					if ($("#name_input").attr("ajax_vl") == "error") {
						return false;
					}
					$.ajax({
						url : "${APP_PATH}/emp",
						data : $("#emp_add_modal form").serialize(),
						type : 'post',
						success : function(result) {
							if (result.code == 1) {
								$('#emp_add_modal').modal('hide');
								to_page(9999);
							} else {
								//alert(result.map.errorMsg.name);
								if (undefined != result.map.errorMsg.name) {
									show_validate_msg("#name_input", "error",
											result.map.errorMsg.name)
									alert(result.map.errorMsg.name);
								}
								if (undefined != result.map.errorMsg.email) {
									show_validate_msg("#email_input", "error",
											result.map.errorMsg.email)
								}
							}
						}
					})
				})
		//弹出编辑模态框
		$(document).on("click", ".edit_btn", function() {

			getDepts("#emp_update_modal select");
			var id = $(this).attr("edit-id");
			$("#emp_update_btn").attr("edit-id",id);
			getEmp(id);
			$("#emp_update_modal").modal({
				backdrop : "static"
			});
		})
		function getEmp(id) {
			$.ajax({
				url:"${APP_PATH}/emp/"+id,
				type:"get",
				success:function(result){
					var empdata = result.map.emp;
					$("#name_update_static").text(empdata.name);
					$("#email_update_input").val(empdata.email);
					$("#emp_update_modal input[name=gender]").val([empdata.gender]);
					$("#emp_update_modal select").val([empdata.dId]);
				}
			})
		}
		
		$("#emp_update_btn").click(function(){
			//1、校验表单数据合法性
			var email = $("#email_update_input").val();
			regEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			if (!regEmail.test(email)) {
				//alert("email格式不对")
				show_validate_msg("#email_update_input", "error", "email格式不对");
				return false;
			} else {
				show_validate_msg("#email_update_input", "success", "");
			}
			//2、发送ajax请求，更新数据
			$.ajax({
				url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
				data:$("#emp_update_modal form").serialize(),
				type:"put",
				success:function(result){
					$("#emp_update_modal").modal("hide");
					to_page(currentPage);
				}
			})

		})
		
		$(document).on("click",".delete_btn",function(){
			var name = $(this).parents("tr").find("td:eq(1)").text();
			
			if(confirm("确定要删除【"+ name +"】的信息吗?")){
				$.ajax({
					url:"${APP_PATH}/emp/"+$(this).attr("delete-id"),
					type:"delete",
					success:function(result){
						alert(result.msg);
						to_page(currentPage);
					}
				})
			}
		})
		
		$(document).on("click","#check_all",function(){
			//dom原生的属性操作使用prop方法，attr作用yu自定义的属性
			var flag = $(this).prop("checked");
			if(flag){
				$(".check_item").prop("checked",true);
			}else{
				$(".check_item").prop("checked",false);
			}
		})
		
		$(document).on("click",".check_item",function(){
			// alert($(".check_item:checked").length);
			if($(".check_item:checked").length == $(".check_item").length){
				
				$("#check_all").prop("checked",true);
			}else{
				$("#check_all").prop("checked",false);
			}
		})
		$("#emp_delete_all").click(function(){
			var names = "";
			var ids_str = "";
			$.each($(".check_item:checked"),function(){
				
				names+=$(this).parents("tr").find("td:eq(2)").text() + ",";
				ids_str+=$(this).parents("tr").find("td:eq(1)").text() + "-";
			})
			names = names.substring(0,names.length-1);
			ids_str = ids_str.substring(0,ids_str.length-1);
			if(confirm("确定要删除【"+ names +"】的信息吗")){
				$.ajax({
					url:"${APP_PATH}/emp/"+ids_str,
					type:"delete",
					success:function(result){
						alert(result.msg);
						to_page(currentPage);
					}
				})
			}
			
		})
	</script>

</body>
</html>

