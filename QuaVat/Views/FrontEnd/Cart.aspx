<%@ Page Title="" Language="C#" MasterPageFile="~/frontEnd.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="QuaVat.Views.FrontEnd.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_body" runat="server">
    <style>
        .foot-button {
            float: right;
        }
        .foot-button .item {
            margin-top: 10px;
            margin-right: 20px;
        }

        table tr td {
            border-bottom: 0.1px solid #808080;
        }
    </style>
    <table class="w-100" style="background: white; color: #4d5255;">
        <thead style="background-color: #eaeaea;">
            <tr class="text-center">
                <th>Hình ảnh</th>
                <th>Tên sản phẩm</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Thành tiền</th>
                <th>Xóa</th>
            </tr>
        </thead>
        <tbody class="text-center">
             <tr>
                <td style="width: 30%">
                    <img src="../../imgs/banner1.png" alt="Sinh tố bơ"  width="100">
                </td>
                <td style="width: 20%">Sinh tố bơ</td>
                <td class="font-weight-bold" style="width: 15%">30000đ</td>
                <td>
                    <input type="number" min="1" style="width: 70px"/>
                </td>
                <td class="font-weight-bold" style="width: 15%">30000đ</td>
                <td style="width: 15%">
                    <asp:Button ID="DeleteButton"  class="btn btn-secondary" runat="server" Text="Xóa" />
                </td>
            </tr>
            <tr>
                <td style="width: 30%">
                    <img src="../../imgs/banner1.png" alt="Sinh tố bơ"  width="100">
                </td>
                <td style="width: 20%">Sinh tố bơ</td>
                <td class="font-weight-bold" style="width: 15%">30000đ</td>
                <td>
                    <input type="number" min="1" style="width: 70px"/>
                </td>
                <td class="font-weight-bold" style="width: 15%">30000đ</td>
                <td style="width: 15%">
                    <asp:Button ID="Button1"  class="btn btn-secondary" runat="server" Text="Xóa" />
                </td>
            </tr>
        </tbody>
        <tfoot>
            <tr class="text-center">
                <td colspan="4">&nbsp;</td>
                <td style="font-weight: 600;">Tổng số: </td>
                <td class="text-danger">30000đ</td>
            </tr>
        </tfoot>
    </table>
    <div class="foot-button">
        <button class="item back-to-shopping btn btn-success">Quay lại mua hàng</button>
        <button class="item update-to-cart btn btn-danger">Cập nhật lại</button>
        <button class="item checkout btn btn-danger">Thanh toán</button>
    </div>
</asp:Content>
