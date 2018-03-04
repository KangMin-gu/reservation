<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Soccer_Reservation</title>
 <%@ include file="../include/header_script.jsp" %>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/playlist.css" />
</head>
<body>
 <%@ include file="../include/header.jsp" %>

	<div class="container">
		<div class="row">
			<div class="divider col-sm-12 col-xs-12 col-md-12">
				<div class="header-text">
					Ground<span>List</span>
				</div>
					<div class="container header-start text-center">
					<div class="heading-icon" style="width: 17%; margin-top:0px;">
							<img src="https://png.icons8.com/material/96/000000/stadium.png">
						</div>				
					<p class="text-center sub-text">
						<em class="first-line"> 원하는 그라운드를 검색해보세요! </em>
					</p>
				</div>	
			</div>
		</div>
	</div>
	
	
<div style="margin-top: 0px;" class="container">
		<div class="row">
			<div class="col-xs-offset-2 col-xs-10 text-center">
				<div  class="panel">
					<div class="panel-body"  style="background-color: #def0f1;">
						<div class="row">
							<div class="col-xs-12 text-center">
								<table id="listtable"  style="border-width: 3px;" class="table text-center">								
									<c:forEach var="tmp" items="${list}">
										<tbody>
											<colgroup>
												<col class="col-xs-5" />
												<col class="col-xs-2" />
												<col class="col-xs-5" />
											</colgroup>
											<tr>
												<td rowspan="6"><img style="max-width: 100%;" src="${pageContext.request.contextPath}//upload/${tmp.saveFileName }" alt="" /></td>
												<td>운동장 이름 :</td>
												<td>${tmp.field_name }</td>
											</tr>
											<tr>
												<td>주소 :</td>
												<td>${tmp.field_addr }</td>
											</tr>
											<tr>
												<td>오전 타임 :</td>
												<td>${tmp.field_morning }</td>
											</tr>
											<tr>
												<td>오후 타임 :</td>
												<td>${tmp.field_afternoon }</td>
											</tr>
											<tr>
												<td>저녁 타임 :</td>
												<td>${tmp.field_night }</td>
											</tr>
											<tr>
												<td colspan="2">
													<a style="width: 300px;" class="btn btn-primary pull-right" href="${pageContext.request.contextPath}/reser/rv_detail.do?num=${tmp.num}">시간별 예약 조회</a>
													<c:if test="${id eq 'admin' }">
													<a class="btn btn-warning" href="updateform.do?num=${tmp.num }">수정</a>
													<a class="btn btn-danger" href="javascript:deleteConfirm(${tmp.num })">삭제</a>
												</c:if>
												</td>
											</tr>	
									</tbody>															
										</c:forEach>
					
								</table>
								
								<br/>
													
								<div style="float:right;">
									<c:if test="${id eq 'admin' }">
										<a class="btn  btn-default" href="insertform.do">운동장추가</a>
										<a class="btn  btn-default" href="${pageContext.request.contextPath}/admin/adminpage.do">관리자메뉴</a>
									</c:if>
								</div>
								
								
								<div style="float:middle; class="container">
									<ul class="pagination">
										<c:choose>
											<c:when test="${startPageNum ne 1 }">
												<li><a
													href="playlist.do?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${keyword}">&laquo;</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="disabled"><a href="javascript:">&laquo;</a></li>
											</c:otherwise>
										</c:choose>
										<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
											<c:choose>
												<c:when test="${i eq pageNum }">
													<li class="active"><a
														href="playlist.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a></li>
												</c:when>
												<c:otherwise>
													<li><a
														href="playlist.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${endPageNum lt totalPageCount }">
												<li><a
													href="playlist.do?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${keyword}">&raquo;</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="disabled"><a href="javascript:">&raquo;</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
		
									<div class="row">
										<div class="col-xs-6">
											<!-- 검색어 관련 form -->
											<form action="playlist.do" method="post">
												<input type="hidden" id="condition" value="${condition }"
													name="condition" />
												<div class="input-group">
													<div class="input-group-btn">
														<button type="button"
															class="btn btn-defualt dropdown-toggle"
															data-toggle="dropdown" style="margin: 10px;">
															<span id="conditionBtn">검색메뉴</span> <span class="caret"></span>
														</button>
														<ul class="dropdown-menu">
															<li><a href="javascript:set('field_name')">운동장</a></li>
															<li><a href="javascript:set('field_addr')">운동장주소</a></li>
														</ul>
													</div>
													<!-- /btn-group -->
													<input type="text" id="keyword" name="keyword"
														value="${keyword }" class="form-control" /> <span
														class="input-group-btn">
														<button class="btn btn-default" type="submit" style="margin: 10px;">
															<span class="sr-only">검색</span> <span
																class="glyphicon glyphicon-search"></span>
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
				</div>
			</div>
		</div>
	</div>
	
 <%@ include file="../include/footer.jsp" %>
 <%@ include file="../include/footer_script.jsp" %>
	<script>
		set("${condition}");

		function set(condition) {
			console.log("검색검색검색")
			if (condition == "field_name") {
				console.log("신청인검색")
				$("#conditionBtn").text("운동장");
			} else if (condition == "field_addr") {
				console.log("운동장검색")
				$("#conditionBtn").text("운동장주소");
			}

			$("#condition").val(condition);
		}

		function deleteConfirm(num) {
			var result = confirm(num + " 번 파일을 삭제 하시겠습니까?");
			if (result) {
				location.href = "delete.do?num=" + num;
			}
		}
	</script>
</body>
</html>
