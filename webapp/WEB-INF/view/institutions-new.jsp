<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>新增机构</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>申请人邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" maxlength="20" class="input-text" value="" placeholder="" id="applyemail" name="applyemail">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>申请人姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" maxlength="20" class="input-text" value="" placeholder="" id="responsible" name="responsible">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>机构名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" maxlength="20" class="input-text" value="" placeholder="" id="institutionsname" name="institutionsname">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所属区县：</label>
			<div class="formControls col-xs-8 col-sm-9">
			<input type="text" maxlength="20" class="input-text" value="" placeholder="" id="regionid" name="regionid">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>机构地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" maxlength="20" class="input-text" value="" placeholder="" id="address" name="address">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>教职工人数：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="employeecount" name="employeecount">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="article_save_submit();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 提交</button>
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> 
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.config.js"></script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.all.min.js"> </script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$.fn.serializeObject = function()    
	{    
	   var o = {};    
	   var a = this.serializeArray();    
	   $.each(a, function() {    
	       if (o[this.name]) {    
	           if (!o[this.name].push) {    
	               o[this.name] = [o[this.name]];    
	           }    
	           o[this.name].push(this.value || '');    
	       } else {
	       	   if (this.value != ""){    
	           		o[this.name] = this.value || '';    
	       	   }
	       }    
	   });    
	   return o;    
	};

	//表单验证
	$("#form-article-add").validate({
		rules:{
			responsible:{
			},
			regionid:{
				number:true,
			},
			employeecount:{
				number:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
	// 	submitHandler:function(form){
	// 		var options={
	// 	  		type: 'GET',//提交方式  
 //                url:  'institutions-update/submit',
 //                data:{
 //                	institutionsid:${id},
 //                },
 //                contentType:'application/json;charset=UTF-8',
 //                success: function() {
 //                	layer.msg('已修改成功!',{icon: 6,time:1000});
	// 				var index = parent.layer.getFrameIndex(window.name);
	// 				parent.location.replace(parent.location.href)
 //                }   
 //            };
	// 		$(form).ajaxSubmit(options);
	// 	}
	});
	
});

function article_save_submit(){
	var data = $("#form-article-add").serializeObject(); //自动将form表单封装成json 
    alert(JSON.stringify(data));
    $.ajax({
        type: "POST",   //访问WebService使用Post方式请求
        contentType: "application/json", //WebService 会返回Json类型
        url: "institutions-new/submit", //调用WebService的地址和方法名称组合 ---- WsURL/方法名
        data: JSON.stringify(data),         //这里是要传递的参数，格式为 data: "{paraName:paraValue}",下面将会看到      
        dataType: 'json',
       success: function (result) {     //回调函数，result，返回值
            layer.msg('已修改成功!',{icon: 6,time:1000});
			var index = parent.layer.getFrameIndex(window.name);
			parent.location.replace(parent.location.href)
        }
    }); 
}

</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>