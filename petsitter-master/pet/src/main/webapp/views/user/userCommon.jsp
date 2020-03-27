<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>회원가입</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />



<jsp:include page="${pageContext.request.contextPath}/header" />
</head>

<body class="subpage">


   <!-- Banner -->
   <section class="banner">
      <article>
         <img
            src="${PageContext.request.contextPage}/resources/images/home1.jpg"
            alt="" />
         <div class="inner">
            <header>
               <p>
                  당신의 반려동물을 돌봐드립니다. <a href="https://templated.co">예약하기</a>
               </p>
               <font size="7em">돌봐주개</font>
            </header>
         </div>
      </article>
      <article>
         <img
            src="${PageContext.request.contextPage}/resources/images/home2.jpg"
            alt="" />
         <div class="inner">
            <header>
               <p>
                  믿을 수 있는 펫시터를 소개합니다. <a
                     href="${PageContext.request.contextPage}/views/petsitter/petsearch.jsp">펫시터
                     찾기</a>
               </p>
               <font size="7em">돌봐주개</font>
            </header>
         </div>
      </article>
      <article>
         <img
            src="${PageContext.request.contextPage}/resources/images/home3.jpg"
            alt="" />
         <div class="inner">
            <header>
               <p>사람의 영혼은 개를 대하는 모습으로 알 수 있다.</p>
               <font size="7em">돌봐주개</font>
            </header>
         </div>
      </article>
      <article>
         <img
            src="${PageContext.request.contextPage}/resources/images/home4.jpg"
            alt="" />
         <div class="inner">
            <header>
               <p>정의로운 인생을 추구하는 사람이라면 첫 번째 행동은 동물 학대를 금지하는 것이다.</p>
               <font size="7em">돌봐주개</font>
            </header>
         </div>
      </article>
      <article>
         <img
            src="${PageContext.request.contextPage}/resources/images/home5.jpg"
            alt="" />
         <div class="inner">
            <header>
               <p>인간은 동물을 다스릴 권리가 있는 것이 아니라 모든 생명체를 지킬 의무가 있다.</p>
               <font size="7em">돌봐주개</font>
            </header>
         </div>
      </article>
   </section>

</body>


</html>