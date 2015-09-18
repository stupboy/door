<!--#include file="../inc/right.asp"--> 
<!--#include file="../inc/conn.asp"-->
<!--#include file="../lib/lib.all.asp"-->
<%
'-删除记录 is_ok='false'-
if Request("wor")="del" then
 id=request("id")
 idArr=split(id,",")
 for i=0 to ubound(idArr)
  sql="update GoodsInfo set is_ok='false' where id="&trim(idArr(i))
  conn.execute(sql)
 next
end if
%>
<%
'-添加和修改记录 id为空则为添加 否则为修改-
action=Request("action")
id=Request("id")
if action="yes" Then
 set rs=server.createobject("adodb.recordset") 
if id="" then
   set rsCheck = conn.execute("select Gname from GoodsInfo where Gname='" & trim(Request.Form("cname")) & "'")
     if not (rsCheck.bof and rsCheck.eof) then
      response.write "<script language='javascript'>alert('商品商品编号 " & trim(Request.Form("idcard")) & " 已存在，请检查！');history.back(-1);</script>"
      response.end
     end if
   set rsCheck=nothing
   sql="select * from GoodsInfo " 
   rs.open sql,conn,3,3
   rs.addnew
else
   sql="select * from GoodsInfo where id="&id&"" 
   rs.open sql,conn,1,2
end if
rs("Gname")=Request("cname")
rs("Gcat")=Request("address")
rs("Gcost")=Request("pcode")
rs("Gsell")=Request("owner")
if id="" then 
rs("adduser")=session("admin_name")
end if 
rs("Muser")=session("admin_name")
rs.update
rs.close
set rs=nothing
 Response.Redirect "?action=list"
elseif action="billadd" then 
sc "sd"
end if
%>
<html>
<head>
<title>销售管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../images/main.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/javascript" src="../Date/WdatePicker.js"></script>
<script language=JavaScript type=text/JavaScript>
function CheckAll(form)
{for (var i=0;i<form.elements.length;i++){
var e = form.elements[i];
if (e.name != 'chkall') e.checked = form.chkall.checked;
}
}
</script>
<script language=JavaScript>
<!--
function DoEmpty(params)
{
if (confirm("真的要删除这条记录吗？删除后此记录里的所有内容都将被删除并且无法恢复！"))
window.location = params ;
}

function check()
{

  if (document.add.cname.value=="")
     {
      alert("请填写商品名称！")
      document.add.cname.focus()
      document.add.cname.select()
      return
     }
	 
  if (document.add.address.value=="")
     {
      alert("请填写商品类别！")
      document.add.address.focus()
      document.add.address.select()
      return
     }
	 
  if (document.add.pcode.value=="")
     {
      alert("商品采购成本！")
      document.add.pcode.focus()
      document.add.pcode.select()
      return
     }
  
  if (document.add.owner.value=="")
     {
      alert("商品零售价格！")
      document.add.owner.focus()
      document.add.owner.select()
      return
     }
	 
	 	 
     document.add.submit()
}

 function next()
 {
  if(event.keyCode==13)event.keyCode=9;
 }
-->
</script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr valign="top">
    <td bgcolor="#FFFFFF">
	<%if action="list1" then%><BR>
        <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
        <form name="add" method="post" action="goods.asp">
        <tr align="center" bgcolor="#F2FDFF">
          <td colspan="6"  class="optiontitle"> 添加商品订单 </td>
        </tr>
        <tr bgcolor='#F2FDFF'>
          <td align='right' bgcolor="#FFFFFF"> 商品名称：</td>
          <td colspan="5" bgcolor="#FFFFFF"><input name="cname" type="text" id="cname" onKeyDown="next()" size="15" maxlength="50" value="<%=danhao("D")%>" > 
            按回车\TAB键即可输入下一选项</td>
        </tr>		
		<tr bgcolor='#FFFFFF'>
		  <td align='right' bgcolor="#FFFFFF"> 商品类别：</td>
		  <td><input name="address" type="text" id="address" onKeyDown="next()"></td>
		  <td align='right'>采购成本：</td>
		  <td><input name="pcode" type="text" id="pcode" onKeyDown="next()"></td>
		  <td align='right'>销售价格：</td>
		  <td><input name="owner" type="text" id="owner" onKeyDown="next()"></td>
		</tr>
        <tr align="center" bgcolor="#ebf0f7">
          <td colspan="6" >
		     <INPUT TYPE="hidden" name="action" value="yes">
            <input type="button" name="Submit" value="提交" onClick="check()">
          	<input type="button" name="Submit2" value="返回" onClick="history.back(-1)"></td>
        </tr>
		</FORM>
      </table> 
