<%
'session.timeout=6000-
'Server.ScriptTimeOut=2000-

'dim conn,rs,sysConfig,db-
'db="/data/Xiao5u.mdb" '���ݿ��ļ�λ��-
'set conn=server.createobject("adodb.connection")-
'conn.open "driver={Microsoft Access Driver (*.mdb)};pwd=xiao5u;dbq=" &Server.MapPath(""&db&"")-

'Set rs = Server.CreateObject("ADODB.Recordset")-
'���ݿ������ļ�-
set conn=server.CreateObject("adodb.connection")
'��.��Ϊ��������ַ��STΪ�������ݿ����ơ�saΪ���ݿ��û�����PWDΪ���ݿ�����-
ConnStr="server=113.10.138.110;driver={sql server};database=cha;uid=sa;pwd=!@#$%asdfg"
conn.Open connstr
'������ӳ����򱨴�-
If Err Then
  err.Clear
  Set Conn = Nothing
  Response.Write "���ݿ����ӳ�������Conn.asp�ļ��е����ݿ�������á�"
  response.Write connstr
  Response.End
End If
'�Զ��庯���ر����ݿ�����-
sub CloseConn()
 On Error Resume Next
 If IsObject(Conn) Then
  conn.close
  set conn=nothing
 end if
end Sub

%>
