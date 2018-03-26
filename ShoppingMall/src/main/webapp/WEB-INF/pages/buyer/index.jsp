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
                            <li><a href="javascript:pay()"><span class="glyphicon glyphicon-shopping-cart">&nbsp;购物车</span></a></li>                       
							<li><a href="javascript:buyedGoods()"><span class="glyphicon glyphicon-th-list">&nbsp;财务</span></a></li>
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
            <div class="row">
                <div  class="col-md-12 ">
                    <input type="hidden" id="buyerId" value="${id }">
					<input type="checkbox" id="isBuyed" value="1" >未购买的商品
                </div>
            </div>
			<br />			
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
						  <input type="hidden" id="goodsId" >
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
					<button type="button" id="buy_btn" class="btn btn-primary" onclick="buy()">购买</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	

	<!-- 购买商品模态框 -->
	<div id="buyModal" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" >
						购买商品
					</h4>
				</div>
				<div class="modal-body">
					<form id="buyGoodsContent">
						  <div class="form-group">
						    <label for="amount">请输入购买数量</label>
						    <input type="text" class="form-control" id="amount" placeholder="1">
						  </div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="buy_btn" class="btn btn-primary" onclick="buySumbit()">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
	
	<!-- 结算商品模态框 -->
	<div id="payModal" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" >
						结算
					</h4>
				</div>
				<div class="modal-body">
					<table id="payGoods" class="table">
					    <thead>
					    	<tr>
					    		<td >标题</td>
					    		<td >价格</td>
					    		<td >数量</td>
					    		<td >金额</td>					    					
					    	</tr>
					    </thead>
					</table> 	
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="paySumbit()">结算</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">退出</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
	<!-- 财务模态框 -->
	<div id="buyedGoodsModal" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" >
						财务
					</h4>
				</div>
				<div class="modal-body">
					<table id="buyedGoods" class="table">
					    <thead>
					    	<tr>
					    		<td >标题</td>
					    		<td >图片</td>
					    		<td >价格</td>
					    		<td >数量</td>
					    		<td >金额</td>
					    		<td >时间</td>					    					
					    	</tr>
					    </thead>
					</table> 	
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">退出</button>
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
		
		function view(goodsId,isBuyed,buyedPrice){
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
		        	$("#goodsId").val(goodsId);
		        	$("#bt").val(data.title);
		        	$("#zy").val(data.summary);
		        	$("#zw").val(data.content);
		        	$("#jg").val(data.price);
		        	if(isBuyed==1){
		        		$("#jg").val(buyedPrice);
		        		$('#buy_btn').attr('disabled',"true");
		        	}		        	
		        	$('#goodsModal').modal('show');
		        },
		        error:function(XHR, status, errorThrow){
		        	alert("系统错误，请联系管理员!");
		        }
			});
		}
		
		function buy(){
			$("#buyModal").modal("show");
		}
		
		function buySumbit(){
			var goodsId=$('#goodsId').val();
			var price=parseInt($("#jg").val());
			var amount=$('#amount').val();
			var re = /^\+?[1-9][0-9]*$/ ;
			if(!re.test(amount)){
				alert("请输入正确的购买数量（至少是1）！");
				$('#amount').val(" ");
				return ;
			}
			amount=parseInt(amount);
			var buyerId=$('#buyerId').val();
			$.ajax({
	  			url:'${pageContext.request.contextPath}/buyer/buyGoods',
	  			data: {"goodsId":goodsId,"amount":amount,"price":price,"buyerId":buyerId},
			    type: 'POST',
			    dataType:"json",
		        async:false,
		        success:function(data){
		        	if(data==1){
		        		alert("购买成功！");
		        		$('#amount').val(" ");
		        		window.location.href = "${pageContext.request.contextPath}/buyer/index";	
		        	}else{
		        		$('#amount').val(" ");
			        	alert("购买失败，请重新尝试！");
		        	}
		        },
		        error:function(XHR, status, errorThrow){
		        	alert("系统错误，请联系管理员!");
		        }
			});
		}
		
		function pay(){
			$('#payModal').modal("show");
		}
		
		function paySumbit(){
			var buyerId=$('#buyerId').val();
			$.ajax({
	  			url:'${pageContext.request.contextPath}/buyer/payGoods',
	  			data:{"buyerId":buyerId},
			    type: 'POST',
			    dataType:"json",
		        async:false,
		        success:function(data){
		        	alert("结算成功！");
		        	window.location.href = "${pageContext.request.contextPath}/buyer/index";	
		        },
		        error:function(XHR, status, errorThrow){
		        	alert("系统错误，请联系管理员!");
		        }
			});
		}
		
		function buyedGoods(){
			$('#buyedGoodsModal').modal("show");
		}
		
		function initial(){
			$('#contents').empty();
			var buyerId=$('#buyerId').val();
			var isBuyed=0;
			if( $('#isBuyed').is(':checked'))
				isBuyed=1;
			$.ajax({
	  			url:'${pageContext.request.contextPath}/buyer/findGoodsWithMarked',
	  			data:{"buyerId":buyerId,"isBuyed":isBuyed},
			    type: 'GET',
			    dataType:"json",
		        async:false,
		        success:function(data){
		        	for(var i=0;i<data.length;i++){
		        		var a="";
		        		var goods=data[i]
		        		a='<div class="col-md-3 col-sm-3 col-xs-6"">'	                    
                        +'<div class="dashboard-div-wrapper bk-clr-one">';
                        var pic=goods.pic;
                        if(pic==1){
                        	a+='<img src="${pageContext.request.contextPath}/main/photo?picsrc='+goods.picsrc+'" width="200" height="150"  onclick="view('+goods.id+','+goods.isBuyed+','+goods.buyedPrice+')" />';
                        }else{
                        	a+='<img src="'+goods.picsrc+'" width="200" height="150" onclick="view('+goods.id+','+goods.isBuyed+','+goods.buyedPrice+')" />';
                        }
                        a+='<br />';
                        a+='标题:<span>'+goods.title+'</span><br />';   
                        a+='价格:<span>'+goods.price+'</span><br />';                     
                        a+='</div></div>';
                        $('#contents').append(a);
		        	}
		        	
		        },
		        error:function(XHR, status, errorThrow){
		        	alert("系统错误，请联系管理员!");
		        }
			});
		}
		
		$(function () {
			initial();
			$('#isBuyed').click(function(){
				initial();
			});
			$('#payModal').on('show.bs.modal', function () {
				var buyerId=$('#buyerId').val();
				$.ajax({
		  			url:'${pageContext.request.contextPath}/buyer/findGoodsWithoutPay',
		  			data:{"buyerId":buyerId},
				    type: 'GET',
				    dataType:"json",
			        async:false,
			        success:function(data){
			        	var a="<tbody>";
			        	if(data.length==0){
			        		a+="<tr>";
			        		a+="<td colspan='4'>您尚未选购商品！</td>";
			        		a+="</tr>";
			        	}else{
			        		for(var i=0;i<data.length;i++){
			        			var content=data[i];
			        			a+="<tr>";
			        			a+="<td>"+content.title+"</td>";
			        			a+="<td>"+content.price+"</td>";
			        			a+="<td>"+content.amount+"</td>";
			        			a+="<td>"+content.money+"</td>";
			        			a+="</tr>";
			        		}
			        	}			        	
			        	a+="</tbody>";
			        	$('#payGoods').append(a);
			        },
			        error:function(XHR, status, errorThrow){
			        	alert("系统错误，请联系管理员!");
			        }
				});
			});
			$('#payModal').on('hidden.bs.modal', function () {
		    	$('#payGoods tbody').html('');	    	
		    });
			$('#buyedGoodsModal').on('show.bs.modal', function () {
				var buyerId=$('#buyerId').val();
				$.ajax({
		  			url:'${pageContext.request.contextPath}/buyer/findPayedGoods',
		  			data:{"buyerId":buyerId},
				    type: 'GET',
				    dataType:"json",
			        async:false,
			        success:function(data){
			        	var a="<tbody>";
			        	if(data.length==0){
			        		a+="<tr>";
			        		a+="<td colspan='6'>您尚未购买过商品！</td>";
			        		a+="</tr>";
			        	}else{
			        		var totalMoney=0;
			        		for(var i=0;i<data.length;i++){
			        			var content=data[i];
			        			a+="<tr>";
			        			a+="<td>"+content.title+"</td>";
			        			if(content.pic==1){
			        				a+="<td><img src='${pageContext.request.contextPath}/main/photo?picsrc="+content.picsrc+"'width='100' height='50' /></td>";
			        			}else{
			        				a+="<td><img src='"+content.picsrc+"'width='100' height='50' /></td>";
			        			}
			        			a+="<td>"+content.price+"</td>";
			        			a+="<td>"+content.amount+"</td>";
			        			a+="<td>"+content.money+"</td>";
			        			a+="<td>"+content.time+"</td>";
			        			a+="</tr>";
			        			totalMoney+=content.money;
			        		}
			        		a+="<tr>";
			        		a+="<td>总金额</td>";
			        		a+="<td colspan='4' align='right'>"+totalMoney+"</td>";
			        		a+="<td></td>";
			        		a+="</tr>";
			        	}			        	
			        	a+="</tbody>";
			        	$('#buyedGoods').append(a);
			        },
			        error:function(XHR, status, errorThrow){
			        	alert("系统错误，请联系管理员!");
			        }
				});
			});
			$('#buyedGoodsModal').on('hidden.bs.modal', function () {
		    	$('#buyedGoods tbody').html('');	    	
		    });
		});
	
	</script>
</body>
</html>
