<!--#include file="inc/right.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����ϵͳ</title>
<!--#include file="lib/lib.all.asp"-->
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	background-color: #E6F0F7;
}
.dtree {
	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #0000ff;
	white-space: nowrap;
}
.dtree img {
	border: 0px;
	vertical-align: middle;
}
.dtree a {
	color: #333;
	text-decoration: none;
}
.dtree a.node, .dtree a.nodeSel {
	white-space: nowrap;
	padding: 1px 2px 1px 2px;
}
.dtree a.node:hover, .dtree a.nodeSel:hover {
	color: #0000ff;
}
.dtree a.nodeSel {
	background-color: #AED0F4;
}
.dtree .clip {
	overflow: hidden;
}
-->
</style>
<link href="images/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="images/dtree.js"></script>
</head>
<body>
<table width="96%"  border="0" cellpadding="10" cellspacing="0" align=center >
  <tr>
   <td valign="top" >
   <div class=menu>
    <table width="100%"  border="0" cellpadding="0" cellspacing="0">
     <tr>
      <td height=25><a href="javascript: d.openAll();"><img src="images/view_detailed.gif" width="15" height="15" border="0" align="absmiddle" alt="չ���б�"></a> <a href="javascript: d.closeAll();"><img src="images/view_tree.gif" width="15" height="15" border="0" align="absmiddle" alt="�����б�"></a> |  <a href="main.asp" target="mainFrame">ϵͳ��ҳ</a> | </td>
     </tr>
     <tr>
      <td>
	  <script type="text/javascript">
	  <!--
	  d = new dTree('d');
	  d.config.target="mainFrame";
	  d.add(0,-1,' ��վ���ݹ���');
	  <% if qx("C1",session("Limit")) then %>
	  d.add(1, 0, ' ϵͳ����', '');
      d.add(11, 1, ' �û�����', 'action.asp?dz=a002');
      d.add(12, 1, ' ��վ����', 'SiteConfig.asp'); 
	  <% end if %>
	  d.add(2, 0, ' ��Ʒ����', '');
	  d.add(21, 2, ' ��Ʒ��Ϣ', 'action.asp?dz=a001');
	  d.add(3, 0, ' ������', '');
	  d.add(30, 3, ' ��������', 'action.asp?dz=a003');
	  d.add(31, 3, ' �ͻ���Ϣ�б�', 'Information.asp?action=list');
	  d.add(32, 3, ' ��ӿͻ���Ϣ', 'Information.asp?action=add');
	  d.add(33, 3, ' ��ѯ�ͻ���Ϣ', 'Search.asp');
	  d.add(9, 0, ' ���˹���', '');
	  d.add(91, 9, ' �˳�����', 'logout.asp');		
	  document.write(d);
	  //-->
	  </script>
	  </td>
     </tr>
    </table>
   </div>
   </td>
  </tr>
</table>
</body>
</html>