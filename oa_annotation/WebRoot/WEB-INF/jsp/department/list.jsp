<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/comm/common.jsp"%>
<html>
<head>
    <title>部门列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
 
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath }/css/images/title_arrow.gif"/> 部门管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea">
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr align=center valign=middle id=TableTitle>
            	<td width="150px">部门名称</td>
				<td width="150px">上级部门名称</td>
				<td width="200px">职能说明</td>
				<td>相关操作</td>
            </tr>
        </thead>

		<!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="departmentList">
        	<s:iterator value="#departments">
			<tr class="TableDetail1 template">
				<td><a href="_list_level2.html"><s:property value="dname"/></a>&nbsp;</td>
				<td><s:property value="description" escape="false"/>&nbsp;</td>
				<td>
					<s:a action="departmentAction_deleteDepartment?did=%{did}">删除</s:a>
					<s:a action="departmentAction_updateUI?did=%{did}">修改</s:a>
				</td>
			</tr>
			</s:iterator>
			
			<!-- 练习：迭代list中的list
				第一迭代，迭代外层，把内层list放入栈顶
				第二层迭代：迭代内层list，把list里面元素放入栈顶
				直接使用<s:property value="dname"/>，获取元素即可
			 -->
			 <!-- 
			<s:iterator>
				<s:iterator>
					<s:property value="dname"/>
				</s:iterator>
			</s:iterator>
			 -->
			 
			 <!-- 如何迭代list中的map
			 	value:指的是map中的value，如果是对象，需要实现obj.属性
			  -->
			  <!-- 
			 <s:iterator value="#lists">
			 	<s:iterator>
			 		<s:property value="key"/>
			 		<s:property value="value.dname"/>
			 	</s:iterator>
			 </s:iterator>
			  -->
			  <!-- 
			  	如何迭代map中的list
			   -->
			   <!--  
			   <s:iterator value="#listMap">
			   		<s:property value="key"/>
			   		<s:iterator value="value">
			   			<s:property value="dname"/>
			   		</s:iterator>
			   </s:iterator>
			   -->
        </tbody>
    </table>
    
    <!-- 其他功能超链接 -->
    <div id="TableTail">
        <div id="TableTail_inside">
            <a href="departmentAction_addUI.action"><img src="${pageContext.request.contextPath }/css/images/createNew.png" /></a>
        </div>
    </div>
</div>

<!--说明-->	
<div id="Description"> 
	说明：<br />
	1，列表页面只显示一层的（同级的）部门数据，默认显示最顶级的部门列表。<br />
	2，点击部门名称，可以查看此部门相应的下级部门列表。<br />
	3，删除部门时，同时删除此部门的所有下级部门。
</div>

</body>
</html>