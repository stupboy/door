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
ConnStr="server=.;driver={sql server};database=cha;uid=sa;pwd=!@#$%asdfg"
conn.Open connstr
'������ӳ����򱨴�-

'-Oracle���ݿ�-
'if IsObject(Conn1) then 
'Conn1.close
'set conn1=nothing
'end if 

If Not IsObject(Conn1) Then
Set Conn1 = Server.CreateObject("ADODB.Connection")
myDSN = "Provider=OraOLEDB.Oracle;Data Source=242;User ID=neands3;PASSWORD=abc123;Persist Security Info=True"
Conn1.Open myDSN
End If


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
