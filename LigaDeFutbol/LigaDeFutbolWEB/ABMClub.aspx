<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ABMClub.aspx.cs" Inherits="ABMClub" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        &nbsp;<asp:Label ID="LblAdminClub" runat="server" Font-Size="X-Large" Text="Administrar Clubes"></asp:Label>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;<asp:Button ID="BtnVerClubes" runat="server" Text="Ver clubes inscriptos" OnClick="BtnVerClubes_Click" />
&nbsp;<asp:Button ID="BtnNuevoClub" runat="server" Text="Nuevo club" OnClick="BtnNuevoClub_Click" />
        &nbsp;<br />
        <br />
        <asp:GridView ID="GridClubes" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridClubes_SelectedIndexChanged" style="margin-left: 22px" Width="265px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="idClub" HeaderText="Id" />
                <asp:BoundField DataField="nombreClub" HeaderText="Nombre" />
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        &nbsp;<asp:Panel ID="PanelDatosClub" runat="server" Height="424px" style="margin-bottom: 45px; margin-top: 40px;">
            
            <br />
            &nbsp; Datos del Club<br /> <br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Id Club:<asp:TextBox ID="TxtIdClubDatos" runat="server"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nombre:<asp:TextBox ID="TxtNombreClub" runat="server" style="margin-left: 0px"></asp:TextBox>
            <br />
            <br />
            &nbsp; Fecha de fundación:<asp:TextBox ID="TxtFechaFund" runat="server"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cancha:<asp:DropDownList ID="DdlCancha" runat="server" ValidationGroup="Guardar"  Height="16px" Width="123px">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                    <asp:ListItem Value="1">Selected</asp:ListItem>
                </asp:DropDownList>
            <br />
            <br />
            <asp:Panel ID="PanelDomicilioClub" runat="server" BorderStyle="Ridge" Height="72px" style="margin-left: 12px" Width="472px">
                Domicilio Sede<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Calle:<asp:TextBox ID="TxtCalleDomicilioClub" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Número:<asp:TextBox ID="TxtNumDomicilioClub" runat="server" Width="51px"></asp:TextBox>
                <br />
            </asp:Panel>
            <br />
            &nbsp;&nbsp;<asp:CheckBox ID="ChkPrimeraVez" runat="server" Text="Primera vez en el torneo " TextAlign="Left" />
            <br />
            &nbsp;<br />
            <br />
            <asp:Button ID="BtnGuardarClub" runat="server" OnClick="BtnGuardarClub_Click" style="margin-left: 193px" Text="Guardar" Width="157px" />
            &nbsp;<asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" OnClick="BtnCancelar_Click" Width="138px" />
      
    </asp:Panel>
    <br />

</asp:Content>

