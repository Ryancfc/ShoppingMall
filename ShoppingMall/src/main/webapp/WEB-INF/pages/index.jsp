<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>首页</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="${pageContext.request.contextPath}/resources/css/assets-bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME ICONS  -->
    <link href="${pageContext.request.contextPath}/resources/css/assets-font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="${pageContext.request.contextPath}/resources/css/assets-style.css" rel="stylesheet" />
    
    
     <!-- HTML5 Shiv and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <section class="menu-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li><a href="javascript:login()">请登录</a></li>                       

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- MENU SECTION END-->
    <div class="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="page-head-line">首页</h4>
                </div>
            </div>


            <div id="contents" class="row">                 

            </div>
    </div>
    </div>
	
	<!-- 登录模态框 -->
	<div id="loginModal" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" >
						登录
					</h4>
				</div>
				<div class="modal-body">
					<form id="loginForm">
						  <div class="form-group">
						    <label for="username">用户名</label>
						    <input type="text" class="form-control" id="username" placeholder="用户名">
						  </div>
						  <div class="form-group">
						    <label for="password">Password</label>
						    <input type="password" class="form-control" id="password" placeholder="密码">
						  </div> 
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="loginSubmit()">登录</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
	<!-- 商品展示模态框 -->
	<div id="goodsModal" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" >
						商品信息
					</h4>
				</div>
				<div class="modal-body">
					<form id="goodsContent">
						  <div class="form-group">
						    <img alt="" src="" id="pic" width="350" height="300" />
						  </div>
						  <div class="form-group">
						    <label for="bt">标题</label>
						    <input type="text" class="form-control" id="bt" readonly>
						  </div> 
						  <div class="form-group">
						    <label for="zy">摘要</label>
						    <input type="text" class="form-control" id="zy" readonly>
						  </div> 
						  <div class="form-group">
						    <label for="zw">正文</label>
						    <input type="text" class="form-control" id="zw" readonly>
						  </div> 
						  <div class="form-group">
						    <label for="jg">价格</label>
						    <input type="text" class="form-control" id="jg" readonly>
						  </div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/md5.js"></script>
    <script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	
	<script type="text/javascript">
		
		function login(){
			$('#loginModal').modal('show');
		}
	
		function loginSubmit(){
			var username=$("#username").val();
			var password=$("#password").val();
			if(username=="" || password==""){
				alert("请输入用户名或者密码!");
				return ;
			}else{
				$.ajax({
		  			url:'${pageContext.request.contextPath}/main/login',
		  			data: {"username":username,"password":hex_md5(password)},
				    type: 'POST',
				    dataType:"json",
			        async:false,
			        success:function(result){
			        	if(parseInt(result)==1){
			        		window.location.href = "${pageContext.request.contextPath}/main/user";
			        	}else{
			        		alert("您输入的用户名或密码错误，请重新输入！");
			        	}
			        },
			        error:function(XHR, status, errorThrow){
			        	alert("系统错误，请联系管理员!");
			        }
				});
			}
			
		}
		
		function view(goodsId){
			$.ajax({
	  			url:'${pageContext.request.contextPath}/main/goodsDetail',
	  			data: {"id":goodsId},
			    type: 'POST',
			    dataType:"json",
		        async:false,
		        success:function(data){
		        	if(data.pic==1){
		        		$("#pic").attr("src","${pageContext.request.contextPath}/main/photo?picsrc="+data.picsrc);
		        	}else{
		        		$("#pic").attr("src",data.picsrc);
		        	}		        	
		        	$("#bt").val(data.title);
		        	$("#jg").val(data.price);
		        	$("#zy").val(data.summary);
		        	$("#zw").val(data.content);
		        	$('#goodsModal').modal('show');
		        },
		        error:function(XHR, status, errorThrow){
		        	alert("系统错误，请联系管理员!");
		        }
			});
		}
		
		$(function () {
			$.ajax({
	  			url:'${pageContext.request.contextPath}/main/findGoods',
			    type: 'GET',
			    dataType:"json",
		        async:false,
		        success:function(data){
		        	for(var i=0;i<data.length;i++){
		        		var goods=data[i]
		        		var a='<div class="col-md-3 col-sm-3 col-xs-6" onclick="view('+goods.id+')">'	                    
                        +'<div class="dashboard-div-wrapper bk-clr-one">';
                        var pic=goods.pic;
                        if(pic==1){
                        	a+='<img src="${pageContext.request.contextPath}/main/photo?picsrc='+goods.picsrc+'" width="200" height="150" />';
                        }else{
                        	a+='<img src="'+goods.picsrc+'" width="200" height="150" />';
                        }
                        a+='<br />';
                        a+='标题:<span>'+goods.title+'</span><br />';   
                        a+='价格:<span>'+goods.price+'</span>';
                        a+='</div></div>';
                        $('#contents').append(a);
		        	}
		        	
		        },
		        error:function(XHR, status, errorThrow){
		        	alert("系统错误，请联系管理员!");
		        }
			});
			
			
		});
	
	</script>
</body>
</html>