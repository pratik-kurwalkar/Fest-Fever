<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainHead" runat="Server">
    <style type="text/css">

        #img1 {
        position:absolute;
        top:200px;
        left:50px;
        }
        #img2 {
        position:absolute;
        top:200px;
        left:1000px;
        }
        .myclass {
        position:absolute;

        left:50%;
        transform:translateY(-50%);
        transform:translateX(-50%);
        }
    </style>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="MainBody" runat="Server">
    <img src="images/vector-gif-firework-6.gif" id="img1" />
    <div class="myclass">
        <img src="../images/trans_logo.png" class="mainimg animated zoomIn" />

        <h1 class="text-center animated zoomIn" style="font-family: 'Righteous', cursive; font-size: 70px; color: #ff6666;">FESTFEVER</h1>
    </div>
    <img src="images/vector-gif-firework-6.gif" id="img2"/>
</asp:Content>
