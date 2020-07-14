<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="DangKiThanhVien.aspx.cs" Inherits="Clothing_Store.DangKiThanhVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
     <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
    <script src="https://apis.google.com/js/plus.js?onload=init"></script>
    <script src="https://apis.google.com/js/platform.js?onload=onLoadCallback"></script>
    <script src="js/script.js" type="text/javascript"></script>
    <script src="js/app.js" type="text/javascript"></script>
    <script type="text/javascript">
        (function () {
            var p = document.createElement('script');
            p.type = 'text/javascript';
            p.async = true;
            p.src = 'https://apis.google.com/js/client.js?onload=onLoadFunction';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(p, s);
          
        })();
    </script>

   



   
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
                <h2 class="tieudegiua" style="margin-top: 35px;">
                    <span class="title-content">ĐĂNG KÍ THÀNH VIÊN</span>
                </h2>
                
                
               
                <div class="clearfix"></div>
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
                                        <asp:TextBox ID="txtusername" type="text" class="textbox" runat="server" OnTextChanged="txtusername_TextChanged" OnLoad="txtusername_Load"></asp:TextBox>
                                        <span class="userloading">
                                            <%--<img src="images/ajax-loader.gif" style="width:15px;"/>--%>
                                            <asp:Image ID="loader" runat="server" src="images/ajax-loader.gif" Style="width: 15px;" OnDataBinding="loader_DataBinding" OnDisposed="loader_Disposed"  OnInit="loader_Init"  OnLoad="loader_Load" OnPreRender="loader_PreRender" OnUnload="loader_Unload" />
                                        </span>
                                        <span class="usernameResult">
                                            <%--<span style="color:#f00;">Tài khoản phải từ 4 kí tự trở lên</span>--%>
                                            <asp:Label ID="lblcheck" runat="server" Text="" Style="color: #f00;"></asp:Label>
                                        </span>
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
                                        <asp:TextBox ID="txtngaysinh" runat="server" TextMode="Date" OnTextChanged="txtngaysinh_TextChanged"></asp:TextBox>

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
                                        <asp:DropDownList ID="ddlthanhpho" runat="server" OnSelectedIndexChanged="ddlthanhpho_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem Value="0">Chọn tỉnh/thành phố</asp:ListItem>
                                        
                                        </asp:DropDownList>
                                       
                                        
                                    </td>

                                </tr>
                                <tr>
                                    <td>Quân/Huyện</td>
                                    <td>
                                        <asp:DropDownList ID="ddlquan" runat="server">
                                            <asp:ListItem Value="0">Chọn Quận Huyện</asp:ListItem>
                                          
                                        </asp:DropDownList>
                                       
                                        
                                    </td>

                                </tr>
                                <tr>
                                    <td>Địa chỉ</td>
                                    <td>
                                        <asp:TextBox ID="txtdiachi" runat="server" class="textbox"></asp:TextBox>

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <div style="margin: 30px 0;">
                        <asp:Button ID="btndangki" runat="server" Text="Đăng kí" class="btn btn-warning" OnClick="btndangki_Click" />
                        <asp:Button ID="btnhuy" runat="server" Text="Hủy" class="btn btn-warning" OnClick="btnhuy_Click" />

                    </div>

                </div>


            </div>
        </div>
    </div>
</asp:Content>