<br>
      <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
        <tr align="center" bgcolor="#F2FDFF">
          <td colspan="8"  class="optiontitle">商品信息</td>
        </tr>
        <tr align="center" bgcolor="#ebf0f7">
		  <td width="5%">选中</td>
          <td width="10%">商品名称</td>
          <td width="10%">商品类别</td>
          <td width="10%">采购成本</td>
          <td width="10%">销售价格</td>
          <td width="10%">修改时间</td>
          <td width="10%">修改人员</td>
          <td width="10%">执行操作</td>
        </tr>	
<%
 sql="select * from GoodsInfo where is_ok='true' order by id desc"
 set rs=server.createobject("adodb.recordset") 
 rs.open sql,conn,1,1
 if not rs.eof then
 proCount=rs.recordcount
	rs.PageSize=3
     if not IsEmpty(Request("ToPage")) then
	    ToPage=CInt(Request("ToPage"))
		if ToPage>rs.PageCount then
		   rs.AbsolutePage=rs.PageCount
		   intCurPage=rs.PageCount
		elseif ToPage<=0 then
		   rs.AbsolutePage=1
		   intCurPage=1
		else
		   rs.AbsolutePage=ToPage
		   intCurPage=ToPage
		end if
	 else
		rs.AbsolutePage=1
		intCurPage=1
	 end if
	 intCurPage=CInt(intCurPage)
	 For i = 1 to rs.PageSize
	 if rs.eof then     
	 Exit For 
	 end if
%>
       <form name="del" action="" method="post">
        <tr align='center' bgcolor='#FFFFFF' onmouseover='this.style.background="#F2FDFF"' onmouseout='this.style.background="#FFFFFF"'>
          <td><input type="checkbox" name="id" value="<%=rs("id")%>"></td>
          <td><%=rs("Gname")%></td>
		  <td><%=rs("Gcat")%></td>
          <td><%=rs("Gcost")%></td>
		  <td><%=rs("Gsell")%></td>
		  <td><%=rs("addtime")%></td>
		  <td><%=rs("adduser")%></td>
          <td><IMG src="../images/view.gif" align="absmiddle"><a href="?action=view&id=<%=rs("id")%>">查看</a> | <IMG src="../images/edit.gif" align="absmiddle"><a href="?action=edit&id=<%=rs("id")%>">修改</a> | <IMG src="../images/drop.gif" align="absmiddle"><a href="javascript:DoEmpty('?wor=del&id=<%=rs("id")%>&action=list&ToPage=<%=intCurPage%>')">删除</a></td>
        </tr>
<%
rs.movenext 
next
%>
		<tr bgcolor="#F2FDFF">
		  <td colspan="8">&nbsp;&nbsp;
		   <input name="chkall" type="checkbox" id="chkall" value="select" onclick=CheckAll(this.form)> 全选
		   <input name="wor" type="hidden" id="wor" value="del" />
		   <input type="submit" name="Submit3" value="删除所选" onClick="{if(confirm('确定要删除记录吗？删除后将被无法恢复！')){return true;}return false;}" />
		  </td>
		</tr>
		</form>
        <tr align="center" bgcolor="#ebf0f7">
          <td colspan="8">总共：
		  <font color="#ff0000"><%=rs.PageCount%></font>页, 
		  <font color="#ff0000"><%=proCount%></font>条商品信息, 当前页：
		  <font color="#ff0000"><%=intCurPage%> </font>
		  <%if intCurPage<>1 then%>
		  <a href="?action=list">首页</a> | 
		  <a href="?action=list&ToPage=<%=intCurPage-1%>">上一页</a> | 
		  <% end if
             if intCurPage<>rs.PageCount then %>
          <a href="?action=list&ToPage=<%=intCurPage+1%>">下一页</a> | 
		  <a href="?action=list&ToPage=<%=rs.PageCount%>"> 最后页</a>
		  <% end if%>
		  </span>
		  </td>
        </tr>
