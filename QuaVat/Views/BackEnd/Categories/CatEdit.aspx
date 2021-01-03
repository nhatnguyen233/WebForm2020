<%@ Page Title="" Language="C#" MasterPageFile="~/backEnd.Master" AutoEventWireup="true" CodeBehind="CatEdit.aspx.cs" Inherits="QuaVat.Views.BackEnd.Categories.CatEdit" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="style" runat="server">
    <!-- Load Toastr Alert CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="script" runat="server">
    <!-- Load Toastr Alert JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" type="text/javascript"></script>
     <!-- Load TinyMCE -->
    <script src="https://cdn.tiny.cloud/1/snb2ihsmx7u8rowe7d4wve91u3h2zsudw988vzymn1m2yfs3/tinymce/5/tinymce.min.js" type="text/javascript"></script>
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
<asp:Content ID="Content3" ContentPlaceHolderID="main_body" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QuaVatVietConnectionString %>" SelectCommand="SELECT [category_id], [category_name] FROM [categories]"></asp:SqlDataSource>
    <h2>Update Category</h2>
    <div class="block copyblock">
        <table class="form">
            <tr>
                <td>
                    <label>Category Name: &nbsp;</label>
                </td>
                <td>
                    <asp:TextBox ID="CatName" runat="server" name="CatName" class="medium" 
                        placeholder="Enter Category Name..." OnInit="CatName_Init" OnTextChanged="CatName_TextChanged">
                    </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Parent Category: &nbsp;</label>
                </td>
                <td>
                    <asp:DropDownList ID="ParentID" runat="server" name="ParentID" DataSourceID="SqlDataSource1" DataTextField="category_name" DataValueField="category_id" OnInit="ParentID_Init" OnSelectedIndexChanged="ParentID_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Description: &nbsp;</label>
                </td>
                <td>
                    <asp:TextBox ID="Desc" class="tinymce" runat="server" TextMode="multiline" Columns="50" Rows="5" OnInit="Desc_Init" OnTextChanged="Desc_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th colspan="2">
                    <asp:Button ID="Back" runat="server" Text="Back" PostBackUrl="~/Views/BackEnd/Categories/CatList.aspx" />
                    <asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" />
                </th>
            </tr>
        </table>
    </div>
</asp:Content>
