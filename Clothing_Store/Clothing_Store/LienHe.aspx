<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="LienHe.aspx.cs" Inherits="Clothing_Store.LienHe" %>

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
                    <div style="margin-top: 30px;">
                        <h2 class="tieudegiua">
                            <span class="title-content">LIÊN HỆ</span>
                        </h2>
                    </div>
                    <div class="form_lienhe">
                        <div class="item_lienhe">
                            <p>Tên: <span>*</span></p>
                           
                            <asp:TextBox class="input_form" ID="txtten" runat="server" type="text"></asp:TextBox>
                        </div>
                        <div class="clearfix"></div>
                         <div class="item_lienhe">
                            <p>Địa chỉ: <span>*</span></p>
                             <asp:TextBox class="input_form" ID="txtdiachi" runat="server"  type="text"></asp:TextBox>
                           
                        </div>
                         <div class="clearfix"></div>
                         <div class="item_lienhe">
                            <p>Điện thoại: <span>*</span></p>
                             
                             <asp:TextBox class="input_form" ID="txtdienthoai" runat="server"  type="text"></asp:TextBox>
                         
                        </div>
                         <div class="clearfix"></div>
                         <div class="item_lienhe">
                            <p>Email: <span>*</span></p>
                             <asp:TextBox class="input_form" ID="txtemail" runat="server" type="text"></asp:TextBox>
                          
                        </div>
                         <div class="clearfix"></div>
                         <div class="item_lienhe">
                            <p>Chủ đề: <span>*</span></p>
                             <asp:TextBox class="input_form"  ID="txtchude" runat="server" type="text"></asp:TextBox>
                          
                        </div>
                         <div class="clearfix"></div>
                         <div class="item_lienhe">
                            <p>Nội dung: <span>*</span></p>
                             <asp:TextBox   id="txtnoidung" TextMode="multiline" Columns="61" Rows="5" runat="server" />
                             
                        </div>
                         <div class="clearfix"></div>
                        <div class="item_lienhe">
                            <p></p>
                            <asp:Button ID="btnGui" runat="server" Text="Gửi"  class="btn btn-danger" OnClick="btnGui_Click" />
                            <asp:Button ID="btnNhapLai" runat="server" Text="Nhập lại"  class="btn btn-danger" OnClick="btnNhapLai_Click" />
                         
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
