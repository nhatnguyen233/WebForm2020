<%@ Page Title="" Language="C#" MasterPageFile="~/backEnd.Master" AutoEventWireup="true" CodeBehind="CatAdd.aspx.cs" Inherits="QuaVat.Views.BackEnd.Categories.CatAdd" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_body" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QuaVatVietConnectionString %>" SelectCommand="SELECT [category_name], [category_id] FROM [categories]"></asp:SqlDataSource>
    <h2>Add New Category</h2>
    <div class="block copyblock">
        <table class="form">
            <tr>
                <td>
                    <label>Category Name: &nbsp;</label>
                </td>
                <td>
                    <asp:TextBox ID="CatName" runat="server" name="CatName" class="medium" placeholder="Enter Category Name..."></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Parent Category: &nbsp;</label>
                </td>
                <td>
                    <asp:DropDownList ID="ParentID" runat="server" name="ParentID" DataSourceID="SqlDataSource1" DataTextField="category_name" DataValueField="category_id">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Description: &nbsp;</label>
                </td>
                <td>
                    <asp:TextBox ID="Description" class="tinymce" runat="server" TextMode="multiline" Columns="50" Rows="5"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th colspan="2">
                    <asp:Button ID="Save" runat="server" Text="Save" PostBackUrl="~/Views/BackEnd/Categories/CatAdd.aspx" OnClick="Save_Click"/>
                </th>
            </tr>
        </table>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="script" runat="server">
     <!-- Load TinyMCE -->
    <script src="https://cdn.tiny.cloud/1/snb2ihsmx7u8rowe7d4wve91u3h2zsudw988vzymn1m2yfs3/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
        tinymce.init({
            selector: '.tinymce'
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            setupTinyMCE();
            setDatePicker('date-picker');
            $('input[type="checkbox"]').fancybutton();
            $('input[type="radio"]').fancybutton();
        });
    </script>
    <!-- Load TinyMCE -->
</asp:Content>
