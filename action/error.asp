<!--#include file="../inc/right.asp"--> 
<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/md5.asp"-->
<!--#include file="../lib/lib.all.asp"-->
<html>
<head>
<title><%=sysConfig%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../images/main.css" rel="stylesheet" type="text/css">
<script language="Javascript">
function check()
{

  if (document.add.Username.value=="")
     {
      alert("�������ʻ�����")
      document.add.Username.focus()
      document.add.Username.select()
      return
     }
  if (document.add.RealName.value=="")
     {
      alert("������������")
      document.add.RealName.focus()
      document.add.RealName.select()
      return
     }
  if (document.add.Password1.value=="")
     {
      alert("�������������룡")
      document.add.Password1.focus()
      document.add.Password1.select()		
      return
     }
  if (document.add.Password1.value.length<6)
     {
      alert("����д����Ա����(�ַ�����6-16λ֮��)��")
      document.add.Password1.focus()
      document.add.Password1.select()		
      return
     }
  if (document.add.Password1.value.length>16)
     {
      alert("����д����Ա����(�ַ�����6-16λ֮��)��")
      document.add.Password1.focus()
      document.add.Password1.select()		
      return
     }
  if (document.add.Password1.value!=document.add.Password2.value)
     {
      alert("��������������벻��ͬ��")
      document.add.Password2.focus()
      document.add.Password2.select()		
      return
     }
     document.add.submit()
}
</script>
</head>
<body>
��Ȩ�ޣ�
</body>
</html>