<!--#include file="inc/right.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 transitional//EN" "http://www.w3.org/tr/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=sysConfig%></title>
<link href="images/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr valign="top">
    <td  bgcolor="#FFFFFF"><br>
	<table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
	  <tr align="center" bgcolor="#F2FDFF">
        <td class="optiontitle" colspan="8">ϵͳ���</td>	
      </tr>
      <tr bgcolor="#FFFFFF">
        <td>��̨��������Ա��</td>
        <td colspan="3"><%=session("admin_name")%><%=session("RealName")%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="100">����������</td>
        <td width="250"><%=Request.ServerVariables("SERVER_NAME")%></td>
        <td width="20%">������IP��</td>
        <td><%=Request.ServerVariables("LOCAL_ADDR")%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td>�������˿ڣ�</td>
        <td><%=Request.ServerVariables("SERVER_PORT")%></td>
        <td>������ʱ�䣺</td>
        <td><%=now%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td>���ļ�����·����</td>
        <td colspan="3"><%=server.mappath(Request.ServerVariables("SCRIPT_NAME"))%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td>�ͻ���IP��</td>
        <td><%=Request.ServerVariables("REMOTE_ADDR")%></td>
        <td>�˿ڣ�</td>
        <td><%=Request.ServerVariables("REMOTE_PORT")%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td>������汾��</td>
        <td colspan="3"><%=Request.ServerVariables("Http_User_Agent")%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td>�ű��������棺</td>
        <td><%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
        <td>Jmail�������֧�֣�</td>
        <td><%If IsObjInstalled("JMail.Message") Then%>
          Jmail4.3�������֧��
            <%elseIf IsObjInstalled("JMail.SMTPMail") then%>
            Jmail4.2���֧��
            <%else%>
            ��֧��Jmail���
          <%end if%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td bgcolor="#FFFFFF">FSO���֧�֣�</td>
        <td>
<%If IsObjInstalled("Scripting.FileSystemObject") then%>FSO֧��
<%else%>��֧��FSO���
<%end if%>
<%Function IsObjInstalled(strClassString)
On Error Resume Next
IsObjInstalled = False
Err = 0
Dim xTestObj
Set xTestObj = Server.CreateObject(strClassString)
If 0 = Err Then IsObjInstalled = true
Set xTestObj = Nothing
Err = 0
End Function
%></td>
        <td>CDONTS�������֧�֣�</td>
        <td><%If IsObjInstalled("CDONTS.NewMail") then%>CDONTS�������֧��
            <%else%>��֧��CDONTS�������<%end if%></td>
      </tr>
    </table>
	<p>
    <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
	  <tr align="center" bgcolor="#F2FDFF">
        <td class="optiontitle" colspan="4">ϵͳ��Ϣ</td>	
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="100"> ϵͳ���ƣ�</td>
        <td><%=sysConfig%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td > ����汾��</td>
        <td>V1.3</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td> ���°汾��</td>
        <td></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td> ���򿪷���</td>
        <td>stupboy</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td> �ٷ���վ��</td>
        <td></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td> ��Ȩ������</td>
        <td></td>
      </tr>
    </table>
	</td>
  </tr>
</table>
</body>
</html>