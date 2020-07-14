<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="Clothing_Store.DangNhap" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="content" style="min-height: 500px;">
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
                         <asp:LinkButton ID="lbndamlien" runat="server" Text='<%# Bind("TenNhomHang")%>' CommandArgument='<%# Eval("id") %>'></asp:LinkButton>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>

    </div>
</div>
            </div>
            <div class="col-md-9">

                <div class="clearfix"></div>
                <div class="dn">
                    <div class="login-wrap">
                        <div class="login-html">
                            <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
                            <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab"></label>
                            <div class="login-form">
                                <div class="sign-in-htm">
                                    <div class="group">
                                        <label for="user" class="label">Username</label>
                                        <%--  <input id="user" type="text" class="input">--%>
                                        <asp:TextBox ID="txtusername" class="login input" runat="server" type="text"></asp:TextBox>
                                        <asp:Label ID="lblcheck" runat="server" Text="" Style="color: red;"></asp:Label>
                                    </div>
                                    <div class="group">
                                        <label for="pass" class="label">Password</label>
                                        <%--<input id="pass" type="password" class="input" data-type="password">--%>
                                        <asp:TextBox ID="txtpassword" class="login input" type="password" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="group">
                                        <%-- <input type="submit" class="button" value="Sign In">--%>
                                        <asp:Button ID="btndangnhap" class="button " runat="server" Text="Đăng nhập" OnClick="btndangnhap_Click" />
                                        <asp:Button ID="btngoogle" class="btng" runat="server" Text="Đăng nhập Với google" OnClick="btngoogle_Click"  />
                                      
       
                            
                    
                   
                                    </div>
                                    <div class="hr"></div>
                                    
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
