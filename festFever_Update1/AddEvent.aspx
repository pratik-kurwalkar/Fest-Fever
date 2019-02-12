<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddEvent.aspx.cs" Inherits="AddEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainHead" runat="Server">
<script type="text/javascript">
        function showErrorModal() {
            $("#errorModal").modal('show');
    }
            function showModal() {
            $("#alreadyModal").modal('show');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="Server">
    <form method="post" runat="server">
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <span class="navbar-text text-danger">
                <asp:Label Text="" runat="server" ID="NameLabel" />

            </span>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <asp:Button Text="Logout" runat="server" CssClass="btn btn-danger" ID="LogoutButton" OnClick="LogoutButton_Click" Visible="True" CausesValidation="False" />
                    <asp:Button Text="DashBoard" runat="server" CssClass="btn btn-warning ml-2" ID="dash" OnClick="DashButton_Click" Visible="True" CausesValidation="False" />
                </li>
            </ul>
        </nav>
        <br />
        <div class="container">
            <div class="jumbotron">
                Event Name:
    <asp:TextBox runat="server" ID="e_name" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Event name required!" ControlToValidate="e_name" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                <br /> Description:
    <asp:TextBox runat="server" ID="e_desciption" CssClass="form-control" TextMode="MultiLine" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Description required!" ControlToValidate="e_desciption" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />Event Coordinator:
    <asp:DropDownList ID="e_co" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataMember="DefaultView" DataTextField="Name" placeholder="Full Name">
    </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Coordinator required!" ControlToValidate="e_co" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />Event Faculty:
    <asp:DropDownList ID="e_fac" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataMember="DefaultView" DataTextField="Name" placeholder="Full Name">
    </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Faculty required!" ControlToValidate="e_fac" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                <br /><div class="row">
                    <div class="col-md-6 text-center">
                        Start Date:
    <asp:Calendar ID="e_start" runat="server" CssClass="ml-auto mr-auto"></asp:Calendar>


                    </div>
                    <div class="col-md-6 text-center">
                        End Date:
    <asp:Calendar ID="e_end" runat="server" CssClass="ml-auto mr-auto"></asp:Calendar>

                    </div>


                </div>
                <br />
                <asp:Button Text="Add Event!" runat="server" CssClass="btn btn-success ml-auto mr-auto" Style="width: 50%;display:block;" OnClick="addEvent_Click" />
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="SELECT Name FROM Students WHERE (Coordinater = 'Y')"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="SELECT Name FROM Faculty"></asp:SqlDataSource>
        <div class="modal fade" id="errorModal" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">

                                <h4 class="modal-title text-danger mr-auto">Error in the form!</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <p>
                                    Please check the form for mistakes.
                                </p>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="Button9" runat="server" Text="Back" OnClick="Button4_Click" CssClass="btn btn-primary text-center" CausesValidation="False" />
                                <asp:Button ID="Button5" runat="server" Text="Home" OnClick="Button3_Click" CssClass="btn btn-warning text-center" CausesValidation="False" />
                            </div>
                        </div>
                    </div>
                </div>
        <div class="modal fade" id="alreadyModal" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">

                                <h4 class="modal-title text-success mr-auto">Event Added!</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <div class="modal-footer">
                                <asp:Button ID="Button1" runat="server" Text="Back" OnClick="Button4_Click" CssClass="btn btn-primary text-center" CausesValidation="False" />
                                <asp:Button ID="Button2" runat="server" Text="Home" OnClick="Button3_Click" CssClass="btn btn-warning text-center" CausesValidation="False" />
                            </div>
                        </div>
                    </div>
                </div>
        <asp:Label Text="" runat="server" Visible="false" ID="forId" />
    </form>
</asp:Content>

