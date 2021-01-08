<%@ Page Title="" Language="C#" MasterPageFile="~/frontEnd.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="QuaVat.Views.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_body" runat="server">
    <div class="owl-carousel carousel1">
      
          <img src="/imgs/banner1.png" alt="Mít nghệ" title="Mít nghệ" width="100" />
     
      
          <img src="/imgs/banner2.png" alt="Bánh bột lọc" title="Bánh bột lọc" width="100" />
     
      
          <img src="/imgs/banner3.png" alt="Thịt xiên nướng" title="Thịt xiên nướng" width="100" />
      
      
          <img src="/imgs/banner4.png" alt="Bánh rán mặn" title="Bánh rán mặn"  width="100" />
      
    </div>
    <div class="owl-carousel carousel2">
        <asp:Repeater ID="list1" runat="server">
        <ItemTemplate>
            <div class="hightlight-item">
                <div class="image-hightlight--item">
                    <a href="<%# "FrontEnd/DetailFood.aspx?food_id=" + Eval("food_id").ToString() %>">
                        <img src="<%# Eval("image") %>" alt="<%# Eval("food_name") %>" title="<%# Eval("food_name") %>" width="100" />
                    </a>
                </div>
                <h3 class="item-name font-weight-bold">
                    <a href="<%# "FrontEnd/DetailFood.aspx?food_id=" + Eval("food_id").ToString() %>" style="color: black; text-decoration: none;">
                        <%# Eval("food_name") %>
                    </a>
                </h3>
                <hr />
                <div class="price-top">
                    <h3 class="font-weight-bold text-danger"><%# String.Format("{0:#}",Eval("amount")) %>Đ</h3>
                    <a href="<%# "FrontEnd/DetailFood.aspx?food_id=" + Eval("food_id").ToString() %>" class="btn btn-success text-white">Chi tiết</a>
                </div>
            </div>
        </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="list-food">
        <div class="list-food--item">
            <div class="card-food--title">
                <h3>MÓN ĂN VẶT</h3>
            </div>
            <div class="card-food--body">
                <div class="row">
                    <asp:Repeater ID="list2" runat="server">
                    <ItemTemplate>
                    <div class="col-md-3">
                        <div class="food-item">
                            <div class="image-food--item">
                                <a href="<%# "FrontEnd/DetailFood.aspx?food_id=" + Eval("food_id").ToString() %>">
                                    <img src="<%# Eval("image") %>" alt="<%# Eval("food_name") %>" title="<%# Eval("food_name") %>" width="100" />
                                </a>
                            </div>
                            <h3 class="item-name font-weight-bold">
                                <a href="<%# "FrontEnd/DetailFood.aspx?food_id=" + Eval("food_id").ToString() %>" style="color: black; text-decoration: none;">
                                    <%# Eval("food_name") %>
                                </a>
                            </h3>
                            <hr />
                            <div class="price-top">
                                 <h3 class="font-weight-bold text-danger"><%# String.Format("{0:#}",Eval("amount")) %>Đ</h3>
                                <a href="<%# "FrontEnd/DetailFood.aspx?food_id=" + Eval("food_id").ToString() %>" class="btn btn-danger text-white">Chi tiết</a>
                            </div>
                        </div>
                    </div> 
                    </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <div class="list-food--item">
            <div class="card-food--title">
                <h3>CHÈ</h3>
            </div>
            <div class="card-food--body">
                <div class="row">
                    <asp:Repeater ID="list3" runat="server">
                    <ItemTemplate>
                    <div class="col-md-3">
                        <div class="food-item">
                            <div class="image-food--item">
                                <a href="<%# "FrontEnd/DetailFood.aspx?food_id=" + Eval("food_id").ToString() %>">
                                    <img src="<%# Eval("image") %>" alt="<%# Eval("food_name") %>" title="<%# Eval("food_name") %>" width="100%" />
                                </a>
                            </div>
                            <h3 class="item-name font-weight-bold">
                                <a href="<%# "FrontEnd/DetailFood.aspx?food_id=" + Eval("food_id").ToString() %>" style="color: black; text-decoration: none;">
                                    <%# Eval("food_name") %>
                                </a>
                            </h3>
                            <hr />
                            <div class="price-top">
                                 <h3 class="font-weight-bold text-danger"><%# String.Format("{0:#}",Eval("amount")) %>Đ</h3>
                                <a href="<%# "FrontEnd/DetailFood.aspx?food_id=" + Eval("food_id").ToString() %>" class="btn btn-danger text-white">Chi tiết</a>
                            </div>
                        </div>
                    </div> 
                    </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $(".carousel1").owlCarousel({
                items: 1,
                loop: true,
                autoplay: true,          
                autoplayTimeout: 3000,
                autoplayHoverPause: true
            });
            $(".carousel2").owlCarousel({
                loop: true,
                autoplay: true,
                autoplayTimeout: 3000,
                margin: 10,
                autoplayHoverPause: true,
                responsive: {
                    0: {
                        items: 1,
                    },
                    600: {
                        items: 2,
                    },
                    1000: {
                        items: 4,
                    }
                }
            });
        });
    </script>
</asp:Content>
