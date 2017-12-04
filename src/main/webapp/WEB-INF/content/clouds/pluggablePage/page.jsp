<%--
  Created by IntelliJ IDEA.
  User: vellerzheng
  Date: 2017/12/4
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org"
      xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">

<body>
<div th:fragment="pager">
    <div class="text-right" th:with="baseUrl=${#httpServletRequest.getRequestURL().toString()},pars=${#httpServletRequest.getQueryString() eq null ? '' : new String(#httpServletRequest.getQueryString().getBytes('iso8859-1'), 'UTF-8')}">
        <ul style="margin:0px;" class="pagination" th:with="newPar=${new Java.lang.String(pars eq null ? '' : pars).replace('page='+(datas.number), '')},
                                                curTmpUrl=${baseUrl+'?'+newPar},
                                                curUrl=${curTmpUrl.endsWith('&') ? curTmpUrl.substring(0, curTmpUrl.length()-1):curTmpUrl}" >
            <!--<li th:text="${pars}"></li>-->

            <li><a href="https://my.oschina.net/wangxincj/blog/#" th:href="https://my.oschina.net/wangxincj/blog/@{${curUrl}(page=0)}">首页</a></li>
            <li th:if="${datas.hasPrevious()}"><a href="https://my.oschina.net/wangxincj/blog/#" th:href="https://my.oschina.net/wangxincj/blog/@{${curUrl}(page=${datas.number-1})}">上一页</a></li>

            <!--总页数小于等于10-->
            <div th:if="${(datas.totalPages le 10) and (datas.totalPages gt 0)}" th:remove="tag">
                <div th:each="pg : ${#numbers.sequence(0, datas.totalPages - 1)}" th:remove="tag">
                        <span th:if="${pg eq datas.getNumber()}" th:remove="tag">
                            <li class="active"><span class="current_page line_height" th:text="${pg+1}">${pageNumber}</span></li>
                        </span>
                    <span th:unless="${pg eq datas.getNumber()}" th:remove="tag">
                            <li><a href="https://my.oschina.net/wangxincj/blog/#" th:href="https://my.oschina.net/wangxincj/blog/@{${curUrl}(page=${pg})}" th:text="${pg+1}"></a></li>
                        </span>
                </div>
            </div>

            <!-- 总数数大于10时 -->
            <div th:if="${datas.totalPages gt 10}" th:remove="tag">
                <li th:if="${datas.number-2 ge 0}"><a href="https://my.oschina.net/wangxincj/blog/#" th:href="https://my.oschina.net/wangxincj/blog/@{${curUrl}(page=${datas.number}-2)}" th:text="${datas.number-1}"></a></li>
                <li th:if="${datas.number-1 ge 0}"><a href="https://my.oschina.net/wangxincj/blog/#" th:href="https://my.oschina.net/wangxincj/blog/@{${curUrl}(page=${datas.number}-1)}" th:text="${datas.number}"></a></li>
                <li class="active"><span class="current_page line_height" th:text="${datas.number+1}"></span></li>
                <li th:if="${datas.number+1 lt datas.totalPages}"><a href="https://my.oschina.net/wangxincj/blog/#" th:href="https://my.oschina.net/wangxincj/blog/@{${curUrl}(page=${datas.number}+1)}" th:text="${datas.number+2}"></a></li>
                <li th:if="${datas.number+2 lt datas.totalPages}"><a href="https://my.oschina.net/wangxincj/blog/#" th:href="https://my.oschina.net/wangxincj/blog/@{${curUrl}(page=${datas.number}+2)}" th:text="${datas.number+3}"></a></li>
            </div>


            <li th:if="${datas.hasNext()}"><a href="https://my.oschina.net/wangxincj/blog/#" th:href="https://my.oschina.net/wangxincj/blog/@{${curUrl}(page=${datas.number+1})}">下一页</a></li>
            <!--<li><a href="https://my.oschina.net/wangxincj/blog/#" th:href="https://my.oschina.net/wangxincj/blog/@{${curUrl}(page=${datas.totalPages-1})}">尾页</a></li>-->
            <li><a href="https://my.oschina.net/wangxincj/blog/#" th:href="https://my.oschina.net/wangxincj/blog/${datas.totalPages le 0 ? curUrl+'page=0':curUrl+'&page='+(datas.totalPages-1)}">尾页</a></li>
            <li><span th:utext="'共'+${datas.totalPages}+'页 / '+${datas.totalElements}+' 条'"></span></li>
        </ul>
    </div>
</div>
</body>
</html>
