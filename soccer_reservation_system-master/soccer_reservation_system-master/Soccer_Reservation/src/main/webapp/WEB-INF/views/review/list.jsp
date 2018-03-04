<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Soccer_Reservation</title>
<%@ include file="../include/header_script.jsp" %>
</head>
<body>

<%@ include file="../include/header.jsp" %>

	<div class="container">
	<div class="row">
		<div class="divider col-sm-12 col-xs-12 col-md-12">
			<div class="header-text">
				Review<span>Board</span>
				<div class="container header-start text-center"></div>
			</div>
		</div>
	</div>
</div>
	<!-- ================ Main ============= -->
<div class="container">
	<div class="row">
			<div class=" col-md-12 text-center">
				<div class="panel">
					<div class="panel-body"  style="background-color: #def0f1;">
							<div style="float:left;">							
								<table  id="listtable" class="table table-hover ">
									<thead>
										<tr>
											<th>번호</th>
											<th>작성자</th>
											<th>제목</th>
											<th>조회수</th>
											<th>등록일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="tmp" items="${list}">
											<tr>
												<td>${tmp.num }</td>
												<td>${tmp.writer }</td>
												<td><a href="detail.do?num=${tmp.num }&condition=${condition}&keyword=${keyword}">${tmp.title }</a></td>
												<td>${tmp.viewCount }</td>
												<td>${tmp.regdate }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="pull-right"><a class="btn btn-default btn-md " href="insertform.do"><i class="glyphicon glyphicon-pencil"></i> 새글 작성</a></div>
								<ul class="pagination">
									<c:choose>
										<c:when test="${startPageNum ne 1 }">
											<li>
												<a href="list.do?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${keyword}">&laquo;</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="disabled">
												<a href="javascript:">&laquo;</a>
											</li>
										</c:otherwise>
									</c:choose>
									<c:forEach var="i" begin="${startPageNum }" 
											end="${endPageNum }">	
										<c:choose>
											<c:when test="${i eq pageNum }">
												<li class="active"><a href="list.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="list.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${endPageNum lt totalPageCount }">
											<li>
												<a href="list.do?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${keyword}">&raquo;</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="disabled">
												<a href="javascript:">&raquo;</a>
											</li>
										</c:otherwise>
									</c:choose>
								</ul>
								
								
								<div  class="row" >
									<div class="col-xs-6">
										<!-- 검색어 관련 form -->
										<form  action="list.do" method="post" >
											<input type="hidden" id="condition" value="${condition }" name="condition" />
									        <div class="input-group">
									          <div class="input-group-btn">
									            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									              <span id="conditionBtn">제목+파일명</span>
									              <span class="caret"></span>
									            </button>
									            <ul class="dropdown-menu">
									              <li><a href="javascript:set('titlecontent')">제목+파일명</a>
									              </li>
									              <li><a href="javascript:set('title')">제목</a>
									              </li>
									              <li><a href="javascript:set('writer')">작성자</a>
									              </li>
									            </ul>
									          </div>
									          <!-- /btn-group -->
									          <input  type="text" id="keyword" name="keyword" value="${keyword }" class="form-control"/>
									          	<span class="input-group-btn">
										            <button class="btn btn-default" type="submit">
										              <span class="sr-only">검색</span>
										              <span class="glyphicon glyphicon-search"></span>
										            </button>
							          			</span>
									        </div>			
										</form>
									</div>
								</div>
							</div>
				</div>
			</div>
		</div>
	</div><!-- /.row -->
</div><!-- /.container -->
	<!-- ============FOOTER============= -->
<%@ include file="../include/footer.jsp" %>
  <%@ include file="../include/footer_script.jsp" %>
<script>
	
	set("${condition}");
	
	function set(condition){
		if(condition=="titlecontent" || condition==""){
			condition="titlecontent";
			$("#conditionBtn").text("제목+파일명");
		}else if(condition=="title"){
			$("#conditionBtn").text("제목");
		}else if(condition=="writer"){
			$("#conditionBtn").text("작성자");
		}
		$("#condition").val(condition);
	}
	
	function deleteConfirm(num){
		var result=confirm(num+" 번 파일을 삭제 하시겠습니까?");
		if(result){
			location.href="delete.do?num="+num;
		}
	}
</script>
</body>
</html>











