<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="mvcproject.java11.crm.urls.UrlsController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container-fluid">
	<div class="row bg-title">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
			<h4 class="page-title">Danh sách công việc</h4>
		</div>
		<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12 text-right">
			<a href="<%=request.getContextPath() + UrlsController.URL_TASK_ADD%>"
				class="btn btn-sm btn-success">Thêm mới</a>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /row -->
	<div class="row">
		<div class="col-sm-12">
			<div class="white-box">
				<div class="table-responsive">
					<div class="col-md-6">

						<form method="get"
							action="<%=request.getContextPath() + UrlsController.URL_TASK_VIEW%>">
							<input type="hidden" name="current_page" id="current_page"
								value="1"> <input type="submit" value="hien thi">
							<select name="record_on_page" id="record_on_page"
								aria-controls="example" >
								<option value="10">10</option>
								<option value="25">25</option>
								<option value="50">50</option>
								<option value="100">100</option>
							</select> 
							<input type="hidden" name="keyword_search" id="keyword_search"
								value="${keyword_search}">
						</form>

					</div>
					<div class="col-md-6 text-right">

						<form class="form-inline" method="get">
							<input type="hidden" name="current_page" id="current_page"
								value="1"> <input type="hidden"
								name="record_on_page" id="record_on_page"
								value="10"> <input type="text"
								name="keyword_search" aria-controls="editable-sample" required>

						</form>

					</div>

					<table class="table" id="example">
						<thead>
							<tr>
								<th>STT</th>
								<th>Tên Công Việc</th>
								<th>Dự Án</th>
								<th>Người Thực Hiện</th>
								<th>Ngày Bắt Đầu</th>
								<th>Ngày Kết Thúc</th>
								<th>Trạng Thái</th>
								<th>Hành Động</th>
							</tr>
						</thead>
						<tbody>
							<tr class="">
								<c:forEach var="task" items="${viewTasks}" varStatus="loop">
									<tr>
										<th scope="row">${loop.index + 1}</th>
										<td>${task.name}</td>
										<td>${task.project_name}</td>
										<td>${task.account_name}</td>
										<td>${task.start_date}</td>
										<td>${task.end_date}</td>
										<td>${task.status_name}</td>
										<td><a
											href="<%= request.getContextPath() + UrlsController.URL_TASK_EDIT %>?id=${task.id}"
											class="btn btn-sm btn-primary ">Sửa</a> <a
											href="<%= request.getContextPath() + UrlsController.URL_TASK_DELETE %>?id=${task.id}"
											class="btn btn-sm btn-danger">Xóa</a></td>
									</tr>
								</c:forEach>
							</tr>
						</tbody>
					</table>

					<nav aria-label="Page navigation example" align="right">
						<ul class="pagination">
							<c:if test="${current_page != 1}">
								<li class="next active"><a
									href="<%=request.getContextPath() +  UrlsController.URL_TASK_VIEW %>?current_page=${current_page - 1 }&record_on_page=${record_on_page}&keyword_search=${keyword_search}">←
										Prev</a></li>
							</c:if>
							<c:forEach var="i" begin="${current_page - 1 == 0 ? 1: current_page-1}"
								end="${current_page + 1 >= totalPage ? totalPage : current_page + 1}">
								<c:choose>
									<c:when test="${current_page == i}">
										<li class="page-item active"><a
											href="<%=request.getContextPath() +  UrlsController.URL_TASK_VIEW %>?current_page=${i}&record_on_page=${record_on_page}&keyword_search=${keyword_search}">${i}</a></li>
									</c:when>

									<c:otherwise>
										<li class="page-item"><a
											href="<%=request.getContextPath() +  UrlsController.URL_TASK_VIEW %>?current_page=${i}&record_on_page=${record_on_page}&keyword_search=${keyword_search}">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${current_page != totalPage}">
								<li class="next active"><a
									href="<%=request.getContextPath() +  UrlsController.URL_TASK_VIEW %>?current_page=${current_page + 1 }&record_on_page=${record_on_page}&keyword_search=${keyword_search}">Next
										→ </a></li>
							</c:if>
						</ul>
					</nav>

				</div>
			</div>
		</div>
	</div>
	<!-- /.row -->
</div>