<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Tintuc.aspx.cs" Inherits="Clothing_Store.Tintuc" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="content">
        <div class="backtop"> <a class="btn-top" href="javascript:void(0);" title="Top" style="display: inline;"></a> </div>
        <div class="container">
            <div class="row">
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
                    <div style="width: 100%;">
                        <div style="margin-top: 30px;">
                            <h2 class="tieudegiua">
                                <span class="title-content">TIN TỨC</span>
                            </h2>
                        </div>
                        <ul>
                        <asp:Repeater ID="rptcontent" runat="server">
                            <ItemTemplate>
                                <li>
                                <div class="box-new" style="margin-top: 40px; height: 140px;">
                                    
                                    <div class="col-md-3 rounded img" style="margin-right:10px;">
                                        <a href="ChiTietTinTuc.aspx?Id=<%# Eval("Id")%>">

                                            <img src="<%# Eval("urlHinhAnh")%>" style="height: 150px; width: 150px; object-fit:cover"  />
                                        </a>

                                    </div>
                                    <div class="col-md-8" style="margin-left:20px">
                                        <a href="ChiTietTinTuc.aspx?Id=<%# Eval("Id")%>">
                                            <h3 style="font-weight: bold;"><%# Eval("tieuDe") %></h3>

                                        </a>
                                        <p style="text-align: justify; padding-top: 27px; font-size: 13px; line-height: initial;">
                                            <%# Eval("tomtat") %>
                                        </p>
                                    </div>
                                </div>
                                    </li>
                            </ItemTemplate>
                        </asp:Repeater>
                            </ul>
                        <div style="display: block;text-align: center;margin-top:20px;">
                            <asp:Repeater ID="repeaterPaging" runat="server"
                                OnItemCommand="repeaterPaging_ItemCommand">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnPage" 
                                        CommandName="Page" CommandArgument="<%# Container.DataItem %>" style="height:10px;width:10px;    border: 1px solid rgb(213, 213, 213);    color: #000; padding: 5px 5px;"
                                        runat="server"  Font-Bold="True"> <%# Container.DataItem %>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</asp:Content>
