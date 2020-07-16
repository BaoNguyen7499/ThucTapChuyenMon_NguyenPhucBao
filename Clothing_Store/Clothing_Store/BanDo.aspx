<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="BanDo.aspx.cs" Inherits="Clothing_Store.BanDo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <script src="js/j-query.js"></script>
    <div class="content " style="min-height:400px; margin-bottom:30px;">
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
                         <asp:LinkButton ID="lbndamlien" OnClick="lbndamlien_Click" runat="server" Text='<%# Bind("TenNhomHang")%>' CommandArgument='<%# Eval("id") %>'></asp:LinkButton>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>

    </div>
</div>
            </div>
            <div class="col-md-8" style="margin-top:40px;">
                <div style=" border:1px solid #a9a9a9; margin:0 auto;width:83%;">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.561726382128!2d106.79291661480136!3d10.844813492275126!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175273dd67f829d%3A0x583da00c7deed3c2!2zxJDhuqFpIGjhu41jIEdpYW8gVGjDtG5nIFbhuq1uIFThuqNpIC0gUGjDom4gaGnhu4d1IHThuqFpIFRow6BuaCBwaOG7kSBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1594913893069!5m2!1svi!2s" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                </div>
           
            </div>
        </div>
    </div>
</asp:Content>
