<%@ Page Title="" Language="C#" MasterPageFile="~/frontEnd.Master" AutoEventWireup="true" CodeBehind="FoodList.aspx.cs" Inherits="QuaVat.Views.FrontEnd.FoodList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_body" runat="server">
    <style>
        .food-name--item {
            font-size: 17px;
            text-decoration: none;
            line-height: 20px;
            font-weight: normal;
            font-family: 'Oswald',sans-serif;
            color: #eb8806;
            outline: none;
        }

        .price-column {
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
            line-height: 35px;
        }

        .price-column .amount-item {
            color: #e4241d;
            line-height: 25px;
            font-family: 'Oswald',sans-serif;
        }

        .price-column .button-buy {
            width: 85px;
            height: auto;
            background-color: #EB0404;
            color: white;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }

        #main_body_list_CheckBuy_0 {
            margin-left: 3px;
        }
    </style>
    <div class="row data-food-list">
        <div class="data-list col-md-9">
            <asp:Repeater ID="list" runat="server" >
                <HeaderTemplate>
                    <div class="table-responsive" style="background: white">
                        <table class="table table-head-custom table-vertical-center" id="kt_advance_table_widget_4">
                            <thead>
                            <tr class="text-left">
                                <th style="width: 30%">Hình ảnh</th>
                                <th style="width: 50%">Tên</th>
                                <th>Giá</th>
                            </tr>
                            </thead>
                            <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <a href="<%# "DetailFood.aspx?food_id=" + Eval("food_id").ToString() %>">
                                <img src=" <%# Eval("image") %>" alt="<%# Eval("food_name") %>" title="<%# Eval("food_name") %>" width="100%" />
                            </a>
                        </td>
                        <td>
                            <a href="<%# "DetailFood.aspx?food_id=" + Eval("food_id").ToString() %>" class="food-name--item">
                                <%# Eval("food_name") %>
                            </a>
                            <br />
                            <div style="text-align: justify"><%# Eval("description") %></div>
                        </td>
                        <td>
                            <div class="price-column">
                                <div class="amount-item"><%# String.Format("{0:#}",Eval("amount")) %> đ</div>
                                <div>
                                    <asp:CheckBox ID="CheckBuy" runat="server" TextAlign="Left" Text="Chọn mua: " />
                                </div>
                                <div>
                                    <asp:Button ID="Button1" runat="server" Text="Mua hàng"  class="button-buy"/>
                                </div>
                            </div>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                            </tbody>
                        </table>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </div>
        <div class="data-list col-md-3">
            <div class="food-item">
                <div class="image-food--item">
                    <img src="/imgs/banner4.png" alt="Bánh rán mặn" title="Bánh rán mặn"  width="100%" />
                </div>
                <p class="item-name font-weight-bold">Bánh rán mặn</p>
                <div class="price-top">
                    <h3>25000Đ</h3>
                </div>
            </div>
            <h3 class="mt-3 text-white">THÔNG TIN</h3>
            <div class="food-item">
                <a href="#" class="item-name font-weight-bold text-white">Side map</a>
                <br />
                <a href="#" class="item-name font-weight-bold text-white">Liên hệ</a>
                <br />
                <a href="#" class="item-name font-weight-bold text-white">Phí giao hàng</a>
            </div>
        </div>
    </div>
</asp:Content>