<%
else
%>
        <tr align="center" bgcolor="#ffffff">
          <td colspan="8">对不起！目前数据库中还没有添加商品信息！</td>
        </tr>
        <%
          rs.close
          set rs=nothing
          end if
        %>
      </table><br>
<%end if%>
<%
if action="list" then
'-init search condition
stime0=date2str(now()-7,3)
etime0=date2str(now(),3)
'-request the condition
stime=date2str(Request("stime"),3) '-start date-
etime=date2str(Request("etime"),3) '-end date-
'-初始SQL 默认查询近一周-
 sql="select * from DP_SS_view where p_view_param.set_v1('"&stime0&"')='"&stime0&"' and p_view_param.set_v2('"&etime0&"')='"&etime0&"' and 店名='湖里旗舰店' order by 款号,颜色,标志 desc,合计 desc "
if etime>stime and etime<>"" and stime<>"" then '-IF THE SEARCH DATE NOT NULL-
 sql="select * from DP_SS_view where p_view_param.set_v1('"&stime&"')='"&stime&"' and p_view_param.set_v2('"&etime&"')='"&etime&"' and 店名='湖里旗舰店' and 款号||颜色 in (select distinct 款号||颜色 from rp_retai_jwy where 店名='湖里旗舰店' and billdate between '"&stime&"' and '"&etime&"' )  order by 款号,颜色,标志 desc,合计 desc "
end if 
%>
<br>
  <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
        <tr align="center" bgcolor="#F2FDFF">
          <td colspan="25"  class="optiontitle">店铺商品销存情况</td>
        </tr>
	    <tr  align="center" bgcolor="#F2FDFF">
	     <form name="search" method="get" action="bill.asp">
         <td height="30" colspan="25">
		 <input name="action" type="text" id="action" value="list" style="display:none" size="30">
		 开始日期:<input name="stime" type="text" id="stime" size="15" onfocus="WdatePicker({isShowWeek:true})" readonly="readonly" value="<%=stime%>"/> 
		 |结束日期:<input name="etime" type="text" id="etime" size="15" onfocus="WdatePicker({isShowWeek:true})" readonly="readonly" value="<%=etime%>"/> 
         |未销售<input name="t" type="checkbox" id="t" /> | <input name="Query" type="submit" id="Query" value="查 询">*默认查询近1周数据</td>
         </form>
	    </tr>
        <tr align="center" bgcolor="#ebf0f7">
		  <td width="3%">选中</td>
          <td width="6%">仓库</td>
		  <td width="3%">年份</td>
          <td width="3%">季节</td>
          <td width="3%">类别</td>
          <td width="6%">款号</td>
          <td width="3%">颜色</td>
		  <td width="3%">155<br/>.<br/>28<br/>38<br/>M<br/>28<br/>0</td>
		  <td width="3%">160<br/>160<br/>29<br/>39<br/>L<br/>29<br/>.</td>
		  <td width="3%">165<br/>165<br/>30<br/>40<br/>XL<br/>30<br/>.</td>
		  <td width="3%">170<br/>170<br/>31<br/>41<br/>XXL<br/>31<br/>.</td>
		  <td width="3%">.<br/>175<br/>315<br/>42<br/>.<br/>.<br/>.</td>
		  <td width="3%">.<br/>180<br/>32<br/>43<br/>.<br/>32<br/>.</td>
		  <td width="3%">.<br/>185<br/>33<br/>44<br/>.<br/>33<br/>.</td>
		  <td width="3%">.<br/>190<br/>34<br/>.<br/>.<br/>34<br/>.</td>
		  <td width="3%">.<br/>.<br/>35<br/>.<br/>.<br/>35<br/>.</td>
		  <td width="3%">.<br/>.<br/>36<br/>.<br/>.<br/>36<br/>.</td>
		  <td width="3%">.<br/>.<br/>37<br/>.<br/>.<br/>.<br/>.</td>
		  <td width="3%">.<br/>.<br/>38<br/>.<br/>.<br/>38<br/>.</td>
		  <td width="3%">.<br/>.<br/>40<br/>.<br/>.<br/>40<br/>.</td>
		  <td width="3%">.<br/>.<br/>42<br/>.<br/>.<br/>42<br/>.</td>
		  <td width="3%">.<br/>.<br/>44<br/>.<br/>.<br/>44<br/>.</td>
          <td width="3%">总数</td>
          <td width="3%">标注</td>
		  <td width="3%">操作</td>
        </tr>	
