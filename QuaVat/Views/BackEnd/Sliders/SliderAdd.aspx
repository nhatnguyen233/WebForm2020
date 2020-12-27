<%@ Page Title="" Language="C#" MasterPageFile="~/backEnd.Master" AutoEventWireup="true" CodeBehind="SliderAdd.aspx.cs" Inherits="QuaVat.Views.BackEnd.Sliders.SliderAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_body" runat="server">
    <h2>Add New Slider</h2>
    <div class="block">
        <form action="addslider.php" method="post" enctype="multipart/form-data">
            <table class="form">
                <tr>
                    <td>
                        <label>Title</label>
                    </td>
                    <td>
                        <input type="text" name="title" placeholder="Enter Slider Title..." class="medium" />
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Upload Image</label>
                    </td>
                    <td>
                        <input type="file" name="image" />
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
