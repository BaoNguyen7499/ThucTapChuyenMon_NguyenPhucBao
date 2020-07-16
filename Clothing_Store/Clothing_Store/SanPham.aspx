<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="SanPham.aspx.cs" Inherits="Clothing_Store.SanPham" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <%--  <script src="js/j-query.js"></script>--%>
    <div class="content">

       <div class="backtop"> <a class="btn-top" href="javascript:void(0);" title="Top" style="display: inline;"></a> </div>

        <div class="container">
            <div class="col-md-3">
                <div class="left">
    <div class="tieudetrai">
        DANH MỤC SẢN PHẨM
    </div>
    <div class="danhmuc">
        <ul class="side-menu" data-side-menu="data-side-menu">
            <asp:Repeater ID="remenu" runat="server">
                <ItemTemplate>
                     <li>
                         <asp:LinkButton ID="lbndamlien" runat="server" OnClick="lbndamlien_Click" Text='<%# Bind("TenNhomHang")%>' CommandArgument='<%# Eval("id") %>'></asp:LinkButton>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>

    </div>
</div>
            </div>
            <div class="col-md-9">
                <h2 class="tieudegiua" style="margin-top: 40px;">
                    <asp:Label ID="lblsanpham" runat="server" Text="SẢN PHẨM" class="title-content"></asp:Label>
                </h2>
                <div style="margin:10px 70px;">
                    <asp:DataList ID="dtlsanpham" runat="server" RepeatColumns="2" OnItemCommand="dtlsanpham_ItemCommand">
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
                                        <div style="text-decoration:line-through;margin-top:10px"><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaCu").ToString()))  %></div>
                                       <asp:LinkButton ID="LinkButton1" class="discount" CommandName="myCommand" runat="server"  CommandArgument='<%# Eval("id") %>' OnClick="LinkButton1_Click">Xem chi tiết</asp:LinkButton>
                                    </p>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:DataList>
                      
                </div>
                 
            </div>
        </div>
       
    </div>
</asp:Content>
