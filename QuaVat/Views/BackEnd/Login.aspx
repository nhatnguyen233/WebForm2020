<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QuaVat.Views.BackEnd.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="/Assets/admin/css/stylelogin.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
			<section id="content">
				<h1>Admin Login</h1>
				<div>
                    <asp:TextBox ID="Account" runat="server" placeholder="Enter account"></asp:TextBox>
				</div>
				<div>
                    <asp:TextBox ID="Password" runat="server" TextMode="Password" placeholder="Enter password"></asp:TextBox>
				</div>
				<div>
                    <asp:Button ID="LogIn" runat="server" Text="Log In" PostBackUrl="~/Views/BackEnd/Login.aspx" OnClick="LogIn_Click"/>
				</div>
				<div class="button">
					<a href="#">Training with live project</a>
				</div><!-- button -->
			</section><!-- content -->
		</div><!-- container -->
    </form>
</body>
</html>
