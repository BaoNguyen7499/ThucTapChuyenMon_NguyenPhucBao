<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="TinTucAdmin.aspx.cs" Inherits="Clothing_Store.TinTucAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" language="javascript">
        function CheckAllEmp(Checkbox) {
            var GridVwHeaderChckbox = document.getElementById("<%=grvTintuc.ClientID%>");
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
                <h1 class="page-header">Quản lý Tin Tức</h1>
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
                      <asp:LinkButton ID="btnEdit_Top" runat="server" OnClick="btnEdit_Top_Click" OnCommand="btnEdit_Top_Command" >
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
                    <asp:GridView ID="grvTintuc" runat="server" AutoGenerateColumns="False" ClientIDMode="Static" CssClass="table table-striped table-bordered table-hover" OnRowDataBound="grvTintuc_RowDataBound" OnSelectedIndexChanged="grvTintuc_SelectedIndexChanged">
                        <HeaderStyle CssClass="dgvheader" />
                        <RowStyle CssClass="gradeA" />
                        <Columns>

                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="ckAll" runat="server" onclick="CheckAllEmp(this);" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                   <asp:CheckBox ID="CkDelete" runat="server" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' OnCheckedChanged="CkDelete_CheckedChanged" />
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField AccessibleHeaderText="ID" DataField="ID" HeaderText="ID">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField AccessibleHeaderText="tieuDe" DataField="tieuDe" HeaderText="Tiêu đề">
                                <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField AccessibleHeaderText="tomtat" DataField="tomtat" HeaderText="Tóm tắt">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="500px" />
                                <ItemStyle Width="380px" />
                            </asp:BoundField>
                            <asp:BoundField AccessibleHeaderText="ngayviet" DataField="ngayviet" HeaderText="Ngày viết">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField AccessibleHeaderText="LuotXem" DataField="LuotXem" HeaderText="Lượt xem">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField AccessibleHeaderText="Active" DataField="Active" HeaderText="Hoạt động" />
                            <asp:TemplateField>
                                <HeaderTemplate>Chức năng</HeaderTemplate>
                                <ItemTemplate>
                                    <div style="min-width: 19.5%; min-height: 10px; float: left;">
                                        <asp:ImageButton ID="lbAddSub" runat="server" ImageUrl="~/Images/add.png" CommandName="AddSub" Text="AddSub" ToolTip="Thêm Menu con" OnCommand="lbAddSub_Command" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' />
                                    </div>
                                    <!--To fire the OnRowEditing event.-->
                                    <div style="min-width: 19.5%; min-height: 10px; float: left;">
                                        <asp:ImageButton ID="lbEdit" runat="server" ImageUrl="~/Images/edit.png" CommandName="Sua" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                                            Text="Sua" OnCommand="lbEdit_Command" ToolTip="Sửa"></asp:ImageButton>
                                    </div>
                                    <!--To fire the OnRowDeleting event.-->
                                    <div style="min-width: 19.5%; min-height: 10px; float: left;">
                                        <asp:ImageButton ID="lbDelete" runat="server" CommandName="Xoa" ImageUrl="~/Images/close.png" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                                            Text="Xoa" OnCommand="lbDelete_Command" ToolTip="Xóa" OnClientClick="javascript:return confirm('Bạn chắc chắn muốn xóa?');"></asp:ImageButton>
                                    </div>
                                   
                                    
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="70px" />
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
                            <asp:Label ID="Label3" runat="server" Text="Label">Tiêu đề</asp:Label>
                        </div>
                        <asp:TextBox ID="txttieude" runat="server" class="col-md-10" placeholder="Tiêu đề" Style="background-color: white !important"></asp:TextBox>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-12">
                            <asp:Label ID="Label4" runat="server" Text="Label">Tóm tắt</asp:Label>
                        </div>
                        <%--<CKEditor:CKEditorControl ID="ckedtTomtat" runat="server"></CKEditor:CKEditorControl>--%>
                        <asp:TextBox ID="txttomtat" runat="server" TextMode="multiline"  Rows="5" Width="100%"  ></asp:TextBox>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-12">
                            <asp:Label ID="Label5" runat="server" Text="Label" >Nội dung</asp:Label>
                        </div>
                         <asp:TextBox ID="txtnoidung" runat="server" TextMode="multiline"  Rows="5" Width="100%"  ></asp:TextBox>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label6" runat="server" Text="Label">Ngày viết</asp:Label>
                        </div>
                        <asp:TextBox ID="txtngayviet" runat="server" class="col-md-10" TextMode="Date" Style="background-color: white !important"></asp:TextBox>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label7" runat="server" Text="Label">ID Nhân Viên</asp:Label>
                        </div>
                        <asp:TextBox ID="txtIdNhanvien" runat="server" class="col-md-10" placeholder="ID Nhân Viên" ReadOnly="true" Style="cursor: not-allowed"></asp:TextBox>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label8" runat="server" Text="Label">Tải Hình ảnh</asp:Label>
                        </div>
                        <div class="col-md-10" style="background-color: white !important;">
                            <asp:FileUpload ID="FileUpload2" runat="server" />
                        </div>

                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label9" runat="server" Text="Label">Hoạt động</asp:Label>
                        </div>
                        <div class="col-md-10" style="background-color: white !important;">
                            <asp:CheckBox runat="server" ID="ckbActive" ClientIDMode="Static"></asp:CheckBox>
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
            $('#grvTintuc').DataTable({
                responsive: true
            });

        });
      

    </script>
</asp:Content>
