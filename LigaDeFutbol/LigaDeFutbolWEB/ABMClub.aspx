<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ABMClub.aspx.cs" Inherits="ABMClub" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        &nbsp;<asp:Label ID="LblAdminClub" runat="server" Font-Size="X-Large" Text="Administrar Clubes"></asp:Label>
        <br />
        <br />
        &nbsp;Id Club:&nbsp;&nbsp;<asp:TextBox ID="TxtIdClubBuscar" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="BtnBuscarClub" runat="server" Text="Buscar" OnClick="BtnBuscarClub_Click" />
&nbsp;<asp:Button ID="BtnNuevoClub" runat="server" Text="NuevoClub" OnClick="BtnNuevoClub_Click" />
        &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idClub" DataSourceID="SqlDataSource1" style="margin-left: 12px" Width="402px" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="idClub" HeaderText="idClub" InsertVisible="False" ReadOnly="True" SortExpression="idClub" />
                <asp:BoundField DataField="nombreClueb" HeaderText="nombreClueb" SortExpression="nombreClueb" />
                <asp:BoundField DataField="calle" HeaderText="calle" SortExpression="calle" />
                <asp:BoundField DataField="numeroCalle" HeaderText="numeroCalle" SortExpression="numeroCalle" />
                <asp:BoundField DataField="fechaFundacion" HeaderText="fechaFundacion" SortExpression="fechaFundacion" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LigaDeFutbolConnectionString1 %>" SelectCommand="SELECT [idClub], [nombreClub], [calle], [numeroCalle], [fechaFundacion] FROM [club]"></asp:SqlDataSource>
        <asp:Panel ID="PanelDatosClub" runat="server" Height="424px" style="margin-bottom: 45px; margin-top: 40px;">
            &nbsp; Datos del Club<br /> <br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Id Club:<asp:TextBox ID="TxtIdClubDatos" runat="server"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nombre:<asp:TextBox ID="TxtNombreClub" runat="server" style="margin-left: 0px"></asp:TextBox>
            <br />
            <br />
            &nbsp; Fecha de fundación:<asp:TextBox ID="TxtFechaFund" runat="server"></asp:TextBox>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cancha:<asp:DropDownList ID="DdlCancha" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombreCancha" DataValueField="nombreCancha">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LigaDeFutbolConnectionString1 %>" SelectCommand="SELECT [nombreCancha] FROM [cancha]"></asp:SqlDataSource>
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
            <asp:Button ID="BtnGuardarClub" runat="server" style="margin-left: 193px" Text="Guardar" Width="157px" OnClick="BtnGuardarClub_Click" />
      
    </asp:Panel>
    <br />

</asp:Content>

