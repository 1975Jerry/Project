<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeadSession.aspx.cs" Inherits="TTWeb.DeadSession" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function onLoad() {
            window.top.location = "http://sqlserver/Task/Default.aspx";
            //window.top.location = "http://TaskTest/Task/Default.aspx";
            //window.top.location = "http://87.203.5.241/Task/Default.aspx";
            //window.top.location = "http://localhost/routeweb/Default.aspx";
        }
    </script>
</head>
<body onload="onLoad()">
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
