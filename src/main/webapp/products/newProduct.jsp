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
<title>API - Products</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>New Product</h1>
			</div>
		</div>
		<form:form modelAttribute="newProduct" method="POST" action="/products/new">
			<div class="row">
				<div class="col">
					<form:errors path="nombre" />
					<form:errors path="descripcion" />
					<form:errors path="precio" />
				</div>
			</div>
			<div class="row">
				<div class="col">Name:</div>
				<div class="col">
					<form:input type="text" path="nombre" />
				</div>
			</div>
			<div class="row">
				<div class="col">Description:</div>
				<div class="col">
					<form:input type="text" path="descripcion" />
				</div>
			</div>
			<div class="row">
				<div class="col">Precio:</div>
				<div class="col">
					<form:input type="number" path="precio" />
				</div>
			</div>
			<div class="row">
				<div class="col">
					<form:button class="btn btn-primary"> Create</form:button>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>