<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	pageContext.setAttribute("replaceChar", "\n");
%>
<!DOCTYPE html>

<html lang="ko">
<head>
<title>댓글</title>
</head>

<body>
		<br /> ---댓글----------------------------------------------------<br />
		<c:choose>
			<c:when test="${empty comments}">
				<tr>
					<th colspan="5" class="text-center">댓글이 존재하지 않습니다. 첫번째 댓글을
						달아보세요!</th>
				</tr>
			</c:when>
			<c:otherwise>


				<table class="table" style="font-size: 13px; padding: 20px;">
					<c:forEach var="comments" items="${comments }">
						<tr>
							<td><strong>${comments.uName}</strong></td>
							<td class="text-right">${comments.cmtDate}</td>
							<td width="100"><c:if test="${comments.uId == user.UId }">
									<a class="glyphicon glyphicon-trash"
										href="${pageContext.request.contextPath}/comment/cmtrmv?articleId=${article.articleId}&commentId=${comments.cmtId}">댓글삭제</a>
								</c:if></td>
						</tr>
						<tr>
							<td colspan="3">
								<p class="txt">${fn:replace(comments.comment, replaceChar, "<br/>")}</p>
							</td>
						</tr>
					</c:forEach>
				</table>


			</c:otherwise>
		</c:choose>

		<div>

			<div class="write_area">
			<p>댓글 쓰기</p>
				<form action="${pageContext.request.contextPath}/article/cmtRegist">
					<div>
						<input type="hidden" name="articleId" value="${detail.articleId}">
						<input type="hidden" name="uId" value="${user.UId }">
						<textarea class="input_write_comment" name="comment"
							placeholder="댓글쓰기"></textarea>
						<input type="submit" class="comment_submit" value="전송">
					</div>
				</form>
			</div>
		</div>
	</div>


	<div></div>

<script>
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(code){
    
    $.ajax({
        type:'POST',
        url : "<c:url value='/article/cmtRegist'/>",
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data=="success")
            {
                getCommentList();
                $("#comment").val("");
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    
    getCommentList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    
    $.ajax({
        type:'GET',
        url : "<c:url value='/article/commentList.do'/>",
        dataType : "json",
        data:$("#commentForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
                    html += data[i].comment + "<tr><td></td></tr>";
                    html += "</table></div>";
                    html += "</div>";
                }
                
            } else {
                
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
        },
        error:function(request,status,error){
            
       }
        
    });
}
 
</script>





</body>
</html>