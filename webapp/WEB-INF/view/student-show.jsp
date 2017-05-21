<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix='fmt' %>  

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
<title>用户查看</title>
</head>
<body>
<div class="cl pd-20" style=" background-color:#5bacb6">
	<img class="avatar size-XL l" src="static/h-ui/images/ucnter/avatar-default.jpg">
	<dl style="margin-left:80px; color:#fff">
		<dt>
			<span class="f-18">${s.name}</span>
<!-- 			<span class="pl-10 f-12">余额：40</span> -->
		</dt>
		<dd class="pt-10 f-12" style="margin-left:0">这家伙很懒，什么也没有留下</dd>
	</dl>
</div>
<div class="pd-20">
	<table class="table">
		<tbody>
			<tr>
				<th class="text-r">出生日期：</th>
				<td><fmt:formatDate value="${s.birthday}" pattern="yyyy年MM月dd日"/></td>
			</tr>
			<tr>
				<th class="text-r" width="80">性别：</th>
				<td><c:if test="${s.gender==1}"> 男 </c:if> <c:if test="${s.gender==2}"> 女 </c:if></td>
			</tr>
			<tr>
				<th class="text-r">手机：</th>
				<td>${s.telephone}</td>
			</tr>
			<tr>
				<th class="text-r">邮箱：</th>
				<td>${s.email}</td>
			</tr>
			<tr>
				<th class="text-r">地址：</th>
				<td>${s.address}</td>
			</tr>
			<tr>
				<th class="text-r">民族：</th>
				<td>${s.nation}</td>
			</tr>
			<tr>
				<th class="text-r">学历：</th>
				<td><c:if test="${s.education==1}">本科</c:if><c:if test="${s.education==2}">研究生</c:if></td>
			</tr>
			<tr>
				<th class="text-r">参保状态：</th>
				<td><c:if test="${s.insuredstate==1}"><span class="label label-success radius">已参保</span></c:if><c:if test="${s.insuredstate==2}"><span class="label label-danger radius">未参保</span></c:if></td>
			</tr>
			<tr>
				<th class="text-r">学员状态：</th>
				<td><c:if test="${s.state==1}"><span class="label label-success radius">已启用</span></c:if><c:if test="${s.state==2}"><span class="label label-danger radius">未启用</span></c:if></td>
			</tr>
		</tbody>
	</table>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
</body>
</html>