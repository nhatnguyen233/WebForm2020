<%@ Page Title="" Language="C#" MasterPageFile="~/backEnd.Master" AutoEventWireup="true" CodeBehind="SliderList.aspx.cs" Inherits="QuaVat.Views.BackEnd.Sliders.SliderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_body" runat="server">
	<h2>Slider List</h2>
	<div class="block">
		<table class="data display datatable" id="example">
			<thead>
				<tr>
					<th>No.</th>
					<th>Slider Title</th>
					<th>Slider Image</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<tr class="odd gradeX">
					<td>01</td>
					<td>Title of Slider</td>
					<td><img src="" height="40px" width="60px" /></td>
					<td>
						<a href="">Edit</a> ||
						<a onclick="return confirm('Are you sure to Delete!');">Delete</a>
					</td>
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
