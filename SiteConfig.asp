<%
on error resume next
if err then
err.clear
end if
%>
<!--#include file="inc/right.asp"--> 
<!--#include file="inc/conn.asp"-->
<!--#include file="inc/config.asp"-->
<%
dim ObjInstalled,Action,FoundErr,ErrMsg
ObjInstalled=IsObjInstalled("Scripting.FileSystemObject")
Action=trim(request("Action"))
if Action="" then
   Action="ShowInfo"
end if
%>
<html>
<head>
<title><%=sysConfig%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/main.css" rel="stylesheet" type="text/css">
<script LANGUAGE="JavaScript">
function check()
{
  if (document.form.SiteName.value=="")
     {
      alert("����д��ѡͶƱ���ƣ�")
      document.form.SiteName.focus()
      document.form.SiteName.select()
      return
     }
 
  if (document.form.Description.value=="")
     {
      alert("����д��ѡ����������")
      document.form.Description.focus()
      document.form.Description.select()
      return
     }
 
  if (document.form.Copyright.value=="")
     {
      alert("����д��ѡ��Ȩ��Ϣ��")
      document.form.Copyright.focus()
      document.form.Copyright.select()
      return
     }
	 
     document.form.submit()
}
</script>
</head>
<body>
<%
if Action="SaveConfig" then
	call SaveConfig()
	Response.Redirect "SiteConfig.asp" 
else
	call ShowConfig()
end if
if FoundErr=true then
	call WriteErrMsg()
end if
sub ShowConfig()
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr valign="top">
    <td bgcolor="#FFFFFF"><br>
     <form method="POST" action="SiteConfig.asp" id="form" name="form">
      <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
		<tr align="center" bgcolor="#F2FDFF">
          <td width="100%" class="optiontitle" colspan="2">��ѡ��Ϣ����</td>	
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF">վ�����ƣ�</td>
          <td bgcolor="#FFFFFF"><input name="SiteName" type="text" id="SiteName" value="<%=SiteName%>" size="40" maxlength="50"></td>
        </tr>
        <tr> 
         <td align="right" bgcolor="#FFFFFF">��Ȩ��Ϣ��</td>
         <td bgcolor="#FFFFFF"><textarea name="Copyright" cols="60" rows="3" id="Copyright"><%=Copyright%></textarea></td>
        </tr>
        <tr> 
         <td colspan="2" align="center" bgcolor="#FFFFFF"> <input name="Action" type="hidden" id="Action" value="SaveConfig"> 
<input name="cmdSave" type="submit" id="cmdSave" value=" �������� " <% If ObjInstalled=false Then response.write "disabled" %>></td>
       </tr>
<%
If ObjInstalled=false Then
	Response.Write "<tr><td height='40' colspan='3'><b><font color=red>��ķ�������֧�� FSO(Scripting.FileSystemObject)! ����ʹ�ñ����ܡ�<br>��ֱ���޸ġ�Inc/config.asp���ļ��е����ݡ�</font></b></td></tr>"
End If
%>
      </table>
<%
end sub
%>
</form>
    </td>
  </tr>
</table>
</body>
</HTML>
<%
 Function InPutStr(Input)'�����ݿ��б����ַ���ʱ�� 
     IF IsEmpty(Input) Then Input="" 
     IF IsNull(Input) Then Input="" 
     IF instr(input,chr(34))>0 Then input=replace(input,chr(34),chr(39))'��"�滻��',�Ա��������ݿ����� 
     InPutStr=input 
End function 
sub SaveConfig()
	If ObjInstalled=false Then
		FoundErr=true
		ErrMsg=ErrMsg & "<br><li>��ķ�������֧�� FSO(Scripting.FileSystemObject)! </li>"
		exit sub
	end if
	dim fso,hf
	set fso=Server.CreateObject("Scripting.FileSystemObject")
	set hf=fso.CreateTextFile(Server.mappath("inc/config.asp"),true)
	hf.write "<" & "%" & vbcrlf
	hf.write "Const SiteName=" & chr(34) & trim(request("SiteName")) & chr(34) & "              '����" & vbcrlf
	hf.write "Const Copyright=" & chr(34) & InPutStr(trim(request("Copyright"))) & chr(34) & "  '��Ȩ��Ϣ" & vbcrlf
	hf.write "%" & ">"
	hf.close
	set hf=nothing
	set fso=nothing	
end sub
%>