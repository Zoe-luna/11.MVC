
<%@page import="java.net.URLEncoder"%>
<%@page import="org.springframework.ui.Model"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <link href="/css/style.css" rel="stylesheet">  
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  	<script type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		
			function fncGetList(currentPage) {
				$("#currentPage").val(currentPage)
				$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu= ${! empty menu && menu == 'manage' ? 'manage' : 'search'}").submit();
				
		}
		
		$(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			// $( "button.btn.btn-default" ).on("click" , function() {
				//fncGetList(1);
			//});
		 });

		


	</script>

	</head>
	
  <body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<!-- <form name="detailForm" action="/product/listProduct?menu=${menu}" method="post"> -->
	
	<!-- 메뉴 -->
	<!-- <form>
	<input type="hidden" name="menu" value="${menu}" />
	-->
	<div class="container">
	
		<div class="page-header text-default">
		<br/><br/><br/>
		
		<c:if test="${ param.menu == 'manage' }">
					상품 관리
		</c:if>
		<c:if test="${ param.menu == 'search' }">
					상품 목록조회
		</c:if>
					
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">

		    <div class="col-md-6 text-left">
		    			 
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" >
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" style="width:120px;">
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
						<option value="3"  ${ ! empty search.searchCondition && search.searchCondition==3 ? "selected" : "" }>상품분류</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    
				    <input type="text" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : "" }"
					 class="ct_input_g" style="width:200px; height:19px" />
				  
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->

		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th width="100" align="center">No</th>
            <th width="400" align="left" >상품명</th>
            <th width="200" align="left">등록일</th>
            <th width="200" align="left">카테고리</th>
            <th width="200" align="right">가격</th>
          </tr>	
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="left">${ i }</td>
		
		<c:if test="${ menu == 'search'}">
		<td align="left"><a href="/product/getProduct?prodNo=${product.prodNo}&menu=${menu}">${product.prodName}</a></td>
		</c:if> 
		<c:if test="${menu == 'manage'}">
		<td align="left"><a href="/product/updateProduct?prodNo=${product.prodNo}&menu=${menu}">${product.prodName}</a></td>
		</c:if>
	
			  
			  
			  <td align="left">${product.regDate }
			  
			  <td align="left">
				<c:if test="${product.category == '1'}">
					식음료품
				</c:if>
				<c:if test="${product.category == '2'}">
					가전제품
				</c:if>
				<c:if test="${product.category == '3'}">
					취미생활
				</c:if>
				<c:if test="${product.category == '4'}">
					운동기구
				</c:if>
			</td>
			  <td align="right"><fmt:formatNumber value="${product.price }" pattern="#,###" />원</td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
<!--  </form> -->
  
  
</body>
</html>
    