<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Thongtincanhan.aspx.cs" Inherits="Clothing_Store.Thongtincanhan" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
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
                         <asp:LinkButton ID="lbndamlien" runat="server" Text='<%# Bind("TenNhomHang")%>' CommandArgument='<%# Eval("id") %>'></asp:LinkButton>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>

    </div>
</div>
            </div>
            <div class="col-md-9">
                <div class="dangki">
                    <form>
                        <table style="margin-top: 30px;">
                            <tbody>
                                <tr>
                                    <td colspan="2"><b>Thông tin tài khoản</b></td>
                                </tr>
                                <tr>
                                    <td>Tên đăng nhập</td>
                                    <td>
                                        <%--<input name="username" type="text" class="input" id="username" value/>--%>
                                        <asp:Label ID="lbltendangnhap" runat="server" Text=""></asp:Label>
                                        <%--<asp:TextBox ID="txtusername" type="text" class="textbox" runat="server" ></asp:TextBox>--%>
                                        <%--<span class="userloading">--%>
                                        <%--<img src="images/ajax-loader.gif" style="width:15px;"/>
                                            <asp:Image ID="loader" runat="server" src="images/ajax-loader.gif" Style="width: 15px;" OnDataBinding="loader_DataBinding" OnDisposed="loader_Disposed" OnInit="loader_Init" OnLoad="loader_Load" OnPreRender="loader_PreRender" OnUnload="loader_Unload" />
                                        </span>--%>
                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td>Mật khẩu</td>
                                    <td>
                                        <%--<asp:ChangePassword ID="password" class="input" runat="server"></asp:ChangePassword>--%>
                                        <asp:TextBox ID="txtpassword" type="password" class="textbox" runat="server"></asp:TextBox>
                                        <%--<input name="username" type="text" class="input" id="Text1" value/>--%>
                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td>Gõ lại mật khẩu</td>
                                    <td>
                                        <asp:TextBox ID="txtrepressPassword" type="password" class="textbox" runat="server"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"><b>Thông tin cá nhân</b></td>
                                </tr>
                                <tr>
                                    <td>Họ và tên</td>
                                    <td>

                                        <%--<input name="username" type="text" class="input" id="Text3" value/>--%>
                                        <asp:TextBox ID="txthovaten" type="text" class="textbox" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Giới tính</td>
                                    <td>

                                        <asp:RadioButton ID="rdobtnNam" value="1" Style="width: initial; height: initial; float: left;" runat="server" GroupName="sex" Checked="True" Text="Nam" />

                                        <asp:RadioButton ID="rdobtnNu" value="0" Style="width: initial; height: initial; float: left; margin-left: 10px;" runat="server" GroupName="sex" Text="Nữ" />

                                    </td>
                                </tr>
                                <tr>
                                    <td>Ngày sinh</td>
                                    <td>
                                        <%--<input type="date" name="ngaysinh" max="2100-12-31" min="1970-12-31" style="width: initial;height: initial;" />--%>
                                        <asp:TextBox ID="txtngaysinh" runat="server" TextMode="Date"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">Thông tin xác thực thanh toán</td>

                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td>

                                        <asp:TextBox ID="txtemail" runat="server" class="textbox"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Điện thoại</td>
                                    <td>
                                        <asp:TextBox ID="txtdienthoai" runat="server" class="textbox"></asp:TextBox>

                                    </td>
                                </tr>

                                <tr>
                                    <td>Tỉnh/Thành phố</td>
                                    <td>
                                        <asp:DropDownList ID="ddlthanhpho" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlthanhpho_SelectedIndexChanged">

                                        </asp:DropDownList>


                                    </td>

                                </tr>
                                <tr>
                                    <td>Quân/Huyện</td>
                                    <td>
                                        <asp:DropDownList ID="ddlquan" runat="server">
                                           
                                        </asp:DropDownList>
                                       
                                        
                                    </td>

                                </tr>
                                <tr>
                                    <td>Địa chỉ chi tiết</td>
                                    <td>
                                        <asp:TextBox ID="txtdiachi" runat="server" class="textbox"></asp:TextBox>

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <div style="margin: 30px 0;">
                        <asp:Button ID="btndangki" runat="server" Text="Cật nhật" class="btn btn-warning" OnClick="btndangki_Click" />
                        <asp:Button ID="btnhuy" runat="server" Text="Hủy" class="btn btn-warning" OnClick="btnhuy_Click" />

                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
