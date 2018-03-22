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
                            <li><a>欢迎 ${username}</a></li>                       
							<li><a href="javascript:add()"><span class="glyphicon glyphicon-plus">&nbsp;发布</span></a></li>
							<li><a href="javascript:logout()">退出</a></li>
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

			<input type="hidden" id="sellerId" value="${id }">
            <div id="contents" class="row">
                
            </div>
    </div>
    </div>
	
	<!-- 退出模态框 -->
	<div id="logoutModal" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" >
						退出
					</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="logoutSubmit()">确认</button>
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
						    <img alt="" src="" id="pics" width="350" height="300" />
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
	
	<!-- 编辑商品展示模态框 -->
	<div id="editModal" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
					<form id="editGoodsContent">
						  <input type="hidden" id="goodsId">
						  <div class="form-group">
						    <img alt="" src="" id="picture" width="350" height="300" />
						  </div>
						  <div class="form-group">
						  	<div class="btn-group" data-toggle="buttons">
								  <label class="btn btn-primary active">
								    <input type="radio" name="pic" id="pic1" value="1" checked> 上传
								  </label>
								  <label class="btn btn-primary">
								    <input type="radio" name="pic" id="pic2" value="2" > 网络地址
								  </label>
							</div>
						  </div>
						  <div class="form-group" id="p1" >
						    <label for="exampleInputFile">文件上传</label>
    						<input type="file" id="picsrc1" name="picsrc1" onchange="uploadpic(this)">
						  </div> 
						  <div class="form-group" id="p2" style="display:none">
						    <label for="exampleInputFile">图片地址</label>
    						<input type="text" id="picsrc2">
						  </div>
						  <div class="form-group">
						    <label for="title">标题</label>
						    <input type="text" class="form-control" id="title" >
						  </div> 
						  <div class="form-group">
						    <label for="summary">摘要</label>
						    <input type="text" class="form-control" id="summary" >
						  </div> 
						  <div class="form-group">
						    <label for="content">正文</label>
						    <input type="text" class="form-control" id="content">
						  </div> 
						  <div class="form-group">
						    <label for="price">价格</label>
						    <input type="text" class="form-control" id="price" >
						  </div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="editSubmit()">提交</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
	<!-- 发布商品模态框 -->
	<div id="addModal" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" >
						发布商品
					</h4>
				</div>
				<div class="modal-body">
					<form id="addGoodsContent">
						   <input type="hidden" id="add_goodsId">
						   <div class="form-group">
						  	<div class="btn-group" data-toggle="buttons">
								  <label class="btn btn-primary active">
								    <input type="radio" name="add_pic" id="add_pic1" value="1" checked> 上传
								  </label>
								  <label class="btn btn-primary">
								    <input type="radio" name="add_pic" id="add_pic2" value="2" > 网络地址
								  </label>
							</div>
						  </div>
						  <div class="form-group" id="add_p1" >
						    <label for="exampleInputFile">文件上传</label>
    						<input type="file" id="add_picsrc1" name="add_picsrc1" onchange="uploadpic2(this)">
						  </div> 
						  <div class="form-group" id="add_p2" style="display:none">
						    <label for="exampleInputFile">图片地址</label>
    						<input type="text" id="add_picsrc2">
						  </div>
						  <div class="form-group">
						    <label for="add_title">标题</label>
						    <input type="text" class="form-control" id="add_title" >
						  </div> 
						  <div class="form-group">
						    <label for="add_summary">摘要</label>
						    <input type="text" class="form-control" id="add_summary" >
						  </div> 
						  <div class="form-group">
						    <label for="add_content">正文</label>
						    <input type="text" class="form-control" id="add_content">
						  </div> 
						  <div class="form-group">
						    <label for="add_price">价格</label>
						    <input type="text" class="form-control" id="add_price" >
						  </div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="addSubmit()">发布</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
    <script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/ajaxfileupload.js"></script>
	<script type="text/javascript">
		
		function logout(){
			$('#logoutModal').modal('show');
		}
	
		function logoutSubmit(){
			$.ajax({
		  			url:'${pageContext.request.contextPath}/main/logout',		  			
				    type: 'POST',
				    dataType:"json",
			        async:false,
			        success:function(result){
			        	window.location.href = "${pageContext.request.contextPath}/main/index";			        	
			        },
			        error:function(XHR, status, errorThrow){
			        	alert("系统错误，请联系管理员!");
			        }
				});
			
			
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
		        		$("#pics").attr("src","${pageContext.request.contextPath}/main/photo?picsrc="+data.picsrc);
		        	}else{
		        		$("#pics").attr("src",data.picsrc);
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
		
		function edit(goodsId){
			$.ajax({
	  			url:'${pageContext.request.contextPath}/main/goodsDetail',
	  			data: {"id":goodsId},
			    type: 'POST',
			    dataType:"json",
		        async:false,
		        success:function(data){
		        	if(data.pic==1){
		        		$("#picture").attr("src","${pageContext.request.contextPath}/main/photo?picsrc="+data.picsrc);
		        	}else{
		        		$("#picture").attr("src",data.picsrc);
		        	}
		        	$("#goodsId").val(data.id);
		        	$("#title").val(data.title);
		        	$("#summary").val(data.summary);
		        	$("#content").val(data.content);
		        	$("#price").val(data.price);
		        	$('#editModal').modal('show');
		        },
		        error:function(XHR, status, errorThrow){
		        	alert("系统错误，请联系管理员!");
		        }
			});
		}
		
		function uploadpic(a){
			var file = a.value;
			 if(!/.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(file)){
			  alert("图片类型必须是.gif,jpeg,jpg,png中的一种");
			  return ;
			}
			$.ajaxFileUpload({
	  			url:'${pageContext.request.contextPath}/seller/uploadpic',
	  			data:{"id":$("#goodsId").val()},
	  			fileElementId : 'picsrc1',
	  			type : "POST",
	  			dataType : "JSON",
				async : true,
				cache : false,
		        success:function(data){
		        	data = data.substring(data.indexOf('>') + 1,data.length);
					data = data.substring(0, data.indexOf('<'));
					var json = JSON.parse(data);
					//alert(json.headPortrait);
					//alert(json.success);
					if (json.success == "true") {
						alert("上传成功！"); 
					} else {
						alert("上传失败！");
					}
		        },
		        error:function(XHR, status, errorThrow){
		        	alert("系统错误，请联系管理员!");
		        }
			});
		}
		
		function editSubmit(){
			var pic=parseInt($("input[name='pic']:checked").val());				
			var params={};
			params.id=parseInt($("#goodsId").val());
			if(pic==2){
				params.pic=pic;
				params.picsrc=$('#picsrc2').val();
			}
			params.title=$('#title').val();
			params.summary=$('#summary').val();
			params.content=$('#content').val();
			params.price=parseInt($('#price').val());
			$.ajax({
	  			url:'${pageContext.request.contextPath}/seller/updateGoods',
	  			data: params,
			    type: 'POST',
			    dataType:"json",
		        async:false,
		        success:function(data){		        	
		        	window.location.href = "${pageContext.request.contextPath}/seller/index";	
		        },
		        error:function(XHR, status, errorThrow){
		        	alert("系统错误，请联系管理员!");
		        }
			}); 
		}
		
		function del(goodsId){
			 $.ajax({
	  			url:'${pageContext.request.contextPath}/seller/delGoods',
	  			data: {"id":goodsId},
			    type: 'POST',
			    dataType:"json",
		        async:false,
		        success:function(data){
		        	alert("删除成功！");
		        	window.location.href = "${pageContext.request.contextPath}/seller/index";	
		        },
		        error:function(XHR, status, errorThrow){
		        	alert("系统错误，请联系管理员!");
		        }
			}); 
		}
		
		function add(){
			$('#addModal').modal("show");
		}
		
		function uploadpic2(a){
			var file = a.value;
			 if(!/.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(file)){
			  alert("图片类型必须是.gif,jpeg,jpg,png中的一种");
			  return ;
			}
			$.ajaxFileUpload({
	  			url:'${pageContext.request.contextPath}/seller/addnewpic',
	  			fileElementId : 'add_picsrc1',
	  			type : "POST",
	  			dataType : "JSON",
				async : true,
				cache : false,
		        success:function(data){
		        	data = data.substring(data.indexOf('>') + 1,data.length);
					data = data.substring(0, data.indexOf('<'));
					var json = JSON.parse(data);
					//alert(json.headPortrait);
					//alert(json.success);
					if (json.success == "true") {
						$('#add_goodsId').val(json.id);
						alert("上传成功！"); 
					} else {
						alert("上传失败！");
					}
		        },
		        error:function(XHR, status, errorThrow){
		        	alert("系统错误，请联系管理员!");
		        }
			});
		}
		
		function addSubmit(){
			var pic=parseInt($("input[name='add_pic']:checked").val());
			var params={};
			params.id=parseInt($("#add_goodsId").val());
			params.title=$('#add_title').val();
			params.summary=$('#add_summary').val();
			params.content=$('#add_content').val();
			params.price=parseInt($('#add_price').val());
			params.sellerId=parseInt($('#sellerId').val());
			if(pic==2){
				params.pic=pic;
				params.picsrc=$('#add_picsrc2').val();
				$.ajax({
		  			url:'${pageContext.request.contextPath}/seller/insertGoods',
		  			data: params,
				    type: 'POST',
				    dataType:"json",
			        async:false,
			        success:function(data){	
			        	alert("发布成功!");
			        	window.location.href = "${pageContext.request.contextPath}/seller/index";	
			        },
			        error:function(XHR, status, errorThrow){
			        	alert("系统错误，请联系管理员!");
			        }
				}); 
			}else{
				$.ajax({
		  			url:'${pageContext.request.contextPath}/seller/updateGoods',
		  			data: params,
				    type: 'POST',
				    dataType:"json",
			        async:false,
			        success:function(data){		 
			        	alert("发布成功!");
			        	window.location.href = "${pageContext.request.contextPath}/seller/index";	
			        },
			        error:function(XHR, status, errorThrow){
			        	alert("系统错误，请联系管理员!");
			        }
				}); 
			}
			
			
		}
		
		$(function () {
			var sellerId=$('#sellerId').val();
			$.ajax({
	  			url:'${pageContext.request.contextPath}/seller/findGoodsBySellerId',
	  			data:{"sellerId":sellerId},
			    type: 'GET',
			    dataType:"json",
		        async:false,
		        success:function(data){
		        	for(var i=0;i<data.length;i++){
		        		var goods=data[i]
		        		var a='<div class="col-md-3 col-sm-3 col-xs-6">'	                    
                        +'<div class="dashboard-div-wrapper bk-clr-one">';
                        var pic=goods.pic;
                        if(pic==1){
                        	a+='<img src="${pageContext.request.contextPath}/main/photo?picsrc='+goods.picsrc+'" width="200" height="150"  onclick="view('+goods.id+')" />';
                        }else{
                        	a+='<img src="'+goods.picsrc+'" width="200" height="150" onclick="view('+goods.id+')" />';
                        }
                        a+='<br />';
                        a+='标题:<span>'+goods.title+'</span><br />';   
                        a+='价格:<span>'+goods.price+'</span><br />'; 
                        a+='已售数量:<span>'+goods.selledNum+'</span><br />';
                        a+='<button type="button" class="btn btn-success" onclick="edit('+goods.id+')"><span class="glyphicon glyphicon-edit"></span>编辑</button>';
                        if(goods.selledNum==0){
                        	a+='<button type="button" class="btn btn-warning" onclick="del('+goods.id+')"><span class="glyphicon glyphicon-remove"></span>删除</button>';
                        }
                        a+='</div></div>';
                        $('#contents').append(a);
		        	}
		        	
		        },
		        error:function(XHR, status, errorThrow){
		        	alert("系统错误，请联系管理员!");
		        }
			});
			
			$('input[type=radio][name=pic]').change(function() {
		        if (this.value == '1') {
		        	 $('#p1').attr("style","display:block;");
		        	 $('#p2').attr("style","display:none;");
		        }
		        else if (this.value == '2') {
		        	 $('#p1').attr("style","display:none;");
		        	 $('#p2').attr("style","display:block;");
		        }
		    });
			
			$('input[type=radio][name=add_pic]').change(function() {
		        if (this.value == '1') {
		        	 $('#add_p1').attr("style","display:block;");
		        	 $('#add_p2').attr("style","display:none;");
		        }
		        else if (this.value == '2') {
		        	 $('#add_p1').attr("style","display:none;");
		        	 $('#add_p2').attr("style","display:block;");
		        }
		    });
			
			
			$('#addModal').on('hidden.bs.modal', function () {
				  $('#add_picsrc2').val(" ");
				  $('#add_title').val(" ");
				  $('#add_summary').val(" ");
				  $('#add_content').val(" ");
				  $('#add_price').val(" ");
			});
			
		});
	
	</script>
</body>
</html>