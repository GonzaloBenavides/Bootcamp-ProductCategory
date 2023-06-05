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
<script src="https://kit.fontawesome.com/4f7f009016.js"
	crossorigin="anonymous"></script>
<title>API - Categories</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>New Category</h1>
			</div>
		</div>
		<form:form modelAttribute="newCat" method="POST" action="/categories/new">
			<div class="row">
				<div class="col">
					<form:errors path="nombre" />
				</div>
			</div>
			<div class="row">
			<div class="col">Name:</div>
			<div class="col">
				<form:input type="text" path="nombre" />
			</div>
		</div>
		<div class="row">
			<div class="col">
				<form:button class="btn btn-secondary">Create</form:button>
			</div>
		</div>
		</form:form>
	</div>
</body>
</html>