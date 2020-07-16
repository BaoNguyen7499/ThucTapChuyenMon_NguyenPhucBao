<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="HangAdmin.aspx.cs" Inherits="Clothing_Store.HangAdmin" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript" language="javascript">
         function CheckAllEmp(Checkbox) {
             var GridVwHeaderChckbox = document.getElementById("<%=grvHang.ClientID%>");
            for (i = 1; i < GridVwHeaderChckbox.rows.length; i++) {
                GridVwHeaderChckbox.rows[i].cells[0].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;

            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnData" runat="server">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Quản lý Sản Phẩm</h1>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <div style="height: 48px;">
                    <asp:LinkButton ID="btnRefresh_Top" runat="server" OnCommand="btnRefresh_Top_Command">
                        <div style="float:left;margin-right:10px;">
                            <button type="button" class="btn btn-primary btn-circle">
                                <i class="fa fa-refresh"></i>
                            </button>
                            <span>Làm mới</span>
                             <img src="Images/split.png" style="margin-left:10px;"/>
                        </div>
                    </asp:LinkButton>
                    <asp:LinkButton ID="btnAdd_Top" runat="server" OnClick="btnAdd_Top_Click" OnCommand="btnAdd_Top_Command">
                        <div style="float:left;margin-right:10px;">
                            <button type="button" class="btn btn-success btn-circle">
                                <i class="fa fa-plus"></i>
                            </button>
                            <span>Thêm</span>
                             <img src="Images/split.png" style="margin-left:10px;"/>
                        </div>
                    </asp:LinkButton>
                    <asp:LinkButton ID="btnEdit_Top" runat="server" OnClick="btnEdit_Top_Click" OnCommand="btnEdit_Top_Command">
                        <div style="float:left;margin-right:10px;">
                            <button type="button" class="btn btn-success btn-circle">
                                <i class="fa fa-plus"></i>
                            </button>
                            <span>Sửa</span>
                             <img src="Images/split.png" style="margin-left:10px;"/>
                        </div>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkButton1" runat="server" href="javascript:void(0);" OnClientClick="window.history.go(-1);">
                        <div style="float:left;margin-right:10px">
                            <button type="button" class="btn btn-success btn-circle">
                                <i class="fa fa-mail-reply"></i>
                            </button>
                            <span>Trở lại</span>
                              <img src="Images/split.png" style="margin-left:10px;"/>
                        </div>   
                    </asp:LinkButton>
                    <asp:LinkButton ID="btnDelete" runat="server" OnClientClick="javascript:return confirm('Bạn chắc chắn muốn xóa?');" OnCommand="btnDelete_Command" OnClick="btnDelete_Click">
                        <div style="float:left;">
                            <button type="button" class="btn btn-danger btn-circle"><i class="fa fa-times"></i>
                             </button>
                             <span>Xóa</span>
                        </div>
                    </asp:LinkButton>
                </div>
            </div>

            <!-- /.panel-heading-->
            <div class="panel-body">
                <div class="dataTable_wrapper">
                    <asp:GridView ID="grvHang" runat="server" AutoGenerateColumns="False" ClientIDMode="Static" CssClass="table table-striped table-bordered table-hover" OnRowDataBound="grvHang_RowDataBound" OnSelectedIndexChanged="grvHang_SelectedIndexChanged">
                        <HeaderStyle CssClass="dgvheader" />
                        <RowStyle CssClass="gradeA" />
                        <Columns>

                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="ckAll" runat="server" onclick="CheckAllEmp(this);" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CkDelete" runat="server" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' />
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField AccessibleHeaderText="ID" DataField="ID" HeaderText="ID">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField AccessibleHeaderText="TenHang" DataField="TenHang" HeaderText="Tên Hàng">
                                <ItemStyle Width="300px" />
                            </asp:BoundField>
                            <asp:BoundField AccessibleHeaderText="ChatLieu" DataField="ChatLieu" HeaderText="Chất liệu">
                                <HeaderStyle Width="300px" />
                                <ItemStyle Width="300px" />
                            </asp:BoundField>
                            <asp:BoundField AccessibleHeaderText="LuotXem" DataField="LuotXem" HeaderText="Lượt xem">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField AccessibleHeaderText="giaMoi" DataField="giaMoi" HeaderText="Giá mới">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField AccessibleHeaderText="Active" DataField="Active" HeaderText="Hoạt động" />
                            <asp:BoundField AccessibleHeaderText="Soluong" DataField="Soluong" HeaderText="Số lượng" />
                            <asp:ImageField AccessibleHeaderText="image" DataImageUrlField="image" HeaderText="Ảnh">
                                <ControlStyle Height="70px" Width="50px" />
                                <ItemStyle Height="50px" Width="50px" />
                            </asp:ImageField>
                            <asp:BoundField AccessibleHeaderText="TinhTrang" DataField="TinhTrang" HeaderText="Tình trạng" />
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Chức năng
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div style="min-width: 19.5%; min-height: 10px; float: left;">
                                        <asp:ImageButton ID="lbAddSub" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' CommandName="AddSub" ImageUrl="~/Images/add.png" OnCommand="lbAddSub_Command" Text="AddSub" ToolTip="Thêm Menu con" />
                                    </div>
                                    <!--To fire the OnRowEditing event.-->
                                    <div style="min-width: 19.5%; min-height: 10px; float: left;">
                                        <asp:ImageButton ID="lbEdit" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' CommandName="Sua" ImageUrl="~/Images/edit.png" OnCommand="lbEdit_Command" Text="Sua" ToolTip="Sửa" />
                                    </div>
                                    <!--To fire the OnRowDeleting event.-->
                                    <div style="min-width: 19.5%; min-height: 10px; float: left;">
                                        <asp:ImageButton ID="lbDelete" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' CommandName="Xoa" ImageUrl="~/Images/close.png" OnClientClick="javascript:return confirm('Bạn chắc chắn muốn xóa?');" OnCommand="lbDelete_Command" Text="Xoa" ToolTip="Xóa" />
                                    </div>
                                    <%--Visible='<%# (DataBinder.Eval(Container.DataItem, "Ord").ToString() != "1") %>'--%><%-- <div style="min-width: 19.5%; min-height: 10px; float: left;">
                                        <asp:ImageButton ID="lbUp" runat="server" ImageUrl="~/Admin/Images/1459276881_arrow-up_basic_blue.png" CommandName="Up" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' 
                                            Text="Up" OnCommand="lbUp_Command" ToolTip="Lên Trên"></asp:ImageButton>
                                    </div>--%>
                                    <!--To fire the OnRowEditing event.-->
                                    <%--Visible='<%# isDown((DataBinder.Eval(Container.DataItem, "ID").ToString())) %>'--%><%-- <div style="min-width: 19.5%; min-height: 10px; float: left;">
                                        <asp:ImageButton ID="lbDown" runat="server" ImageUrl="~/Admin/Images/1459276887_arrow-down_basic_blue.png" CommandName="Down" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' 
                                            Text="Down" OnCommand="lbDown_Command" ToolTip="Xuống Dưới"></asp:ImageButton>
                                    </div>--%>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="70px" />
                            </asp:TemplateField>
                        </Columns>

                    </asp:GridView>

                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnInfo" runat="server" Visible="false">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Cập nhật thông tin</h1>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <div>
                    <asp:LinkButton ID="btnSave_Top" runat="server" OnClick="btnSave_Top_Click">
                        <button type="button" class="btn btn-primary btn-circle">
                            <i class="fa fa-save"></i>
                        </button>
                        <span>Lưu lại</span>
                        <img src="Images/split.png" style="margin-left:10px;"/>
                    </asp:LinkButton>
                    <asp:LinkButton ID="btnReturn_Top" runat="server" OnClick="btnReturn_Top_Click" OnCommand="btnReturn_Top_Command">
                         <div style="float:left;margin-right:10px;">
                            <button type="button" class="btn btn-success btn-circle"><i class="fa fa-mail-reply"></i>
                             </button>
                            <span>Trở lại</span>
                            <img src="Images/split.png" style="margin-left:10px;"/>
                             </div>
                    </asp:LinkButton>
                    <asp:Label ID="Label2" runat="server">
                                    <div style="clear:left;">
                                        
                                    </div>
                    </asp:Label>
                </div>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="dataTables_wrapper">
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label1" runat="server" Text="Label">ID:</asp:Label>
                        </div>
                        <asp:TextBox ID="txtID" runat="server" class="col-md-10" placeholder="ID" ReadOnly="true" Style="cursor: not-allowed"></asp:TextBox>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label3" runat="server" Text="Label">Tên hàng</asp:Label>
                        </div>
                        <asp:TextBox ID="txttenhang" runat="server" class="col-md-10" placeholder="Tên hàng" Style="background-color: white !important"></asp:TextBox>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label7" runat="server" Text="Label">Tên nhóm hàng</asp:Label>
                        </div>
                        <asp:DropDownList ID="ddltennhomhang" runat="server" Style="height:43px;"></asp:DropDownList>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label10" runat="server" Text="Label">Chất liệu</asp:Label>
                        </div>
                        <asp:TextBox ID="txtchatlieu" runat="server" class="col-md-10" placeholder="Chất liệu" Style="background-color: white !important"></asp:TextBox>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label11" runat="server" Text="Label">Giá mới</asp:Label>
                        </div>
                        <asp:TextBox ID="txtgiamoi" runat="server" class="col-md-10" placeholder="Gía mới" Style="background-color: white !important"></asp:TextBox>

                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label13" runat="server" Text="Label">Giá cũ</asp:Label>
                        </div>
                        <asp:TextBox ID="txtgiacu" runat="server" class="col-md-10" placeholder="Gía cũ" Style="background-color: white !important;"></asp:TextBox>

                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label14" runat="server" Text="Label">Số lượng</asp:Label>
                        </div>
                        <asp:TextBox ID="txtsoluong" TextMode="Number" min="0" max="20000" step="1" runat="server" Style="height: 43px;"></asp:TextBox>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-12">
                            <asp:Label ID="Label4" runat="server" Text="Label">Tóm tắt</asp:Label>
                            <asp:TextBox ID="txttomtat" runat="server" TextMode="multiline" Rows="5" Width="100%"></asp:TextBox>
                        </div>
                        <div class="row show-grid">
                            <div class="col-md-12">
                                <asp:Label ID="Label5" runat="server" Text="Label">Nội dung</asp:Label>
                                <asp:TextBox ID="txtNoidung" runat="server" TextMode="multiline" Rows="5" Width="100%"></asp:TextBox>                            
                            </div>
         
                        </div>
                        <div class="row show-grid">
                            <div class="col-md-2">
                                <asp:Label ID="Label8" runat="server" Text="Label">Tải Hình ảnh nhỏ</asp:Label>
                            </div>
                            <div class="col-md-4" style="background-color: white !important;">
                                <asp:FileUpload ID="ful_hinhanhnho" runat="server" />
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="Label6" runat="server" Text="Label">Tải Hình ảnh lớn </asp:Label>
                            </div>
                            <div class="col-md-4" style="background-color: white !important;">
                                <asp:FileUpload ID="ful_hinhanhlon" runat="server" />
                            </div>

                        </div>
                        <div class="row show-grid">
                            <div class="col-md-2">
                                <asp:Label ID="Label9" runat="server" Text="Label">Hoạt động</asp:Label>
                            </div>
                            <div class="col-md-10" style="background-color: white !important;">
                                <asp:CheckBox runat="server" ID="ckbActive" ClientIDMode="Static" Text=" Còn Hàng"> </asp:CheckBox>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
    </asp:Panel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
      <!-- DataTables JavaScript -->
  
    <script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
      <script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>


        $(document).ready(function () {
            $('#grvHang').DataTable({
                responsive: true
            });

        });
    </script>    
</asp:Content>

