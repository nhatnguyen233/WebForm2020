<%@ Page Title="" Language="C#" MasterPageFile="~/backEnd.Master" AutoEventWireup="true" CodeBehind="CatAdd.aspx.cs" Inherits="QuaVat.Views.BackEnd.Categories.CatAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_body" runat="server">
    <h2>Add New Category</h2>
    <div class="block copyblock">
        <form>
            <table class="form">
                <tr>
                    <td>
                        <input type="text" placeholder="Enter Category Name..." class="medium" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="submit" Value="Save" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="script" runat="server">
</asp:Content>
