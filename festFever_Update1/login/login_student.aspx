<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login_student.aspx.cs" Inherits="login_login_student" %>

<asp:Content ID="contentHead" ContentPlaceHolderID="MainHead" runat="server">
    <style type="text/css">
        .jumbotron {
            margin: 0 auto;
            margin-top: 50px;
            max-width: 600px;
            max-height: 500px;
        }

        .wrapper {
            margin: 0 auto;
        }
    </style>
    <script type="text/javascript">
        function showModal() {
            $("#alreadyModal").modal('show');
        }
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainBody" runat="Server">
    <div class="container">
        <div class="jumbotron">
            <div class="wrapper">
                <form class="form-signin" runat="server">
                    <h3 class="text-center" style="font-family: 'Righteous', cursive; color: #4da6ff;">Student Login</h3>
                    E-mail:
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" name="username" placeholder="Email Address" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="E-mail required!" SetFocusOnError="True" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    Password:
                    <asp:TextBox ID="TextBox2" runat="server" class="form-control" name="password" placeholder="Password" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password required!" ControlToValidate="TextBox2" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-block btn-primary btn-lg form-control" OnClick="Button1_Click" />
                    <div class="modal fade" id="alreadyModal" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">

                                    <h4 class="modal-title text-danger mr-auto">Wrong Username/Password!</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-footer text-center">
                                    <asp:Button ID="Button6" runat="server" Text="Back" CssClass="btn btn-success" OnClick="ButtonBack_Click" UseSubmitBehavior="False" CausesValidation="False" />
                                    <asp:Button ID="Button7" runat="server" Text="Home" CssClass="btn btn-warning" OnClick="ButtonHome_Click" UseSubmitBehavior="False" CausesValidation="False" />
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</asp:Content>

