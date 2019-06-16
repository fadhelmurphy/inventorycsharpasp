<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SistemBarang.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
    <title></title>
    <link href="assets/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous"/>
    <link href="assets/style.css" rel="stylesheet" />
    <script src="assets/slim.min.js"></script>
    <script src="assets/popper.min.js"></script>
    <script src="assets/bootstrap.min.js"></script>
    <script src="assets/custom.js"></script>    <style>
        :root {
  --input-padding-x: .75rem;
  --input-padding-y: .75rem;
}

html,
body {
  height: 100%;
}

body {
  display: -ms-flexbox;
  display: -webkit-box;
  display: flex;
  -ms-flex-align: center;
  -ms-flex-pack: center;
  -webkit-box-align: center;
  align-items: center;
  -webkit-box-pack: center;
  justify-content: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
<form id="form1" runat="server" cssClass="form-signin">
                <h1 class="h3 mb-3 font-weight-normal text-center">Please sign in</h1>
    <div CssClass="form-group row">
        <asp:Literal ID="Literal1" runat="server" />
    </div>
    <asp:TextBox ID="UserName" CssClass="form-control" runat="server" placeholder="Your username here" required/>
    <asp:TextBox ID="Password" CssClass="form-control" TextMode="Password" runat="server" placeholder="Your password here" required/>
    <asp:Button ID="Login" runat="server" CssClass="btn btn-lg btn-primary btn-block" Text="Log In" OnClick="Login_Click" />
    <a role="button" href="register.aspx" class="btn btn-lg btn-light btn-block" >Register</a>
</form>
                       </div>
    </div>
    </div>
</body>
</html>
