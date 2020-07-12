<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="Clothing_Store.TrangChu" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 262px;
            height: 320px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <div class="content">
        <div class="left">
    <div class="tieudetrai">
        DANH MỤC SẢN PHẨM
    </div>
    <div class="danhmuc">
        <ul class="side-menu" data-side-menu="data-side-menu">
            <asp:Repeater ID="remenu" runat="server">
                <ItemTemplate>
                     <li>
                         <asp:LinkButton ID="lbndamlien" runat="server" Text='<%# Bind("TenNhomHang")%>' CommandArgument='<%# Eval("id") %>'></asp:LinkButton>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>

    </div>
</div>
        <div class="wap_slider">
            <div class="container">
                <div class="col-md-3 col-xs-3 col-sm-3">
                   <div class="backtop"> <a class="btn-top" href="javascript:void(0);" title="Top" style="display: inline;"></a> </div>
                </div>
                <div class="col-sm-9 col-xs-9 col-md-9">

                    <div class="slideshow">
                        <section class="regular slider">
                            <asp:Repeater ID="rptQuangCao" runat="server" OnItemCommand="rptQuangCao_ItemCommand">
                                <ItemTemplate>
                                    <div>
                                        <asp:ImageButton ID="ImageButton2" Width="100%" Height="315px" runat="server" ImageUrl='<%# Bind("urlImage")%>' CommandArgument='<%# Bind("id")%>'></asp:ImageButton>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </section>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix">
        </div>
        <div class="main">
            <div class="col-md-12 col-xs-12 col-sm-12">
                <div class="container">
                    <h2 class="tieudegiua">
                        <span class="title-content">ÁO Sơ mi nam</span>
                        <asp:LinkButton ID="lbtnMuatiep" runat="server" class="style_link" >(Xem thêm...)</asp:LinkButton>
                    </h2>
                    <div class="clearfix"></div>
                </div>
                <div class="container">
                    <div style="margin-left: 60px;">
                        <asp:DataList ID="dtlaokhoac" runat="server" RepeatColumns="3" OnItemCommand="dtlaokhoac_ItemCommand">
                            <ItemTemplate>
                                <div style="width: 100%;" class="prod">
                                    <div class="item" style="margin: 10px;">
                                        <a href="#">
                                            <asp:ImageButton ID="ImageButton1" Style="width: 100%" ImageUrl='<%# Bind("image")%>' runat="server" CommandName="myCommand" />

                                        </a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <h3 class="item_text">
                                    <asp:HyperLink ID="hpltensp" runat="server" Text='<%# Eval("TenHang").ToString().Length<=26?Eval("TenHang"):Eval("TenHang").ToString().Substring(0,26)+"..." %>' Style="display: block; width: 100%; text-align: center;"></asp:HyperLink>
                                </h3>
                                        <p>
                                            <div>
                                                <strong><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaMoi").ToString()))  %></strong>
                                            </div>
                                            <div style="text-decoration: line-through; margin-top: 10px"><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaCu").ToString()))  %></div>
                                            <asp:LinkButton ID="LinkButton1" class="discount" CommandName="myCommand" runat="server" CommandArgument='<%# Eval("id") %>' >Xem chi tiết</asp:LinkButton>
                                        </p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </div>
            </div>
            <div class="container">
                <h2 class="tieudegiua" style="margin-top: 30px">
                    <span class="title-content" style="margin-top:10px">Áo khoác</span>
                    <asp:LinkButton ID="lbtnchitietvdsb" runat="server" class="style_link">(Xem thêm...)</asp:LinkButton>
                </h2>

                <div class="clearfix"></div>
            </div>
            <div class="container">
                <div style="margin-left: 60px;">
                    <asp:DataList ID="dtlvaydamvasetbo" runat="server" RepeatColumns="3" OnItemCommand="dtlvaydamvasetbo_ItemCommand" OnSelectedIndexChanged="dtlvaydamvasetbo_SelectedIndexChanged">
                        <ItemTemplate>
                            <div style="width: 100%;">
                                <div class="item" style="margin: 10px;">
                                    <a href="#">

                                        <asp:ImageButton ID="ImageButton1" Style="width: 100%" ImageUrl='<%# Bind("image")%>' runat="server" CommandName="myCommand" />
                                        <%--<asp:Image ID="Image1" runat="server" imageurl='<%# Bind("image")%>' />--%>
                                      
                                    </a>

                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <h3 class="item_text">
                                    <asp:HyperLink ID="hpltensp" runat="server" Text='<%# Eval("TenHang").ToString().Length<=26?Eval("TenHang"):Eval("TenHang").ToString().Substring(0,26)+"..." %>' Style="display: block; width: 100%; text-align: center;"></asp:HyperLink>

                                </h3>
                                    <p>
                                        <div><strong><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaMoi").ToString()))  %></strong></div>
                                        <div style="text-decoration: line-through; margin-top: 10px"><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaCu").ToString()))  %></div>
                                        <asp:LinkButton ID="LinkButton1" class="discount" CommandName="myCommand" runat="server" CommandArgument='<%# Eval("id") %>' >Xem chi tiết</asp:LinkButton>
                                    </p>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <div class="clearfix"></div>
            </div>
            <!-- end -->
            <div class="container">
                <h2 class="tieudegiua" style="margin-top: 30px">
                    <span class="title-content">Quần Jeans</span>
                    <asp:LinkButton ID="lbtndamkm" runat="server" class="style_link" >(Xem thêm...)</asp:LinkButton>
                </h2>

            </div>
            <div class="clearfix"></div>
            <div class="container">
                <div style="margin-left: 60px;">
                    <asp:DataList ID="dtldamkhuyenmai" runat="server" RepeatColumns="3" OnItemCommand="dtldamkhuyenmai_ItemCommand">
                        <ItemTemplate>
                            <div style="width: 100%;">
                                <div class="item" style="margin: 10px;">
                                    <a href="#">
                                        <asp:ImageButton ID="ImageButton1" Style="width: 100%" ImageUrl='<%# Bind("image")%>' runat="server" CommandName="myCommand" />
                                    </a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <h3 class="item_text">
                                    <asp:HyperLink ID="hpltensp" runat="server" Text='<%# Eval("TenHang").ToString().Length<=26?Eval("TenHang"):Eval("TenHang").ToString().Substring(0,26)+"..." %>' Style="display: block; width: 100%; text-align: center;"></asp:HyperLink>

                                </h3>
                                    <p>
                                        <div><strong><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaMoi").ToString()))  %></strong></div>
                                        <div style="text-decoration: line-through; margin-top: 10px"><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaCu").ToString()))  %></div>
                                        <asp:LinkButton ID="LinkButton1" class="discount" CommandName="myCommand" runat="server" CommandArgument='<%# Eval("id") %>'>Xem chi tiết</asp:LinkButton>
                                    </p>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:DataList>
                </div>

            </div>
            <%--quần dài--%>
            <div class="container">
                <h2 class="tieudegiua" style="margin-top: 30px">
                    <span class="title-content">Quần dài</span>
                    <asp:LinkButton ID="LinkButton2" runat="server" class="style_link">(Xem thêm...)</asp:LinkButton>
                </h2>

                <div class="clearfix"></div>
            </div>
            <div class="container">
                <div style="margin-left: 60px;">
                    <asp:DataList ID="dtlquandai" runat="server" RepeatColumns="3" OnItemCommand="dtlvaydamvasetbo_ItemCommand">
                        <ItemTemplate>
                            <div style="width: 100%;">
                                <div class="item" style="margin: 10px;">
                                    <a href="#">

                                        <asp:ImageButton ID="ImageButton1" Style="width: 100%" ImageUrl='<%# Bind("image")%>' runat="server" CommandName="myCommand" />
                                        <%--<asp:Image ID="Image1" runat="server" imageurl='<%# Bind("image")%>' />--%>
                                      
                                    </a>

                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <h3 class="item_text">
                                    <asp:HyperLink ID="hpltensp" runat="server" Text='<%# Eval("TenHang").ToString().Length<=26?Eval("TenHang"):Eval("TenHang").ToString().Substring(0,26)+"..." %>' Style="display: block; width: 100%; text-align: center;"></asp:HyperLink>

                                </h3>
                                    <p>
                                        <div><strong><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaMoi").ToString()))  %></strong></div>
                                        <div style="text-decoration: line-through; margin-top: 10px"><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaCu").ToString()))  %></div>
                                        <asp:LinkButton ID="LinkButton1" class="discount" CommandName="myCommand" runat="server" CommandArgument='<%# Eval("id") %>'>Xem chi tiết</asp:LinkButton>
                                    </p>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <div class="clearfix"></div>
            </div>

            <%--quần shorts--%>
               <div class="container">
                <h2 class="tieudegiua" style="margin-top: 30px">
                    <span class="title-content">Quần shorts</span>
                    <asp:LinkButton ID="LinkButton3" runat="server" class="style_link" >(Xem thêm)</asp:LinkButton>
                </h2>

                <div class="clearfix"></div>
            </div>
            <div class="container">
                <div style="margin-left: 60px;">
                    <asp:DataList ID="dtlquanshorts" runat="server" RepeatColumns="3" OnItemCommand="dtlvaydamvasetbo_ItemCommand">
                        <ItemTemplate>
                            <div style="width: 100%;">
                                <div class="item" style="margin: 10px;">
                                    <a href="#">

                                        <asp:ImageButton ID="ImageButton1" Style="width: 100%" ImageUrl='<%# Bind("image")%>' runat="server" CommandName="myCommand" />
                                      
                                    </a>

                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <h3 class="item_text">
                                    <asp:HyperLink ID="hpltensp" runat="server" Text='<%# Eval("TenHang").ToString().Length<=26?Eval("TenHang"):Eval("TenHang").ToString().Substring(0,26)+"..." %>' Style="display: block; width: 100%; text-align: center;"></asp:HyperLink>

                                </h3>
                                    <p>
                                        <div><strong><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaMoi").ToString()))  %></strong></div>
                                        <div style="text-decoration: line-through; margin-top: 10px"><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaCu").ToString()))  %></div>
                                        <asp:LinkButton ID="LinkButton1" class="discount" CommandName="myCommand" runat="server" CommandArgument='<%# Eval("id") %>' >Xem chi tiết</asp:LinkButton>
                                    </p>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <div class="clearfix"></div>
            </div>

            <%--tồn kho--%>
             <div class="container">
                <h2 class="tieudegiua" style="margin-top: 30px">
                    <span class="title-content">Hàng tồn kho</span>
                    <asp:LinkButton ID="LinkButton4" runat="server" class="style_link" O>(Xem thêm...)</asp:LinkButton>
                </h2>

                <div class="clearfix"></div>
            </div>
            <div class="container">
                <div style="margin-left: 60px;">
                    <asp:DataList ID="dtltonkho" runat="server" RepeatColumns="3" OnItemCommand="dtlvaydamvasetbo_ItemCommand">
                        <ItemTemplate>
                            <div style="width: 100%;">
                                <div class="item" style="margin: 10px;">
                                    <a href="#">

                                        <asp:ImageButton ID="ImageButton1" Style="width: 100%" ImageUrl='<%# Bind("image")%>' runat="server" CommandName="myCommand" />
                                      
                                    </a>

                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <h3 class="item_text">
                                    <asp:HyperLink ID="hpltensp" runat="server" Text='<%# Eval("TenHang").ToString().Length<=26?Eval("TenHang"):Eval("TenHang").ToString().Substring(0,26)+"..." %>' Style="display: block; width: 100%; text-align: center;"></asp:HyperLink>

                                </h3>
                                    <p>
                                        <div><strong><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaMoi").ToString()))  %></strong></div>
                                        <div style="text-decoration: line-through; margin-top: 10px"><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaCu").ToString()))  %></div>
                                        <asp:LinkButton ID="LinkButton1" class="discount" CommandName="myCommand" runat="server" CommandArgument='<%# Eval("id") %>'>Xem chi tiết</asp:LinkButton>
                                    </p>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <div class="clearfix"></div>
            </div>
            <!--End content -->
            <!--Footer-->

            <!--End Footer-->

        </div>
    </div>
    <div class="clearfix"></div>
</asp:Content>

