<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ABMClub.aspx.cs" Inherits="ABMClub" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" Height="625px">
        Registro de nuevo club<br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nombre:<asp:TextBox ID="TextBox1" runat="server" style="margin-left: 15px"></asp:TextBox>
        <br />
        <br />
        Fecha de fundación:<asp:DropDownList ID="DropDownList1" runat="server" style="margin-left: 17px">
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList2" runat="server" style="margin-left: 7px">
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList3" runat="server" style="margin-left: 6px">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Panel ID="Panel2" runat="server" BorderStyle="Ridge" Height="72px" Width="455px">
            &nbsp; Domicilio Sede<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Calle:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Número:<asp:TextBox ID="TextBox3" runat="server" Width="51px"></asp:TextBox>
            <br />
        </asp:Panel>
        <br />
        <br />
        <asp:Panel ID="Panel3" runat="server" BorderStyle="Ridge" Height="185px" Width="543px">
            &nbsp; Cancha<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nombre:&nbsp;
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fecha de Inauguración:&nbsp;
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Calle:&nbsp;
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp; Número:&nbsp;
            <asp:TextBox ID="TextBox5" runat="server" Width="50px"></asp:TextBox>
            <br />
            <br />
            <br />
        </asp:Panel>
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" style="margin-left: 193px" Text="Guardar" Width="157px" />
    </asp:Panel>
    <br />
   











</asp:Content>

