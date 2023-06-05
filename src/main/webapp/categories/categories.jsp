<%@page import="org.springframework.ui.Model"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/boostrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/4f7f009016.js"
	crossorigin="anonymous"></script>
<title>Categories API</title>
</head>
<body>
	<div class="container p-3">
		<div class="row">
			<div class="col">
				<a href="/products">Products</a>
			</div>
			<div class="col">
				<a href="/categories/new">New category</a>
			</div>
			<table class="table border rounded">
				<thead>
					<tr>
						<th>Name</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${categories}" var="p">
						<tr>
							<td>${p.nombre}</td>
							<td>
								<form style="display: inline;" action="/categories/${p.id}"
									method="post">
									<input type="hidden" name="_method" value="delete" />
									<button type="submit" class="btn btn-link">
										<i class="fa-solid fa-trash" style="color: #000000;"></i>
									</button>
								</form> <a class="btn btn-link" href="/categories/${p.id}/edit"> <i
									class="fa-solid fa-folder-plus" style="color: #000000;"></i>
							</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>