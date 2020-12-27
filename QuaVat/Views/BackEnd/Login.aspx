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
				<form action="" method="post">
					<h1>Admin Login</h1>
					<div>
						<input type="text" placeholder="Username" required="" name="username" />
					</div>
					<div>
						<input type="password" placeholder="Password" required="" name="password" />
					</div>
					<div>
						<input type="submit" value="Log in" />
					</div>
				</form><!-- form -->
				<div class="button">
					<a href="#">Training with live project</a>
				</div><!-- button -->
			</section><!-- content -->
		</div><!-- container -->
    </form>
</body>
</html>
