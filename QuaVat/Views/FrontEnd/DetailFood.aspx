﻿<%@ Page Title="" Language="C#" MasterPageFile="~/frontEnd.Master" AutoEventWireup="true" CodeBehind="DetailFood.aspx.cs" Inherits="QuaVat.Views.FrontEnd.DetailFood" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_body" runat="server">
    <div class="content">
        <asp:HiddenField ID="Food_ID" runat="server" Value="1"/>
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
                        <asp:TextBox ID="SoLuongMua" TextMode="Number" runat="server" min="1" Width="39px" OnInit="SoLuongMua_Init" OnTextChanged="SoLuongMua_TextChanged" OnLoad="SoLuongMua_Load"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="Cart.aspx?food_id=<%= food_id %>&soluong=<%= soluongmua %>&gia=<%= String.Format("{0:#}",amount) %>" class="btn btn-danger">Mua hàng</a>
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