<%
 
 set rs=server.createobject("adodb.recordset") 
 rs.open sql,conn1,1,1
 if not rs.eof then
 proCount=rs.recordcount
	rs.PageSize=15
     if not IsEmpty(Request("ToPage")) then
	    ToPage=CInt(Request("ToPage"))
		if ToPage>rs.PageCount then
		   rs.AbsolutePage=rs.PageCount
		   intCurPage=rs.PageCount
		elseif ToPage<=0 then
		   rs.AbsolutePage=1
		   intCurPage=1
		else
		   rs.AbsolutePage=ToPage
		   intCurPage=ToPage
		end if
	 else
		rs.AbsolutePage=1
		intCurPage=1
	 end if
	 intCurPage=CInt(intCurPage)
	 For i = 1 to rs.PageSize
	 if rs.eof then     
	 Exit For 
	 end if
%>
       <form name="del" action="" method="post">
	   <% if rs(22)="销售" then %>
	    <tr align='center' bgcolor='#DFC5A4' onmouseover='this.style.background="#E56600"' onmouseout='this.style.background="#DFC5A4"'>
	   <% else %>
        <tr align='center' bgcolor='#FFFFFF' onmouseover='this.style.background="#F2FDFF"' onmouseout='this.style.background="#FFFFFF"'>
	   <% end if %>
          <td><input type="checkbox" name="id" value="<%=rs(1)&rs(4)&rs(5)%>"></td>
          <td><%=rs(0)%></td>
		  <td><%=rs(1)%></td>
		  <td><%=rs(2)%></td>
          <td><%=rs(3)%></td>
		  <td><%=rs(4)%></td>
		  <td><%=rs(5)%></td>
		  <% for j=6 to 20 %>
		  <td><%=re_char(rs(j),"0","")%></td>
		  <% next %>
		  <td><%=rs(21)%></td>
		  <td><%=rs(22)%></td>
          <td><IMG src="../images/view.gif" align="absmiddle"><a href="?action=view&id=<%=rs(7)%>">查看</a></td>
        </tr>
<%
rs.movenext 
next
%>
		<tr bgcolor="#F2FDFF">
		  <td colspan="25">&nbsp;&nbsp;
		   <input name="chkall" type="checkbox" id="chkall" value="select" onclick=CheckAll(this.form)> 全选
		   <input name="wor" type="hidden" id="wor" value="del" />
		   <input type="submit" name="Submit3" value="删除所选" onClick="{if(confirm('确定要删除记录吗？删除后将被无法恢复！')){return true;}return false;}" />
		  </td>
		</tr>
		</form>
        <tr align="center" bgcolor="#ebf0f7">
          <td colspan="25">总共：
		  <font color="#ff0000"><%=rs.PageCount%></font>页, 
		  <font color="#ff0000"><%=proCount%></font>条商品信息, 当前页：
		  <font color="#ff0000"><%=intCurPage%> </font>
		  <%if intCurPage<>1 then%>
		  <a href="?action=list&stime=<%=stime%>&etime=<%=etime%>">首页</a> | 
		  <a href="?action=list&ToPage=<%=intCurPage-1%>&stime=<%=stime%>&etime=<%=etime%>">上一页</a> | 
		  <% end if
             if intCurPage<>rs.PageCount then %>
          <a href="?action=list&ToPage=<%=intCurPage+1%>&stime=<%=stime%>&etime=<%=etime%>">下一页</a> | 
		  <a href="?action=list&ToPage=<%=rs.PageCount%>&stime=<%=stime%>&etime=<%=etime%>"> 最后页</a>
		  <% end if%>
		  </span>
		  </td>
        </tr>
