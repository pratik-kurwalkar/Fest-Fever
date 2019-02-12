<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="student_dash.aspx.cs" Inherits="dashbords_student_dash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainHead" runat="Server">
    <style type="text/css">
        .table {
            border-radius: 10px;
        }
        .button {
            display:block;
        margin:0 auto;
        width:20%;
        }
        .grid {
        display:block;
        margin:0 auto;
        }
    </style>
    <script type="text/javascript">

        function delModal() {
            $("#delModal").modal('show');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="Server">

    <form method="post" runat="server">
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <span class="navbar-text">
                <asp:Label Text="" runat="server" ID="NameLabel" />
            </span>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <asp:Button Text="Logout" runat="server" CssClass="btn btn-danger" ID="LogoutButton" OnClick="LogoutButton_Click" Visible="True" />
                </li>
            </ul>
        </nav>


        <h1 class="text-center" style="font-family: 'Righteous', cursive; color: #ff6666;">Student Dashboard</h1>
        <br />
        <div class="container jumbotron">
            <asp:Label Text="<h2 class='text-center'>Not registered for any event!</h2>" runat="server" Visible="False" ID="noLab" CssClass="text-danger" />
            <br />

            <asp:Button Text="Register for Event!" runat="server" CausesValidation="False" OnClick="Unnamed1_Click" CssClass="btn btn-success button" />

            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="studentData" DataKeyNames="Id" OnSelectedIndexChanged="LinkButton1_Click" CssClass="table table-striped table-hover">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Event ID" SortExpression="Id" ReadOnly="True" />
                    <asp:BoundField DataField="EventName" HeaderText="Event Name" SortExpression="EventName" />
                    <asp:BoundField DataField="EventCoordinator" HeaderText="Coordinator" SortExpression="EventCoordinator" />
                    <asp:BoundField DataField="EventFaculty" HeaderText="Faculty" SortExpression="EventFaculty" />
                    <asp:BoundField DataField="EventStart" HeaderText="Start" SortExpression="EventStart" />
                    <asp:BoundField DataField="EventEnd" HeaderText="End" SortExpression="EventEnd" />
                    <asp:CommandField HeaderText="Select" ShowHeader="True" ShowSelectButton="True"  ControlStyle-CssClass="btn btn-primary" />
                </Columns>
            </asp:GridView>
           

            <asp:SqlDataSource ID="studentData" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="SELECT * FROM Events WHERE (Id IN (SELECT EventID FROM Registered WHERE (StudentName = @myname)))">
                <SelectParameters>
                    <asp:Parameter Name="myname" DbType="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div class="alert alert-success text-center">
                <strong>
                    <asp:Label Text="Event Selected:" runat="server" ID="myLabel" Visible="false" Font-Size="Large" />&nbsp;<asp:Label Text="" runat="server" ID="myLab" Font-Size="Large" />
                </strong>
                </div>
            <br />
            <asp:Button Text="Delete Selected" runat="server" OnClick="Del_Click" ID="buttondel" CssClass="btn btn-danger button"/>
            <br />
        </div>



        <div class="modal fade" id="delModal" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">

                        <h4 class="modal-title text-danger mr-auto">Selected Event Deleted</h4>
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

</asp:Content>