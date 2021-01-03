<%@ Page Title="" Language="C#" MasterPageFile="~/backEnd.Master" AutoEventWireup="true" CodeBehind="FoodAdd.aspx.cs" Inherits="QuaVat.Views.BackEnd.Foods.FoodAdd" ValidateRequest="false" %>

<asp:Content ID="Content3" ContentPlaceHolderID="style" runat="server">
    <!-- Load Toastr Alert CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" rel="stylesheet" type="text/css"/>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="main_body" runat="server">
    <h2>Add New Food</h2>
    <div class="block">               
        <table class="form">    
            <tr>
                <td>
                    <label>Name</label>
                </td>
                <td>
                    <asp:TextBox ID="FoodName" runat="server" class="medium" placeholder="Enter Food Name..."></asp:TextBox>
                </td>
            </tr>
		    <tr>
                <td>
                    <label>Category</label>
                </td>
                <td>
                    <asp:DropDownList ID="CatList" runat="server" DataSourceID="SqlDataSource1" DataTextField="category_name" DataValueField="category_id"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QuaVatVietConnectionString %>" SelectCommand="SELECT [category_id], [category_name] FROM [categories]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Quantity</label>
                </td>
                <td>
                    <asp:TextBox ID="Quantity" runat="server" class="small" TextMode="Number"></asp:TextBox>
                </td>
            </tr>
		    <tr>
                <td style="vertical-align: top; padding-top: 9px;">
                    <label>Description</label>
                </td>
                <td>
                    <asp:TextBox ID="Description" class="tinymce" runat="server" TextMode="multiline" Columns="50" Rows="5"></asp:TextBox>
                </td>
            </tr>
		    <tr>
                <td>
                    <label>Amount</label>
                </td>
                <td>
                    <asp:TextBox ID="Amount" runat="server" placeholder="Enter Amount" class="small"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <label>Discount</label>
                </td>
                <td>
                    <asp:TextBox ID="Discount" runat="server" placeholder="Enter Discount" class="small"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Upload Image</label>
                </td>
                <td>
                    <asp:FileUpload ID="Img" runat="server" />
                </td>
            </tr>
		    <tr>
                <td></td>
                <td>
                    <asp:Button ID="Cancel" runat="server" Text="Cancel" />
                    <asp:Button ID="Save" runat="server" Text="Save" PostBackUrl="~/Views/BackEnd/Foods/FoodAdd.aspx" OnClick="Save_Click"/>
                </td>
            </tr>
        </table>
    </div>
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
