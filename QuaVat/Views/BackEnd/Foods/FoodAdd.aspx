<%@ Page Title="" Language="C#" MasterPageFile="~/backEnd.Master" AutoEventWireup="true" CodeBehind="FoodAdd.aspx.cs" Inherits="QuaVat.Views.BackEnd.Foods.FoodAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main_body" runat="server">
    <h2>Add New Food</h2>
    <div class="block">               
        <form action="" method="post" enctype="multipart/form-data">
        <table class="form">    
            <tr>
                <td>
                    <label>Name</label>
                </td>
                <td>
                    <input type="text" placeholder="Enter Product Name..." class="medium" />
                </td>
            </tr>
		    <tr>
                <td>
                    <label>Category</label>
                </td>
                <td>
                    <select id="select" name="select">
                        <option>Select Category</option>
                        <option value="1">Category One</option>
                        <option value="2">Category Two</option>
                        <option value="3">Category Three</option>
                    </select>
                </td>
            </tr>
		    <tr>
                <td>
                    <label>Brand</label>
                </td>
                <td>
                    <select id="select" name="select">
                        <option>Select Brand</option>
                        <option value="1">Brand One</option>
                        <option value="2">Brand Two</option>
                        <option value="3">Brand Three</option>
                    </select>
                </td>
            </tr>
		    <tr>
                <td style="vertical-align: top; padding-top: 9px;">
                    <label>Description</label>
                </td>
                <td>
                    <textarea class="tinymce"></textarea>
                </td>
            </tr>
		    <tr>
                <td>
                    <label>Price</label>
                </td>
                <td>
                    <input type="text" placeholder="Enter Price..." class="medium" />
                </td>
            </tr>
            
            <tr>
                <td>
                    <label>Upload Image</label>
                </td>
                <td>
                    <input type="file" />
                </td>
            </tr>
				
		    <tr>
                <td>
                    <label>Product Type</label>
                </td>
                <td>
                    <select id="select" name="select">
                        <option>Select Type</option>
                        <option value="1">Featured</option>
                        <option value="2">Non-Featured</option>
                    </select>
                </td>
            </tr>

		    <tr>
                <td></td>
                <td>
                    <input type="submit" name="submit" Value="Save" />
                </td>
            </tr>
        </table>
        </form>
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
