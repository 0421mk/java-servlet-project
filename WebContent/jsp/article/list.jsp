<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="web.dto.Article"%>
<%
List<Article> articles = (List<Article>) request.getAttribute("articles");
Map<String, Object> loginedMemberRow = (Map<String, Object>) request.getAttribute("memberRow");
int totalPageCnt = (int) request.getAttribute("totalPageCnt");
int nowPage = (int) request.getAttribute("page");
boolean isLogined = (boolean) request.getAttribute("isLogined");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 리스트</title>
</head>
<body>
	<h1>게시물 리스트</h1>
	<div class="header"
		style="margin: 20px auto; border: 1px solid black; display: inline-block;">
		<%
		if (!isLogined) {
		%>
		<div>
			<a href="../member/login">로그인</a> <a href="../member/join">회원가입</a>
		</div>
		<%
		} else {
		%>
		<div>
			<%=(String) loginedMemberRow.get("userName")%>님 환영합니다.
		</div>
		<div>
			<a href="../member/logout">로그아웃</a>
		</div>
		<%
		}
		%>
	</div>
	<table>
		<tr>
			<th>글 번호</th>
			<th>날짜</th>
			<th>제목</th>
			<th>작성자</th>
			<th>비고</th>
		</tr>
		<%
		for (Article article : articles) {
		%>
		<tr>
			<td><%=article.id%>번</td>
			<td><%=article.regDate%></td>
			<td><a href="detail?id=<%=article.id%>"><%=article.title%></a></td>
			<td><%=article.memberName%></td>
			<td><a href="modify?id=<%=article.id%>">수정</a> <a
				href="delete?id=<%=article.id%>">삭제</a></td>
		</tr>
		<%
		}
		%>
	</table>
	<div class="page">
		<%
		if (nowPage > 1) {
		%>
		<a href="list?page=1">◀◀</a>
		<%
		}
		%>
		<%
		int from = (nowPage - 5 > 0) ? nowPage - 5 : 1;
		int end = (nowPage + 5 > totalPageCnt) ? totalPageCnt : nowPage + 5;
		%>
		<%
		for (int i = from; i <= end; i++) {
		%>
		<a class="<%=nowPage == i ? "red" : ""%>" href="list?page=<%=i%>"><%=i%></a>
		<%
		}
		%>
		<%
		if (nowPage < totalPageCnt) {
		%>
		<a href="list?page=<%=totalPageCnt%>">▶▶</a>
		<%
		}
		%>
	</div>
	<div>
		<ul>
			<li><a href="write">글 작성하기</a></li>
		</ul>
	</div>
	<style>
		.red {
			color:red;
			font-weight: bold;
		}
	</style>
</body>
</html>