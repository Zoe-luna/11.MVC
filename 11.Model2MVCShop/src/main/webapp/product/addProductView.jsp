<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>상품등록</title>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 30px;
        }
    </style>

	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	
	<script type="text/javascript">
	
	   function fncAddProduct(){
	      //Form 유효성 검증
	       /*
	       var name = document.detailForm.prodName.value;
	      var detail = document.detailForm.prodDetail.value;
	      var manuDate = document.detailForm.manuDate.value;
	      var price = document.detailForm.price.value;
	      */
	      
	      var name = $('input[name="prodName"]').val();
	      var detail = $('input[name="prodDetail"]').val();
	      var manuDate = $('input[name="manuDate"]').val();
	      var price = $('input[name="price"]').val();
	   
	      if(name == null || name.length<1){
	         alert("상품명은 반드시 입력하여야 합니다.");
	         return;
	      }
	      if(detail == null || detail.length<1){
	         alert("상품상세정보는 반드시 입력하여야 합니다.");
	         return;
	      }
	      if(manuDate == null || manuDate.length<1){
	         alert("제조일자는 반드시 입력하셔야 합니다.");
	         return;
	      }
	      if(price == null || price.length<1){
	         alert("가격은 반드시 입력하셔야 합니다.");
	         return;
	      }
	   
	      $('form').attr("method", "POST").attr("action", "/product/addProduct").submit();
	   }
	   
	   $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddProduct();
			});
		});
	   
	   
	   $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
	   
	   
	   $( function() {
		
		   $('#manuDate').datepicker( { dateFormat : "yy/mm/dd" } );
		   
	   })
	   
	
	</script>
	</head>
	
	<body>
	
	<div class="navbar  navbar-default">
        <div class="container">
        	<jsp:include page="/layout/toolbar.jsp" />
   		</div>
   	</div>
   	
   	<div class="container">
	
		<h1 class="bg-primary text-center">상 품 등 록</h1>
	
	<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상 품 명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품명을 입력해주세요.">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="상품상세정보를 입력해주세요.">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="category" class="col-sm-offset-1 col-sm-3 control-label">상품 종류</label>
		    <div class="col-sm-4">
		      <select 	name="category"	class="form-control" >
				<option value="1" selected="selected">식음료품</option>
				<option value="2">가전제품</option>
				<option value="3">취미생활</option>
				<option value="4">운동기구</option>
			</select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="manuDate" name="manuDate" placeholder=">> 클릭 <<"/>
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가 격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" placeholder="가격을 입력해주세요.">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">이미지 파일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="fileName" name="fileName" placeholder="이미지 파일경로를 올려주세요" readonly/>
		    </div>
		  </div>
	
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" name="add">등 &nbsp;록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
	
	</form>
	</div>
	
</body>
</html>