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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/main.css">
<title>API - Categories</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<a href="/categories">Categories</a>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<h1>${category.nombre}</h1>
			</div>
		</div>

		<div class="row">
			<div class="row">
				<div class="col">
					<div class="col form-label">
						<h3>Products:</h3>
						<ul>
							<c:forEach items="${category.productos}" var="c">
								<li>${c.nombre}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="col">
					<form:form action="/categories/${category.id}/edit"
						modelAttribute="addProduct" method="PUT">
						<div class="row">

							<div class="col-md-auto">
								<label class="form-label align-middle">Add Product: </label>
							</div>
							<div class="col">
								<form:select style="width:50%;margin-left:-15px;"
									class="form-select" path="id">
									<form:option value="${null}">-Select Product-</form:option>
									<c:forEach items="${freeProductos}" var="c">
										<form:option value="${c.id}">${c.nombre}</form:option>
									</c:forEach>
								</form:select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-auto">
								<form:button class="btn btn-primary">Add</form:button>
							</div>
						</div>
				</div>
			</div>
			</form:form>
		</div>
	</div>
</body>
</html>