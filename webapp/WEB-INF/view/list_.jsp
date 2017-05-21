<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE HTML>
<html>

	<jsp:include page="head_.jsp">
		<jsp:param name="title_name" value="展示页面" />
	</jsp:include>

	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理机构 <span class="c-gray en">&gt;</span> 培训机构管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	
	<div class="page-container">

		<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" data-title="添加机构" data-href="student-add.html" onclick="Hui_admin_tab(this)" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加机构</a></span></span> <!-- <span class="r">共有数据：<strong>88</strong> 条</span> --> </div>
		<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="80">ID</th>
					<th width="100">用户名</th>
					<th width="100">出生日期</th>
					<th width="40">性别</th>
					<th width="90">手机</th>
					<th width="150">邮箱</th>
					<th width="">地址</th>
					<th width="50">民族</th>
					<th width="50">学历</th>
					<th width="50">参保状态</th>
					<th width="50">学员状态</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${sl}" var="s" varStatus="st">
					<tr class="text-c">
						<td><input type="checkbox" value="${s.studentid}" name="items"></td>
						<td>${s.studentid}</td>
						<td><u style="cursor:pointer" class="text-primary" onclick="member_show('${s.name}','student-show.html?id=${s.studentid}','10001','360','400')">${s.name}</u></td>
						<td><fmt:formatDate value="${s.birthday}" pattern="yyyy年MM月dd日"/></td>
						<td> <c:if test="${s.gender==1}"> 男 </c:if> <c:if test="${s.gender==2}"> 女 </c:if> </td>
						<td>${s.telephone}</td>
						<td>${s.email}</td>
						<td class="text-l">${s.address}</td>
						<td>${s.nation}</td>
						<td><c:if test="${s.education==1}">本科</c:if><c:if test="${s.education==2}">研究生</c:if></td>
						<td class=""><c:if test="${s.insuredstate==1}"><span class="label label-success radius">已参保</span></c:if><c:if test="${s.insuredstate==2}"><span class="label label-defaunt radius">未参保</span></c:if></td>
						<td class="td-status"><c:if test="${s.state==1}"><span class="label label-success radius">已启用</span></c:if><c:if test="${s.state==2}"><span class="label label-defaunt radius">未启用</span></c:if></td>
						<td class="td-manage"><c:if test="${s.state==1}"><a style="text-decoration:none" onClick="member_stop(this,${s.studentid})" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a></c:if><c:if test="${s.state==2}"><a style="text-decoration:none" onClick="member_start(this,${s.studentid})" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a></c:if> <a title="编辑" href="javascript:;" onclick="member_edit('编辑','student-update.html?id=${s.studentid}','4','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a><a title="删除" href="javascript:;" onclick="member_del(this,${s.studentid})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>

	<jsp:include page="foot_.jsp" />

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
	<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
	$(function(){
		$('.table-sort').dataTable({
			"aaSorting": [[ 1, "desc" ]],//默认第几个排序
			"bStateSave": true,//状态保存
			"aoColumnDefs": [
			  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
			  //{"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
			]
		});
		
	});
	/*用户-添加*/
	function member_add(title,url,w,h){
		layer_show(title,url,w,h);
	}
	/*用户-查看*/
	function member_show(title,url,id,w,h){
		layer_show(title,url,w,h);
	}
	/*用户-停用*/
	function member_stop(obj,id){
		layer.confirm('确认要停用吗？',function(index){
			$.ajax({
				type: 'POST',
				url: '',
				data:{
					id:id
				},
				dataType: 'json',
				success: function(data){
					$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,${s.studentid})" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
					$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
					$(obj).remove();
					layer.msg('已停用!',{icon: 5,time:1000});
					javascript:location.replace(location.href)
				},
				error:function(data) {
					console.log(data.msg);
				},
			});		
		});
	}

	/*用户-启用*/
	function member_start(obj,id){
		layer.confirm('确认要启用吗？',function(index){
			$.ajax({
				type: 'DELETE',
				url: '',
				data:{
					id:id
				},
				dataType: 'json',
				success: function(data){
					$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,${s.studentid})" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
					$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
					$(obj).remove();
					layer.msg('已启用!',{icon: 6,time:1000});
					javascript:location.replace(location.href)
				},
				error:function(data) {
					console.log(data.msg);
				},
			});
		});
	}
	/*用户-编辑*/
	function member_edit(title,url,id,w,h){
		layer_show(title,url,w,h);
	}
	/*密码-修改*/
	function change_password(title,url,id,w,h){
		layer_show(title,url,w,h);	
	}
	/*用户-删除*/
	function member_del(obj,id){
		var urls = window.location.href;
		urls = urls.substring(0,urls.length-5);
		layer.confirm('确认要删除吗？',function(index){
			$.ajax({
				type: 'POST',
				url: urls+'/delete',
				data:{
					id:id
				},
				dataType: 'json',
				success: function(data){
					$(obj).parents("tr").remove();
					layer.msg('已删除!',{icon:1,time:1000});
				},
				error:function(data) {
					console.log(data.msg);
				},
			});		
		});
	}
	/*用户-批量删除*/
	function datadel(){
		var text="";  
	    $("input[name=items]").each(function() {  
	        if ($(this).is(":checked")) {  
	            text += $(this).val()+",";  
	        }
	    });
	    if(text==""){
	    	alert("请至少选择一项！");
	    	return;
	    }
	    text = text.substring(0,text.length-1);
	    data = text.split(',')
	    var urls = window.location.href;
		urls = urls.substring(0,urls.length-5);
		layer.confirm('确认要删除吗？',function(index){
			$.ajax({
				type: 'POST',
				url: urls+'/deleteall',
				data:{
					ids:data
				},
				dataType: 'json',
				success: function(data){
					layer.msg('已删除!',{icon:1,time:1000});
					location.replace(location.href);
				},
				error:function(data) {
					console.log(data.msg);
				},
			});
		});
	}
	</script> 
	</body>
	</html>