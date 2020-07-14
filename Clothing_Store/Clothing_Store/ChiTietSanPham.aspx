<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ChiTietSanPham.aspx.cs" Inherits="Clothing_Store.ChiTietSanPham" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
     <%--<input type="radio" name="size" value="S" />XL--%>
    <div id="fb-root"></div>
    <div id="Div1"></div>
    <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8&appId=1838823719729580";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

    </script>
    <div id="Div2"></div>
    <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8&appId=1838823719729580";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
    <script>
        window.___gcfg = {
            lang: 'en-US'
        };
    </script>

    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://apis.google.com/js/platform.js" async defer>
    </script>
    <div id="Div3"></div>
    <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8&appId=1838823719729580";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
    <%--<input type="radio" name="size" value="S" />XXL--%>


    <div class="content">
        <div class="backtop"> <a class="btn-top" href="javascript:void(0);" title="Top" style="display: inline;"></a> </div>
        <div class="wap_slider">
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
                <div class="col-md-9" style="margin-top: 30px;">
                    <div class="chitietsp">
                        <div class="col-md-4 " style="position: relative;">
                            <div class="magnify">
                                <asp:Repeater ID="rptlarge" runat="server">
                                    <ItemTemplate>
                                        <div class="large" style="margin-top: 0px; background: url('<%# Eval("ImageLarge") %>') no-repeat;">
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                                <%--   <img  src="images/timthumb.png" class="small"style="width:200px;"/>--%>
                                <asp:Image ID="imganhsp" runat="server" CssClass="small" Width="230px" />
                            </div>

                        </div>

                        <div class="col-md-8">
                            <asp:Literal ID="ltrctsp" runat="server"></asp:Literal>
                            <%--<span>115 lượt</span>--%>
                            <div>

                                <p><strong>Thông số size đầm chuẩn</strong></p>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>SIZE</th>
                                            <th>NGỰC</th>
                                            <th>EO</th>
                                            <th>MÔNG</th>
                                            <th>DÀI</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>S</td>
                                            <td>83-86</td>
                                            <td>64-68</td>
                                            <td>86-89</td>
                                            <td>86</td>
                                        </tr>
                                        <tr>
                                            <td>M</td>
                                            <td>87-92</td>
                                            <td>69-72</td>
                                            <td>90-93</td>
                                            <td>88</td>
                                        </tr>
                                        <tr>
                                            <td>L</td>
                                            <td>93-95</td>
                                            <td>73-76</td>
                                            <td>94-96 </td>
                                            <td>90</td>
                                        </tr>

                                        <tr>
                                            <td>XL</td>
                                            <td>96-98</td>
                                            <td>78-82 </td>
                                            <td>98-100</td>
                                            <td>92</td>
                                        </tr>
                                        <tr>
                                            <td>XXL</td>
                                            <td>96-98</td>
                                            <td>78-82 </td>
                                            <td>98-100</td>
                                            <td>92</td>
                                        </tr>
                                    </tbody>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                            <div>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th colspan="5">Chọn size</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="rdobtnS" runat="server" Text="S" Checked="True" GroupName="rdobtnSize" />
                                                <%--<input type="radio" name="size" value="S" />XL--%>
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="rdbtnM" runat="server" GroupName="rdobtnSize" Text="M" />
                                                <%--<input type="radio" name="size" value="S" />XXL--%>
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="rdbtnL" runat="server" GroupName="rdobtnSize" Text="L" />
                                                <%--<span>115 lượt</span>--%>
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="rdbtnXL" runat="server" GroupName="rdobtnSize" Text="XL" />
                                                <%--<input type="radio" name="size" value="S" />XL--%>
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="rdbtnXXL" runat="server" GroupName="rdobtnSize" Text="XXL" />
                                                <%--<input type="radio" name="size" value="S" />XXL--%>
                                            </td>
                                        </tr>
                                    </tbody>
                                   
                                </table>

                                <div class="sl">
                                    <label>Số lượng: </label>
                                    <asp:TextBox runat="server"  CssClass="form-control" Width="20%" TextMode="Number" Text="1" ID="txtsl"/>
                                </div>
                            </div>
                            <div>
                                <b>Lượt xem:</b>
                                <%--<span>115 lượt</span>--%>
                                <asp:Label ID="lblluotxem" runat="server" Text="0"></asp:Label>
                            </div>
                            <div>
                                <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-success" OnClick="LinkButton1_Click">MUA NGAY</asp:LinkButton>
                                <%--<button type="button" class="btn btn-success">MUA NGAY</button>--%>
                            </div>
                            <div>
                                <div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button" data-action="like" data-size="small" data-show-faces="false" data-share="true"></div>
                                <div class="fb-send" data-href="https://www.facebook.com/PhungQuocDinh"></div>
                                <span>
                                       <g:plusone size="smal" data-annotation:"bubble">

                                    </g:plusone>
                                </span>
                                

                            </div>
                        </div>

                    </div>
                    <div class="clearfix"></div>
                    <div class="tab">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#">Chi Tiết</a></li>
                        </ul>
                        <div class="content_tabs">
                            <asp:Literal ID="ltr_ChiTiet" runat="server"></asp:Literal>
                            <div class="advs">
                                <asp:FormView ID="frmviewChitiet" runat="server" Width="100%">
                                    <ItemTemplate>
                                        <h3><%# Eval("TenHang")%></h3>
                                        <div class="advs-left">
                                            <div >
                                                <span style="text-decoration: line-through;"><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaCu").ToString()))  %>
                                                    <sup style="text-decoration:none; font-size:16px;">đ</sup>
                                                </span>
                                             
                                                <strong style="margin-left: 10px;">-10%</strong>
                                                <h3 style="margin-top: 20px; font-size: 36px; font-weight: bold;"><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaMoi").ToString()))  %><sup>đ</sup></h3>
                                            </div>
                                        </div>
                                        <div class="advs-right">
                                           
                                              <asp:LinkButton ID="LinkButton1" style="height:100%;" runat="server" class="btn btn-success" OnClick="LinkButton1_Click">ĐẶT HÀNG</asp:LinkButton>
                                        </div>
                                    </ItemTemplate>

                                </asp:FormView>

                                <div class="clearfix"></div>

                            </div>
                            <div class="fb-comments" data-href="https://www.facebook.com/shopthoitrangxinh/posts/1060590080716436" data-numposts="5" data-width="800px;"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container" style="margin-top: 30px;">
                <h2 class="tieudegiua">
                    <span class="title-content">Sản phẩm cùng loại</span>
                </h2>
            </div>
            <div class="clearfix"></div>
            <div class="sanphamcungloai container">                
                <div style="margin-left: 60px;">
                    <asp:DataList ID="rptSanPhamCungloai" runat="server" RepeatColumns="3" OnItemCommand="rptSanPhamCungloai_ItemCommand" OnSelectedIndexChanged="rptSanPhamCungloai_SelectedIndexChanged">
                        <ItemTemplate>
                            <div style="width: 100%;">
                                <div class="item" style="margin: 10px;">
                                    <a href="#">
                                        <asp:ImageButton ID="ImageButton1" Style="width: 100%" ImageUrl='<%# Bind("image")%>' runat="server" CommandName="myCommand" />
                                        
                                    </a>
       
                                <h3 class="item_text">
                                    <asp:HyperLink ID="hpltensp" runat="server" Text='<%# Eval("TenHang").ToString().Length<=26?Eval("TenHang"):Eval("TenHang").ToString().Substring(0,26)+"..." %>' Style="display: block; width: 100%; text-align: center;"></asp:HyperLink>
                                    <%--<asp:HyperLink ID="hpltensp" runat="server" Text='<%# Bind("TenHang") %>'></asp:HyperLink>--%>
                                    <%--<a href="#">DL372 ĐẦM DẠ GHI-LÊ (2 TÚI THẬT)</a>--%>
                                </h3>
                                    <p>
                                        <div><strong><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaMoi").ToString()))  %></strong></div>
                                        <div style="text-decoration:line-through; margin-top:10px"><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaCu").ToString()))  %></div>
                                      <asp:LinkButton ID="LinkButton2" class="discount" CommandName="myCommand" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="LinkButton2_Click">Xem chi tiết</asp:LinkButton>
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>



                    

                </div>
            </div>
        </div>
    </div>
</asp:Content>