<%
else
%>
        <tr align="center" bgcolor="#ffffff">
          <td colspan="8">对不起！目前数据库中还没有添加商品信息！</td>
        </tr>
        <%
          rs.close
          set rs=nothing
          end if
        %>
      </table><br>
<%end if%>
<%if action="edit" then
set rs=server.createobject("adodb.recordset") 
sql="select * from GoodsInfo where id="&Request("id")
rs.open sql,conn,1,1
if not rs.eof Then
%>
	  <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
       <form name="add" method="post" action="goods.asp">
		<tr align="center" bgcolor="#F2FDFF">
		  <td colspan=6  class="optiontitle"> 商品信息 </td>
		</tr>
		<tr bgcolor='#F2FDFF'>
          <td align='right' bgcolor="#FFFFFF"> 商品名称：</td>
          <td colspan="5" bgcolor="#FFFFFF"><input name="cname" type="text" id="cname" value="<%=rs("gname")%>" size="50" maxlength="50" onKeyDown="next()"> 
          按回车\TAB键即可输入下一选项</td>
        </tr>		
		<tr bgcolor='#FFFFFF'>
		  <td align='right' bgcolor="#FFFFFF"> 商品类别：</td>
		  <td><input name="address" type="text" id="address" value="<%=rs("Gcat")%>" onKeyDown="next()"></td>
		  <td align='right'>采购成本：</td>
		  <td><input name="pcode" type="text" id="pcode" value="<%=rs("gcost")%>" onKeyDown="next()"></td>
		  <td align='right'>销售价格：</td>
		  <td><input name="owner" type="text" id="owner" value="<%=rs("gsell")%>" onKeyDown="next()"></td>
		</tr>
		<tr align="center" bgcolor="#ebf0f7">
		  <td colspan="6">
		  <input type="hidden" name="action" value="yes">
          <input type="button" name="Submit2" value="提交" onClick="check()">
          <input type="button" name="Submit2" value="返回" onClick="history.back(-1)">
		  <input name="id" type="hidden" id="id" value="<%=rs("id")%>"></td>
		</tr>
  		</FORM>
  	</table>
<%
end if
end if
%>  
<%if action="view" then
set rs=server.createobject("adodb.recordset") 
sql="select * from GoodsInfo where id="&Request("id")
rs.open sql,conn,1,1
if not rs.eof Then
%>
	  <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
		<tr align="center" bgcolor="#F2FDFF">
		  <td colspan=6  class="optiontitle"> 商品信息 </td>
		</tr>
		<tr bgcolor='#F2FDFF'>
          <td align='right' bgcolor="#FFFFFF"> 商品名称：</td>
          <td colspan="5" bgcolor="#FFFFFF"><%=rs("Gname")%></td>
        </tr>		
		<tr bgcolor='#FFFFFF'>
		  <td align='right' bgcolor="#FFFFFF"> 商品类别：</td>
		  <td><%=rs("gcat")%></td>
		  <td align='right'>采购成本：</td>
		  <td><%=rs("gcost")%></td>
		  <td align='right'>销售价格：</td>
		  <td><%=rs("gsell")%></td>
		</tr>
		<tr align="center" bgcolor="#ebf0f7">
		  <td colspan="6">
          <input type="button" name="Submit2" value="返回" onClick="history.back(-1)"></td>
		</tr>
  	</table>
<%
end if
end if
%> 
  
    </td>
  </tr>
</table>
</body>
</html>