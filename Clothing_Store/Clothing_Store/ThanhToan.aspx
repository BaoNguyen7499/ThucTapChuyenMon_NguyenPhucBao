<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="Clothing_Store.ThanhToan" %>

<%@ Register Src="~/MenuLeft.aspx" TagPrefix="uc1" TagName="MenuLeft"%>
<%@ Register Src="~/backtopWeb.aspx" TagPrefix="uc1" TagName="backtopWeb"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="content">
        <uc1:backtopWeb runat="server" ID="backtopWeb" />
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <uc1:MenuLeft runat="server" ID="MenuLeft" />
                </div>
                <div class="col-md-9" style="margin-top: 40px;">
                    <div>
                        <h2 class="tieudegiua">
                            <span class="title-content">THANH TOÁN</span>
                        </h2>
                    </div>
                    <div class="dataTable_wrapper" style="margin: 40px auto; width: 100%;">
                        <asp:GridView ID="grvsanpham" runat="server" AutoGenerateColumns="False" Width="100%" OnRowCommand="grvsanpham_RowCommand" CssClass="table table-striped table-bordered table-hover" OnRowDeleting="grvsanpham_RowDeleting">
                            <Columns>
                                <asp:TemplateField HeaderText="STT">
                                    <%--<EditItemTemplate>
                                      <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                  </EditItemTemplate>--%>
                                    <ItemTemplate>
                                        <%--<asp:Label ID="Label1" runat="server"></asp:Label>--%>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Tên sản phẩm" DataField="TenSP">
                                    <HeaderStyle Height="45px" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Size" HeaderText="Size">
                                    <ControlStyle Height="10px" Width="20px" />
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="Đơn Giá">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Gia") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Gia", "{0:#,0.#} VNĐ") %>'></asp:Label>
                                    </ItemTemplate>

                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>


                               <%--<asp:TemplateField HeaderText="Số lượng">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SoLuong") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        
                                        <asp:TextBox ID="txtsoluonghang" TextMode="Number" runat="server" Text='<%# Bind("SoLuong") %>'></asp:TextBox>
                                    </ItemTemplate>

                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>--%>

                                <asp:BoundField DataField="SoLuong" HeaderText="Số lượng">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>

                                <asp:ImageField DataImageUrlField="UrlImage" HeaderText="Hình ảnh">

                                    <ControlStyle Height="70px" Width="50px" />

                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />

                                </asp:ImageField>
                                <asp:TemplateField HeaderText="Thành Tiên">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TongGia") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("TongGia", "{0:#,0.#} VNĐ") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Xóa" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete">
                                          <img src="images/delete.png" alt="" />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>

                                 <%--<asp:TemplateField HeaderText="Xóa" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lb2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete">
                                          <img src="images/delete.png" alt="" />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>--%>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <table class="table">
                        <tbody>
                            <tr style="color: #FFF; font-weight: bold; background-color: orange;">
                                <td>
                                    <asp:Label ID="lbltongtien" runat="server" Text="Tổng giá: 0 VNĐ" CssClass="tongtien"></asp:Label>
                                </td>
                            </tr>
                        </tbody>

                    </table>

                    <div class="dangki" style="margin-top: 100px;">
                        <form>
                            <table style="margin-top: 30px;">
                                <tbody>



                                    <tr>
                                        <td colspan="2"><b>Thông tin khách hàng</b></td>
                                    </tr>
                                    <tr>
                                        <td>Họ và tên</td>
                                        <td>
                                            <asp:TextBox ID="txthovaten" type="text" class="textbox" runat="server"></asp:TextBox>
                                        </td>
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
                                            <asp:DropDownList ID="ddlthanhpho" runat="server" OnSelectedIndexChanged="ddlthanhpho_SelectedIndexChanged" AutoPostBack="True">
                                              
                                            </asp:DropDownList>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>Quận/Huyện</td>
                                        <td>
                                            <asp:DropDownList ID="ddlquan" runat="server">
                                                
                                            </asp:DropDownList>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>Địa chỉ</td>
                                        <td>
                                            <asp:TextBox ID="txtdiachi" runat="server" class="textbox"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Hình thức thanh toán</td>
                                        <td>
                                            <asp:DropDownList ID="ddlhinhthucthanhtoan" runat="server"></asp:DropDownList>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <div style="margin: 30px 0;">
                            <asp:Button ID="btnmuatiep" runat="server" Text="MUA TIẾP" class="btn btn-warning" OnClick="btnmuatiep_Click" />
                            <asp:Button ID="btndathang" runat="server" Text="HOÀN TẤT ĐẶT HÀNG" class="btn btn-warning" Style="margin-left: 30px;" OnClick="btndathang_Click" />
                        </div>

                    </div>
                </div>
            </div>
            &nbsp;
        </div>

    </div>
</asp:Content>
