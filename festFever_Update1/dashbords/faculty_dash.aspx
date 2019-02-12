<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="faculty_dash.aspx.cs" Inherits="dashbords_faculty_dash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainHead" runat="Server">
    <style type="text/css">
        .table {
            border-radius: 10px;
        }

        .button {
            display: block;
            margin: 0 auto;
            width: 20%;
        }

        .mytext {
            font-size: 20px;
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
        <h1 class="text-center" style="font-family: 'Righteous', cursive; color: #ff6666;">Faculty Dashboard</h1>
        <br />
        <div class="container jumbotron">
            <asp:Label Text="&lt;h2 class='text-center'&gt;No student registered for event!&lt;/h2&gt;" runat="server" Visible="False" ID="colabel" CssClass="text-danger" />
            <br />

            <div class="mytext">
                 <asp:Label Text="Event ID:" runat="server" Visible="false" ID="e_id" />&nbsp;&nbsp;<asp:Label Text="" runat="server" ID="e_id_acutual" />
                <br />
                <asp:Label Text="Event Name:" runat="server" Visible="false" ID="e_name" />&nbsp;&nbsp;<asp:Label Text="" runat="server" ID="e_name_acutual" />
                <br />
                <asp:Label Text="Event Coordinator:" runat="server" Visible="false" ID="e_fac" />&nbsp;&nbsp;<asp:Label Text="" runat="server" ID="e_fac_acutual" />
                <br />
                <asp:Label Text="Event Start:" runat="server" Visible="false" ID="e_start" />&nbsp;&nbsp;<asp:Label Text="" runat="server" ID="e_start_acutual" />
                <br />
                <asp:Label Text="Event End:" runat="server" Visible="false" ID="e_end" />&nbsp;&nbsp;<asp:Label Text="" runat="server" ID="e_end_acutual" />
                <br />
                <br />
                <asp:Label Text="Registered Students:" runat="server" ID="e_reg" Visible="false" />
                <br />
            </div>

            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="coordData" CssClass="table table-striped table-hover" OnSelectedIndexChanged="LinkButton1_Click">
                <Columns>
                    <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                    <asp:BoundField DataField="Branch" HeaderText="Branch" SortExpression="Branch" />
                    <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" />
                    <asp:CommandField HeaderText="Select" ShowHeader="True" ShowSelectButton="True" ControlStyle-CssClass="btn btn-primary" />
                </Columns>
            </asp:GridView>
            <br />
                        <div class="alert alert-success text-center">
                <strong>
                    <asp:Label Text="Selected Student:" runat="server" ID="myLabel" Visible="false" Font-Size="Large" />&nbsp;<asp:Label Text="" runat="server" ID="myLab" Font-Size="Large" />
                </strong>
                </div>

            <br />
            <asp:Button Text="Delete Selected" runat="server" OnClick="Del_Click" ID="buttondel" CssClass="btn btn-danger button" />
            <br />
            <asp:SqlDataSource ID="coordData" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="SELECT  StudentName, Branch, Class FROM Registered WHERE (EventID IN (SELECT Id FROM Events WHERE (EventFaculty = @myname)))">
                <SelectParameters>
                    <asp:Parameter Name="myname" />
                </SelectParameters>
            </asp:SqlDataSource>

            
        <div class="modal fade" id="delModal" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">

                        <h4 class="modal-title text-danger mr-auto">Selected Student Entry Deleted!</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="Button6" runat="server" Text="Home" OnClick="Button3_Click" CssClass="btn btn-warning text-center" CausesValidation="False" />
                        <asp:Button ID="Button7" runat="server" Text="Back" OnClick="Button4_Click" CssClass="btn btn-primary text-center" CausesValidation="False" />
                    </div>
                </div>
            </div>
        </div>
        </div>
    </form>
</asp:Content>



