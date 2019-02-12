<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Events.aspx.cs" Inherits="Events" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainHead" runat="Server">
    <script type="text/javascript">
        function showModal() {
            $("#myModal").modal('show');
        }
        function alreadyModal() {
            $("#alreadyModal").modal('show');
        }
    </script>
    <style type="text/css">
        .btn-warning {
            margin-left: 10px;
        }

        .auto-style1 {
            margin-top: 0px;
        }
    </style>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="MainBody" runat="Server">

    <form method="post" runat="server">
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <span class="navbar-text">
                <asp:Label Text="Login to register for an event!" runat="server" ID="NameLabel" />
            </span>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <asp:Button Text="Login" runat="server" CssClass="btn btn-success" ID="LoginButton" OnClick="LoginButton_Click" />
                </li>
                <li class="nav-item">
                    <asp:Button Text="Logout" runat="server" CssClass="btn btn-danger" ID="LogoutButton" OnClick="LogoutButton_Click" Visible="False" />
                </li>
                <li class="nav-item">
                    <asp:Button Text="Dashboard" runat="server" CssClass="btn btn-warning" ID="DashButton" OnClick="dashButton_Click" Visible="False" />
                </li>
            </ul>
        </nav>
        <br />
        <br />
        <div class="jumbotron">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style1 table table-striped table-hover" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="LinkButton1_Click">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="EventName" HeaderText="Event Name" SortExpression="EventName" />
                    <asp:BoundField DataField="EventCoordinator" HeaderText="Event Coordinator" SortExpression="EventCoordinator" />
                    <asp:BoundField DataField="EventFaculty" HeaderText="Event Faculty" SortExpression="EventFaculty" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="EventStart" HeaderText="Event Start" SortExpression="EventStart" />
                    <asp:BoundField DataField="EventEnd" HeaderText="Event End" SortExpression="EventEnd" />
                    <asp:CommandField HeaderText="Select" ShowHeader="True" ShowSelectButton="True" ControlStyle-CssClass="btn btn-primary">
                        <ControlStyle CssClass="btn btn-primary"></ControlStyle>
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
            <div class="alert alert-success text-center">
                <strong>
                    <asp:Label Text="Event Selected:" runat="server" ID="myLabel" Visible="false" Font-Size="Large" />&nbsp;<asp:Label Text="" runat="server" ID="myLab" Font-Size="Large" />
                </strong>
            </div>
            <asp:Button Text="Register for selected event!" runat="server" CssClass="btn btn-success btn-block" OnClick="Button1_Click" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="SELECT * FROM [Events]"></asp:SqlDataSource>
        </div>
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">

                        <h4 class="modal-title text-success mr-auto">Registered for the event!</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-footer text-center">
                        <asp:Button ID="Button4" runat="server" Text="Back" CssClass="btn btn-success" OnClick="ButtonBack_Click" UseSubmitBehavior="False" CausesValidation="False" />
                        <asp:Button ID="Button5" runat="server" Text="Home" CssClass="btn btn-warning" OnClick="ButtonHome_Click" UseSubmitBehavior="False" CausesValidation="False" />
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="alreadyModal" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">

                        <h4 class="modal-title text-danger mr-auto">Already registered for the event!</h4>
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
</asp:Content>

