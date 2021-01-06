<%@ Page Title="" Language="C#" MasterPageFile="~/frontEnd.Master" AutoEventWireup="true" CodeBehind="DetailFood.aspx.cs" Inherits="QuaVat.Views.FrontEnd.DetailFood" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_body" runat="server">
    <div class="content">
        <table class="w-100">
            <tr>
                <td rowspan="4" class="khunganh">
                    <img class="bannerIMG" src="<%= img %>" />&nbsp;
                </td>
                <td>
                    <h1><%= name %></h1>
                </td>
            </tr>
            <tr>
                <td style="font-weight: 400">
                    Số lượng: <%= quantity %>
                    <br />
                    ID: <asp:TextBox ID="FoodID" runat="server" OnLoad="FoodID_Load" Width="50px" ReadOnly></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <span class="price"><%= String.Format("{0:#}",amount) %>đ</span>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                </td>
            </tr>
            <tr>
                <td>
                    <strong class="fleft text2">Thêm vào giỏ hàng:
                        <asp:TextBox ID="SoLuongMua" TextMode="Number" runat="server" min="1" Width="39px" OnInit="SoLuongMua_Init">1</asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" Text="Mua hàng" class="btn btn-danger" PostBackUrl="~/Views/FrontEnd/Cart.aspx" OnClick="Button1_Click"/>
                    </strong>
                </td>
            </tr>
            <tr>
                <td style="font-weight: bold; font-size: 18px;">Thông tin chi tiết:</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: justify;">
                    <%= desc %>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
