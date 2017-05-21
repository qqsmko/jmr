<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE HTML>
<html>

	<jsp:include page="head_.jsp">
		<jsp:param name="title_name" value="展示页面" />
	</jsp:include>

	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理机构 <span class="c-gray en">&gt;</span> 培训机构管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	
	<div class="page-container">

		<div class="cl pd-5 bg-1 bk-gray mt-20"><span class="r">共有数据：<strong>88</strong> 条</span> </div>
		<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr class="text-c">
					<th width="">机构名称</th>
					<th width="">培训计划</th>
					<th width="">实时视频</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${sl}" var="s" varStatus="st">
					<tr class="text-c">
						<td>荆门学校</td>
						<td><u style="cursor:pointer" class="text-primary" onclick="member_show('${s.name}','student-show.html?id=${s.studentid}','10001','360','400')">点击查看</u></td>
						<td><u style="cursor:pointer" class="text-primary" onclick="member_show('${s.name}','student-show.html?id=${s.studentid}','10001','360','400')">点击查看</u></td>
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