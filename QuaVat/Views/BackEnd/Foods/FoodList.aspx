<%@ Page Title="" Language="C#" MasterPageFile="~/backEnd.Master" AutoEventWireup="true" CodeBehind="FoodList.aspx.cs" Inherits="QuaVat.Views.BackEnd.Foods.FoodList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_body" runat="server">
	<h2>Post List</h2>
	<div class="block">  
		<table class="data display datatable" id="example">
			<thead>
				<tr>
					<th>Post Title</th>
					<th>Description</th>
					<th>Category</th>
					<th>Image</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<tr class="odd gradeX">
					<td>Trident</td>
					<td>Internet Explorer 4.0</td>
					<td>Win 95+</td>
					<td class="center"> 4</td>
					<td><a href="">Edit</a> || <a href="">Delete</a></td>
				</tr>
				<tr class="even gradeC">
					<td>Trident</td>
					<td>Internet Explorer 5.0</td>
					<td>Win 95+</td>
					<td class="center">5</td>
					<td><a href="">Edit</a> || <a href="">Delete</a></td>
				</tr>
				<tr class="odd gradeA">
					<td>Trident</td>
					<td>Internet Explorer 5.5</td>
					<td>Win 95+</td>
					<td class="center">5.5</td>
					<td><a href="">Edit</a> || <a href="">Delete</a></td>
				</tr>
				<tr class="even gradeA">
					<td>Trident</td>
					<td>Internet Explorer 6</td>
					<td>Win 98+</td>
					<td class="center">6</td>
					<td><a href="">Edit</a> || <a href="">Delete</a></td>
				</tr>
				<tr class="odd gradeA">
					<td>Trident</td>
					<td>Internet Explorer 7</td>
					<td>Win XP SP2+</td>
					<td class="center">7</td>
					<td><a href="">Edit</a> || <a href="">Delete</a></td>
				</tr>
				<tr class="even gradeA">
					<td>Trident</td>
					<td>AOL browser (AOL desktop)</td>
					<td>Win XP</td>
					<td class="center">6</td>
					<td><a href="">Edit</a> || <a href="">Delete</a></td>
				</tr>
			</tbody>
		</table>
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
