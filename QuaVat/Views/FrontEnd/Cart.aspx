<%@ Page Title="" Language="C#" MasterPageFile="~/frontEnd.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="QuaVat.Views.FrontEnd.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_body" runat="server">
    <script runat="server">
        private int tong = 0;
    </script>
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
            <asp:Repeater ID="list" runat="server">
			    <ItemTemplate>
                 <tr>
                    <td style="width: 30%">
                        <img src="<%# Eval("image") %>" alt="<%# Eval("food_name") %>"  width="100">
                    </td>
                    <td style="width: 20%"><%# Eval("food_name") %></td>
                    <td class="font-weight-bold" style="width: 15%"><%# String.Format("{0:#}",Eval("amount")) %>đ</td>
                    <td>
                        <input type="number" min="1" value="<%# Eval("quantity") %>" style="width: 70px"/>
                    </td>
                    <td class="font-weight-bold" style="width: 15%"><%# String.Format("{0:#}",Eval("price")) %>đ</td>
                    <td style="width: 15%">
                        <a class="btn btn-secondary" href='Cart.aspx?food_id=<%# Eval("food_id") %>&session_id=<%# Eval("session_id") %>&delete=1'>Xóa</a>
                    </td>
                </tr>
                </ItemTemplate>
			</asp:Repeater>
        </tbody>
        <tfoot>
            <tr class="text-center">
                <td colspan="4">&nbsp;</td>
                <td style="font-weight: 600;">Tổng số: </td>
                <td class="text-danger">24000đ</td>
            </tr>
        </tfoot>
    </table>
    <div class="foot-button">
        <a href="/Views/Home.aspx" class="item back-to-shopping btn btn-success text-white">Quay lại mua hàng</a>
        <a class="item update-to-cart btn btn-danger text-white">Cập nhật lại</a>
        <a class="item checkout btn btn-danger text-white">Thanh toán</a>
    </div>
</asp:Content>
