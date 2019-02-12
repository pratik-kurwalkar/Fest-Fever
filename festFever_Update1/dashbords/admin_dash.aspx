<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admin_dash.aspx.cs" Inherits="dashbords_admin_dash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainHead" runat="Server">
    <style type="text/css">
        .addbutt {
            display: block;
        }
    </style>
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
                </li>
            </ul>
        </nav>
        <br />
        <asp:Button Text="Add Event!" runat="server" ID="addButton" OnClick="addButton_Click" CssClass="btn btn-primary addbutt ml-auto mr-auto btn-lg" />
        <br />
                <h3 class="text-center text-warning">Registered Students:</h3>
                <asp:GridView ID="studentView" runat="server" AutoGenerateColumns="False" DataKeyNames="Enrollment" DataSourceID="studentSource" CssClass="table table-striped table-hover" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Enrollment" HeaderText="Enrollment" ReadOnly="True" SortExpression="Enrollment" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
                        <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" />
                        <asp:BoundField DataField="Branch" HeaderText="Branch" SortExpression="Branch" />
                        <asp:BoundField DataField="Coordinater" HeaderText="Coordinator" SortExpression="Coordinater" />
                        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:SqlDataSource ID="studentSource" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="SELECT Students.* FROM Students"></asp:SqlDataSource>
        <br />
                <h3 class="text-center text-info">Registered Faculty:</h3>
                <asp:GridView ID="facultyView" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="facultySource" ForeColor="#333333" GridLines="None" CssClass="table table-striped table-hover">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
                        <asp:BoundField DataField="Branch" HeaderText="Branch" SortExpression="Branch" />
                        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:SqlDataSource ID="facultySource" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="SELECT * FROM [Faculty]"></asp:SqlDataSource>

        <h3 class="text-center text-danger">Events:</h3>
                <asp:GridView ID="eventView" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="eventSource" ForeColor="#333333" GridLines="None" CssClass="table table-striped table-hover">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="EventName" HeaderText="Event Name" SortExpression="EventName" />
                        <asp:BoundField DataField="EventCoordinator" HeaderText="Event Coordinator" SortExpression="EventCoordinator" />
                        <asp:BoundField DataField="EventFaculty" HeaderText="Event Faculty" SortExpression="EventFaculty" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:BoundField DataField="EventStart" HeaderText="Event Start" SortExpression="EventStart" />
                        <asp:BoundField DataField="EventEnd" HeaderText="Event End" SortExpression="EventEnd" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:SqlDataSource ID="eventSource" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="SELECT * FROM [Events]"></asp:SqlDataSource>

    </form>

</asp:Content>

