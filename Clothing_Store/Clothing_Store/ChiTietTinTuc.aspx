<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ChiTietTinTuc.aspx.cs" Inherits="Clothing_Store.ChiTietTinTuc" %>

<%@ Register Src="~/MenuLeft.aspx" TagPrefix="uc1" TagName="MenuLeft"%>
<%@ Register Src="~/backtopWeb.aspx" TagPrefix="uc1" TagName="backtopWeb"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="content container">
        <uc1:backtopWeb runat="server" ID="backtopWeb" />
        <div class="col-md-3">
            <uc1:MenuLeft runat="server" ID="MenuLeft" />
        </div>
        
        <div class="col-md-9">
            <div style="margin-top: 30px;">
                <h2 class="tieudegiua">
                    <span class="title-content">TIN TỨC</span>
                </h2>
            </div>
            <div class="content_ctsp" style="margin-top:30px;">
                <asp:Repeater ID="rptbantin" runat="server">
                    <ItemTemplate>
                        <div>
                            <h3 style="font-weight: bold; font-size:20px;"><%# Eval("tieuDe")%></h3>
                            <p style="text-align: -webkit-right;">
                                Cật nhật:<b style="font-weight:bold;"><%# Eval("ngayviet")%></b>
                                </p>
                                <p style="margin-left: 87%;">
                             Số lần xem:<b style="font-weight:bold;"><%# Eval("LuotXem") %></b>
                            </p>
                            <p style="margin-top:30px;">
                                 <%# Eval("tomtat") %>
                            </p>
                               
                            
                            <div class="detail_content" style="text-align:justify;">
                                <%# Eval("noidung") %>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
           
            <div style="margin-top:40px;" >
                <h1 style="font-weight:bold;">Các bài khác</h1>
                <ul style="margin-top:10px;margin-left:60px;">
                    <asp:Repeater ID="rptcacbaikhac" runat="server">
                        <ItemTemplate>
                            <li>
                                <a href="ChiTietTinTuc.aspx?Id=<%# Eval("Id")%>"><%# Eval("tieuDe")%> </a>
                                <span >(<%# Eval("ngayviet")%>)</span>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
            

        </div>
    </div>
     <div class="clearfix"></div>
</asp:Content>
