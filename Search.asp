<!--#include file="inc/right.asp"--> 
<!--#include file="inc/conn.asp"-->
<%
keywords=request("keywords")
LX=request("LX")
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>У���ǹ���ϵͳ</title>
<link href="images/main.css" rel="stylesheet" type="text/css">
<script language=JavaScript>
<!--
function DoEmpty(params)
{
if (confirm("���Ҫɾ��������¼��ɾ����˼�¼����������ݶ�����ɾ�������޷��ָ���"))
alert("ɾ���ͻ���Ϣ�ɹ�\n ���ؿͻ��б�")
window.location = params ;
}
-->
</script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr valign="top">
    <td bgcolor="#FFFFFF"><br>
      <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
		<tr align="center" bgcolor="#F2FDFF">
          <td class="optiontitle" colspan="8">��ѯ�ͻ���Ϣ</td>	
        </tr>
        <tr align="center" bgcolor="#ebf0f7">
          <td width="10%">�ͻ����</td>
          <td width="20%">�ͻ�����</td>
          <td width="10%">�ͻ�����</td>
          <td width="10%">������</td>
          <td width="15%">�绰</td>
          <td width="20%">Email</td>
          <td width="15%">ִ�в���</td>
		</tr>
<%
if keywords="" then
%>
        <tr align="center" bgcolor="#F2FDFF">
          <form name="search" method="get" action="Search.asp">
            <td height="30" colspan="8"> <strong>�������</strong><select name="LX">
          <option value="1">�ͻ�����</option>
          <option value="2">�ͻ����</option>
        </select> <input name="keywords" type="text" id="keywords" size="30"> 
              <input name="Query" type="submit" id="Query" value="�� ѯ"></td>
          </form>
        </tr>
<%end if%>  
<%
if keywords<>"" then 'ͨ������ѯ�ͻ���Ϣ
 if LX<>"" Then
   Select Case LX
     Case "1" 
   sql="select * from Information where cname like '%"&keywords&"%' order by id desc"
	 Case "2"
   sql="select * from Information where idcard like '%"&keywords&"%' order by id desc"
   end select
 end if
 set rs=server.createobject("adodb.recordset") 
 rs.open sql,conn,1,1
 if not rs.eof Then
    proCount=rs.recordcount
    For i = 1 to proCount
    if rs.EOF then     
    Exit For 
    end if
%>
		<tr align='center' bgcolor='#FFFFFF' onmouseover='this.style.background="#ebf0f7"' onmouseout='this.style.background="#FFFFFF"'>
          <td><%=rs("idcard")%></td>
		  <td><%=rs("cname")%></td>
          <td>
		  <%if rs("rank")="1" Then%>��<%end if%>
          <%if rs("rank")="2" Then%>���<%end if%>
		  <%if rs("rank")="3" Then%>����<%end if%>
		  <%if rs("rank")="4" Then%>�����<%end if%>
		  <%if rs("rank")="5" Then%>������<%end if%></td>
		  <td><%=rs("owner")%></td>
		  <td><%=rs("phone")%></td>
		  <td><%=rs("email")%></td>
          <td><IMG src="images/view.gif" align="absmiddle"><a href="Information.asp?action=view&id=<%=rs("id")%>">�鿴</a> | <IMG src="images/edit.gif" align="absmiddle"><a href="Information.asp?action=edit&id=<%=rs("id")%>">�޸�</a> | <IMG src="images/drop.gif" align="absmiddle"><a href="javascript:DoEmpty('Information.asp?wor=del&id=<%=rs("id")%>&action=list&ToPage=<%=intCurPage%>')">ɾ��</a></td>
<%
rs.MoveNext 
next
%>

		</tr>
        <tr align="center" bgcolor="#F2FDFF"> 
         <form name="search" method="get" action="Search.asp">
           <td height="30" colspan="8"> <strong>�������</strong><select name="LX">
          <option value="1">�ͻ�����</option>
          <option value="2">�ͻ����</option>
        </select> <input name="keywords" type="text" id="keywords" size="30"> 
           <input name="Query" type="submit" id="Query" value="�� ѯ"></td>
         </form>
        </tr>		
<%
else
%>
        <tr align='center' bgcolor='#F2FDFF'>
          <form name="search" method="get" action="Search.asp">
           <td height="30" colspan="8"> <strong>�������</strong> <select name="LX">
          <option value="1">�ͻ�����</option>
          <option value="2">�ͻ����</option>
        </select> <input name="keywords" type="text" id="keywords" size="30"> 
           <input name="Query" type="submit" id="Query" value="�� ѯ"></td>
          </form>
        </tr>
        <tr align="center" bgcolor="#FFFFFF">
          <td colspan="8">�Բ���Ŀǰ���л�û�� <font color="#FF0000"><%=keywords%></font> ������Ϣ��</td>
        </tr>
<%
end if
rs.close
set rs=nothing
end if
%>
      </table> 
    </td>
  </tr>
</table>
</body>
</html>