<!--#include file="../inc/right.asp"--> 
<!--#include file="../inc/conn.asp"-->
<!--#include file="../lib/lib.all.asp"-->
<%
'-ɾ����¼ is_ok='false'-
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
'-��Ӻ��޸ļ�¼ idΪ����Ϊ��� ����Ϊ�޸�-
action=Request("action")
id=Request("id")
if action="yes" Then
 set rs=server.createobject("adodb.recordset") 
if id="" then
   set rsCheck = conn.execute("select Gname from GoodsInfo where Gname='" & trim(Request.Form("cname")) & "'")
     if not (rsCheck.bof and rsCheck.eof) then
      response.write "<script language='javascript'>alert('��Ʒ��Ʒ��� " & trim(Request.Form("idcard")) & " �Ѵ��ڣ����飡');history.back(-1);</script>"
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
<title>���۹���ϵͳ</title>
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
if (confirm("���Ҫɾ��������¼��ɾ����˼�¼����������ݶ�����ɾ�������޷��ָ���"))
window.location = params ;
}

function check()
{

  if (document.add.cname.value=="")
     {
      alert("����д��Ʒ���ƣ�")
      document.add.cname.focus()
      document.add.cname.select()
      return
     }
	 
  if (document.add.address.value=="")
     {
      alert("����д��Ʒ���")
      document.add.address.focus()
      document.add.address.select()
      return
     }
	 
  if (document.add.pcode.value=="")
     {
      alert("��Ʒ�ɹ��ɱ���")
      document.add.pcode.focus()
      document.add.pcode.select()
      return
     }
  
  if (document.add.owner.value=="")
     {
      alert("��Ʒ���ۼ۸�")
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
          <td colspan="6"  class="optiontitle"> �����Ʒ���� </td>
        </tr>
        <tr bgcolor='#F2FDFF'>
          <td align='right' bgcolor="#FFFFFF"> ��Ʒ���ƣ�</td>
          <td colspan="5" bgcolor="#FFFFFF"><input name="cname" type="text" id="cname" onKeyDown="next()" size="15" maxlength="50" value="<%=danhao("D")%>" > 
            ���س�\TAB������������һѡ��</td>
        </tr>		
		<tr bgcolor='#FFFFFF'>
		  <td align='right' bgcolor="#FFFFFF"> ��Ʒ���</td>
		  <td><input name="address" type="text" id="address" onKeyDown="next()"></td>
		  <td align='right'>�ɹ��ɱ���</td>
		  <td><input name="pcode" type="text" id="pcode" onKeyDown="next()"></td>
		  <td align='right'>���ۼ۸�</td>
		  <td><input name="owner" type="text" id="owner" onKeyDown="next()"></td>
		</tr>
        <tr align="center" bgcolor="#ebf0f7">
          <td colspan="6" >
		     <INPUT TYPE="hidden" name="action" value="yes">
            <input type="button" name="Submit" value="�ύ" onClick="check()">
          	<input type="button" name="Submit2" value="����" onClick="history.back(-1)"></td>
        </tr>
		</FORM>
      </table> 
<br>
      <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
        <tr align="center" bgcolor="#F2FDFF">
          <td colspan="8"  class="optiontitle">��Ʒ��Ϣ</td>
        </tr>
        <tr align="center" bgcolor="#ebf0f7">
		  <td width="5%">ѡ��</td>
          <td width="10%">��Ʒ����</td>
          <td width="10%">��Ʒ���</td>
          <td width="10%">�ɹ��ɱ�</td>
          <td width="10%">���ۼ۸�</td>
          <td width="10%">�޸�ʱ��</td>
          <td width="10%">�޸���Ա</td>
          <td width="10%">ִ�в���</td>
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
          <td><IMG src="../images/view.gif" align="absmiddle"><a href="?action=view&id=<%=rs("id")%>">�鿴</a> | <IMG src="../images/edit.gif" align="absmiddle"><a href="?action=edit&id=<%=rs("id")%>">�޸�</a> | <IMG src="../images/drop.gif" align="absmiddle"><a href="javascript:DoEmpty('?wor=del&id=<%=rs("id")%>&action=list&ToPage=<%=intCurPage%>')">ɾ��</a></td>
        </tr>
<%
rs.movenext 
next
%>
		<tr bgcolor="#F2FDFF">
		  <td colspan="8">&nbsp;&nbsp;
		   <input name="chkall" type="checkbox" id="chkall" value="select" onclick=CheckAll(this.form)> ȫѡ
		   <input name="wor" type="hidden" id="wor" value="del" />
		   <input type="submit" name="Submit3" value="ɾ����ѡ" onClick="{if(confirm('ȷ��Ҫɾ����¼��ɾ���󽫱��޷��ָ���')){return true;}return false;}" />
		  </td>
		</tr>
		</form>
        <tr align="center" bgcolor="#ebf0f7">
          <td colspan="8">�ܹ���
		  <font color="#ff0000"><%=rs.PageCount%></font>ҳ, 
		  <font color="#ff0000"><%=proCount%></font>����Ʒ��Ϣ, ��ǰҳ��
		  <font color="#ff0000"><%=intCurPage%> </font>
		  <%if intCurPage<>1 then%>
		  <a href="?action=list">��ҳ</a> | 
		  <a href="?action=list&ToPage=<%=intCurPage-1%>">��һҳ</a> | 
		  <% end if
             if intCurPage<>rs.PageCount then %>
          <a href="?action=list&ToPage=<%=intCurPage+1%>">��һҳ</a> | 
		  <a href="?action=list&ToPage=<%=rs.PageCount%>"> ���ҳ</a>
		  <% end if%>
		  </span>
		  </td>
        </tr>
<%
else
%>
        <tr align="center" bgcolor="#ffffff">
          <td colspan="8">�Բ���Ŀǰ���ݿ��л�û�������Ʒ��Ϣ��</td>
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
'-��ʼSQL Ĭ�ϲ�ѯ��һ��-
 sql="select * from DP_SS_view where p_view_param.set_v1('"&stime0&"')='"&stime0&"' and p_view_param.set_v2('"&etime0&"')='"&etime0&"' and ����='�����콢��' order by ���,��ɫ,��־ desc,�ϼ� desc "
if etime>stime and etime<>"" and stime<>"" then '-IF THE SEARCH DATE NOT NULL-
 sql="select * from DP_SS_view where p_view_param.set_v1('"&stime&"')='"&stime&"' and p_view_param.set_v2('"&etime&"')='"&etime&"' and ����='�����콢��' and ���||��ɫ in (select distinct ���||��ɫ from rp_retai_jwy where ����='�����콢��' and billdate between '"&stime&"' and '"&etime&"' )  order by ���,��ɫ,��־ desc,�ϼ� desc "
end if 
%>
<br>
  <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
        <tr align="center" bgcolor="#F2FDFF">
          <td colspan="25"  class="optiontitle">������Ʒ�������</td>
        </tr>
	    <tr  align="center" bgcolor="#F2FDFF">
	     <form name="search" method="get" action="bill.asp">
         <td height="30" colspan="25">
		 <input name="action" type="text" id="action" value="list" style="display:none" size="30">
		 ��ʼ����:<input name="stime" type="text" id="stime" size="15" onfocus="WdatePicker({isShowWeek:true})" readonly="readonly" value="<%=stime%>"/> 
		 |��������:<input name="etime" type="text" id="etime" size="15" onfocus="WdatePicker({isShowWeek:true})" readonly="readonly" value="<%=etime%>"/> 
         |δ����<input name="t" type="checkbox" id="t" /> | <input name="Query" type="submit" id="Query" value="�� ѯ">*Ĭ�ϲ�ѯ��1������</td>
         </form>
	    </tr>
        <tr align="center" bgcolor="#ebf0f7">
		  <td width="3%">ѡ��</td>
          <td width="6%">�ֿ�</td>
		  <td width="3%">���</td>
          <td width="3%">����</td>
          <td width="3%">���</td>
          <td width="6%">���</td>
          <td width="3%">��ɫ</td>
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
          <td width="3%">����</td>
          <td width="3%">��ע</td>
		  <td width="3%">����</td>
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
	   <% if rs(22)="����" then %>
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
          <td><IMG src="../images/view.gif" align="absmiddle"><a href="?action=view&id=<%=rs(7)%>">�鿴</a></td>
        </tr>
<%
rs.movenext 
next
%>
		<tr bgcolor="#F2FDFF">
		  <td colspan="25">&nbsp;&nbsp;
		   <input name="chkall" type="checkbox" id="chkall" value="select" onclick=CheckAll(this.form)> ȫѡ
		   <input name="wor" type="hidden" id="wor" value="del" />
		   <input type="submit" name="Submit3" value="ɾ����ѡ" onClick="{if(confirm('ȷ��Ҫɾ����¼��ɾ���󽫱��޷��ָ���')){return true;}return false;}" />
		  </td>
		</tr>
		</form>
        <tr align="center" bgcolor="#ebf0f7">
          <td colspan="25">�ܹ���
		  <font color="#ff0000"><%=rs.PageCount%></font>ҳ, 
		  <font color="#ff0000"><%=proCount%></font>����Ʒ��Ϣ, ��ǰҳ��
		  <font color="#ff0000"><%=intCurPage%> </font>
		  <%if intCurPage<>1 then%>
		  <a href="?action=list&stime=<%=stime%>&etime=<%=etime%>">��ҳ</a> | 
		  <a href="?action=list&ToPage=<%=intCurPage-1%>&stime=<%=stime%>&etime=<%=etime%>">��һҳ</a> | 
		  <% end if
             if intCurPage<>rs.PageCount then %>
          <a href="?action=list&ToPage=<%=intCurPage+1%>&stime=<%=stime%>&etime=<%=etime%>">��һҳ</a> | 
		  <a href="?action=list&ToPage=<%=rs.PageCount%>&stime=<%=stime%>&etime=<%=etime%>"> ���ҳ</a>
		  <% end if%>
		  </span>
		  </td>
        </tr>
<%
else
%>
        <tr align="center" bgcolor="#ffffff">
          <td colspan="8">�Բ���Ŀǰ���ݿ��л�û�������Ʒ��Ϣ��</td>
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
		  <td colspan=6  class="optiontitle"> ��Ʒ��Ϣ </td>
		</tr>
		<tr bgcolor='#F2FDFF'>
          <td align='right' bgcolor="#FFFFFF"> ��Ʒ���ƣ�</td>
          <td colspan="5" bgcolor="#FFFFFF"><input name="cname" type="text" id="cname" value="<%=rs("gname")%>" size="50" maxlength="50" onKeyDown="next()"> 
          ���س�\TAB������������һѡ��</td>
        </tr>		
		<tr bgcolor='#FFFFFF'>
		  <td align='right' bgcolor="#FFFFFF"> ��Ʒ���</td>
		  <td><input name="address" type="text" id="address" value="<%=rs("Gcat")%>" onKeyDown="next()"></td>
		  <td align='right'>�ɹ��ɱ���</td>
		  <td><input name="pcode" type="text" id="pcode" value="<%=rs("gcost")%>" onKeyDown="next()"></td>
		  <td align='right'>���ۼ۸�</td>
		  <td><input name="owner" type="text" id="owner" value="<%=rs("gsell")%>" onKeyDown="next()"></td>
		</tr>
		<tr align="center" bgcolor="#ebf0f7">
		  <td colspan="6">
		  <input type="hidden" name="action" value="yes">
          <input type="button" name="Submit2" value="�ύ" onClick="check()">
          <input type="button" name="Submit2" value="����" onClick="history.back(-1)">
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
		  <td colspan=6  class="optiontitle"> ��Ʒ��Ϣ </td>
		</tr>
		<tr bgcolor='#F2FDFF'>
          <td align='right' bgcolor="#FFFFFF"> ��Ʒ���ƣ�</td>
          <td colspan="5" bgcolor="#FFFFFF"><%=rs("Gname")%></td>
        </tr>		
		<tr bgcolor='#FFFFFF'>
		  <td align='right' bgcolor="#FFFFFF"> ��Ʒ���</td>
		  <td><%=rs("gcat")%></td>
		  <td align='right'>�ɹ��ɱ���</td>
		  <td><%=rs("gcost")%></td>
		  <td align='right'>���ۼ۸�</td>
		  <td><%=rs("gsell")%></td>
		</tr>
		<tr align="center" bgcolor="#ebf0f7">
		  <td colspan="6">
          <input type="button" name="Submit2" value="����" onClick="history.back(-1)"></td>
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