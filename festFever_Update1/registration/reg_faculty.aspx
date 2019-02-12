<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="reg_faculty.aspx.cs" Inherits="registration_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainHead" runat="Server">
    <script type="text/javascript">
        function showModal() {
            $("#myModal").modal('show');
        }

        function showErrorModal() {
            $("#errorModal").modal('show');
        }

        function showExistModal() {
            $("#existModal").modal('show');
        }

        function showVerifyModal() {
            $("#verifyModal").modal('show');
        }



    </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainBody" runat="Server">
    <div class="container">
        <div class="jumbotron registration">
            <h2 class="text-center" style="font-family: 'Righteous', cursive; color: #00cc00;">Faculty Registration</h2>
            <form class="form-signin" runat="server">
                ID:<asp:TextBox ID="TextBox6" runat="server" class="form-control" name="fullname" placeholder="Full Name" TextMode="SingleLine"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="ID required!" ControlToValidate="TextBox6" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                Full Name:<asp:TextBox ID="TextBox1" runat="server" class="form-control" name="fullname" placeholder="Full Name" TextMode="SingleLine"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Name required!" ControlToValidate="TextBox1" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                E-mail:<asp:TextBox ID="TextBox2" runat="server" class="form-control" name="username" placeholder="Email Address" TextMode="Email"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="E-mail required!" ControlToValidate="TextBox2" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                Mobile No.:<asp:TextBox ID="TextBox3" runat="server" class="form-control" name="fullname" placeholder="Mobile" TextMode="SingleLine"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Mobile no. required!" ControlToValidate="TextBox3" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                Branch:<asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                    <asp:ListItem Value="">Branch</asp:ListItem>
                    <asp:ListItem>CSE</asp:ListItem>
                    <asp:ListItem>ENTC</asp:ListItem>
                    <asp:ListItem>CIVIL</asp:ListItem>
                    <asp:ListItem>MECH</asp:ListItem>
                    <asp:ListItem>MBA</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Branch required!" ControlToValidate="DropDownList1" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                Password:<asp:TextBox ID="TextBox4" runat="server" class="form-control" name="password" placeholder="Password" TextMode="Password" MaxLength="10"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Password required!" ControlToValidate="TextBox4" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                Confirm Password:<asp:TextBox ID="TextBox5" runat="server" class="form-control" name="password" placeholder="Confirm Password" TextMode="Password" MaxLength="10"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Password required!" ControlToValidate="TextBox5" SetFocusOnError="True" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox4" ControlToValidate="TextBox5" ErrorMessage="Passwords Need To Match" ForeColor="Red" SetFocusOnError="True"></asp:CompareValidator>
                <br />
                <asp:Button ID="Button1" runat="server" Text="Submit Details" CssClass="btn btn-block btn-success btn-lg form-control" OnClick="Button1_Click" />

                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">

                                <h4 class="modal-title text-success mr-auto">Registration Successful!</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-footer text-center">
                                <asp:Button ID="Button2" runat="server" Text="Login" CssClass="btn btn-success" OnClick="Button2_Click" UseSubmitBehavior="False" CausesValidation="False" />
                                <asp:Button ID="Button3" runat="server" Text="Home" CssClass="btn btn-warning" OnClick="Button3_Click" UseSubmitBehavior="False" CausesValidation="False" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="errorModal" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">

                                <h4 class="modal-title text-danger mr-auto">Error in the form!</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <p>
                                    Please check the form for mistakes.<br />
                                    OR,User with same email already exists.
                                </p>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="Button9" runat="server" Text="Back" OnClick="Button4_Click" CssClass="btn btn-primary text-center" CausesValidation="False" />
                                <asp:Button ID="Button5" runat="server" Text="Home" OnClick="Button3_Click" CssClass="btn btn-warning text-center" CausesValidation="False" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="existModal" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">

                                <h4 class="modal-title text-primary mr-auto">User Already Exists!</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="Button8" runat="server" Text="Back" OnClick="Button4_Click" CssClass="btn btn-primary text-center" CausesValidation="False" />
                                <asp:Button ID="Button4" runat="server" Text="Home" OnClick="Button3_Click" CssClass="btn btn-warning text-center" CausesValidation="False" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="verifyModal" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">

                                <h4 class="modal-title text-primary mr-auto">Enter Valid ID!</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="Button6" runat="server" Text="Home" OnClick="Button3_Click" CssClass="btn btn-warning text-center" CausesValidation="False" />
                                <asp:Button ID="Button7" runat="server" Text="Back" OnClick="Button4_Click" CssClass="btn btn-primary text-center" CausesValidation="False" />
                            </div>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>

</asp:Content>

