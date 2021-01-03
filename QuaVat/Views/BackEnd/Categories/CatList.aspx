<%@ Page Title="" Language="C#" MasterPageFile="~/backEnd.Master" AutoEventWireup="true" CodeBehind="CatList.aspx.cs" Inherits="QuaVat.Views.BackEnd.Categories.CatList" %>
<asp:Content ID="Content3" ContentPlaceHolderID="style" runat="server">
	<!-- Load Toastr Alert CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="main_body" runat="server">
	<style>
		th {
			text-align: center;
		}
	</style>
    <h2>Category List</h2>
	<div class="block">
		<table class="data display datatable" id="example">
			<thead>
				<tr>
					<th>No.</th>
					<th>Cat ID</th>
					<th>Category Name</th>
					<th>Desciption</th>
					<th>Parent ID</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<% offset += 1; %>
                <asp:Repeater ID="list" runat="server">
					<ItemTemplate>
					<tr class="odd gradeX">
						<td style="font-weight:700;"><%= offset++ %></td>
						<td><%# Eval("category_id") %></td>
						<td><%# Eval("category_name") %></td>
						<td style="width: 30%; text-align:justify;"><%# Eval("description") %></td>
						<td style="text-align: center;"><%# Eval("parent_id") %></td>
						<td><a href="CatEdit.aspx?cat_id=<%# Eval("category_id") %>">Edit</a> || <a href="CatDelete.aspx?cat_id=<%# Eval("category_id") %>">Delete</a></td>
					</tr>
					</ItemTemplate>
				</asp:Repeater>
			</tbody>
		</table>
		<div class="pagination" style="
				margin-top: 1em;
				float: right;
				margin-right: 5%;
			">
			<% for (int i=1; i<=totalPages; i++) {%>
				<a class="btn btn-small" href="?page=<%= i %>&per_page=10"><%= i %></a>
			<% } %>
		</div>
	</div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="script" runat="server">
	 <!-- Load Toastr Alert JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" type="text/javascript"></script>
    <script type="text/javascript">
		$(document).ready(function () {
			setupLeftMenu();

			$('.datatable').dataTable();
			setSidebarHeight();
		});
	</script>
</asp:Content>
