<%@ Page Title="" Language="C#" MasterPageFile="~/backEnd.Master" AutoEventWireup="true" CodeBehind="FoodList.aspx.cs" Inherits="QuaVat.Views.BackEnd.Foods.FoodList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_body" runat="server">
	<h2>Post List</h2>
	<div class="block">  
		<table class="data display datatable" id="example">
			<thead>
				<tr>
					<th>No</th>
					<th>Name</th>
					<th>Description</th>
					<th>Amount</th>
					<th>Quantity</th>
					<th>Image</th>
					<th>Category</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<% offset += 1; %>
                <asp:Repeater ID="list" runat="server">
					<ItemTemplate>
					<tr class="odd gradeX">
						<td><%= offset++ %></td>
						<td>
							<%# Eval("food_name") %>
							<br />
							(Discount: <%# (Eval("discount") == null) ? "0 %" : Eval("discount") %>%)
						</td>
						<td style="width: 15%; text-align:justify; padding-left: 0px !important;">
							<%# Eval("description").ToString().Take(80).Aggregate("", (x,y) => x + y) %>...
						</td>
						<td><%# String.Format("{0:#}",Eval("amount")) %>đ</td>
						<td><%# Eval("quantity") %></td>
						<th style="width:10%">
							<br />
							<img src="<%# Eval("image") %>" width="100"/>
						</th>
						<td style="width:10%;"><%# Eval("category_name") %></td>
						<td><a href="FoodEdit.aspx?food_id=<%# Eval("food_id") %>">Edit</a> || <a href="FoodDelete.aspx?food_id=<%# Eval("food_id") %>">Delete</a></td>
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
	<script type="text/javascript">
		$(document).ready(function () {
			setupLeftMenu();

			$('.datatable').dataTable();
			setSidebarHeight();
		});
    </script>
</asp:Content>
