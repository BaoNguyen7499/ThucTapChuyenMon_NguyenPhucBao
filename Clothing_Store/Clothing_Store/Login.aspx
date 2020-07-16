<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Clothing_Store.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login</title>

    <!-- Bootstrap Core CSS -->
    <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
     <form id="Form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Đăng nhập</h3>
                        </div>
                        <div class="panel-body">
                            <form role="form">
                                <fieldset>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" class="form-control" id="txtUserName" placeholder="Tài khoản" type="text"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" class="form-control" placeholder="Mật khẩu" id="txtPassWord" type="password" value=""></asp:TextBox>                                    
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" ID="lbError" style="color:red;"></asp:Label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <asp:CheckBox runat="server" id="remember" type="checkbox" value="Remember Me"/>Ghi nhớ đăng nhập
                                        </label>
                                    </div>
                                    <!-- Change this to a button or input when using this as a form -->
                                    <asp:Button runat="server" href="index.html" ID="btnLogin" class="btn btn-lg btn-success btn-block" Text="Đăng nhập" OnClick="btnLogin_Click" ></asp:Button>
                                    <%--<asp:Button runat="server" href="index.html" ID="btnRegister" class="btn btn-lg btn-info btn-block" Text ="Đăng ký" OnClick="btnRegister_Click"></asp:Button>--%>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
    <!-- jQuery -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>
</body>
</html>

