<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TransaccionFixture.aspx.cs" Inherits="TransaccionFixture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <%--  <form runat="server">--%>
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4>Fixture</h4>
                        </div>
                        <div class="panel-body">

                                    <div class="form-group">
                                        <label for="transaccionFixture" class="col-md-3 control-label">
                                            Torneo</label><div class="col-md-9">
                                            <asp:DropDownList ID="ddlTorneos" CssClass="form-control" runat="server" AutoPostBack="True"
                                                AppendDataBoundItems="true" 
                                                Display="Dynamic" OnSelectedIndexChanged="ddlTorneos_SelectedIndexChanged">
                                                <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                                            </asp:DropDownList>
                                         <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlTorneos"
                                                ErrorMessage="seleccione un torneo" InitialValue="0" CssClass="alert-danger"
                                                Display="Dynamic" ValidationGroup="inscripcion"></asp:RequiredFieldValidator>--%>
                                        </div>
                                    </div>

                                     <div class="form-group">
                                        <label for="transaccionFixture" class="col-md-3 control-label">
                                            ID Torneo
                                        </label>
                                        <div class="col-md-9">
                                            <fieldset disabled>
                                                <asp:TextBox ID="txtId" CssClass="form-control" runat="server"></asp:TextBox>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="transaccionFixture" class="col-md-3 control-label">
                                            Fecha de Incio</label>
                                        <div class="col-md-9">
                                                <fieldset disabled>
                                                    <asp:TextBox ID="txtFechaInicio" CssClass="form-control" runat="server"></asp:TextBox>
                                                </fieldset>
                                            </div>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label for="transaccionFixture" class="col-md-3 control-label">
                                            Clubes inscriptos
                                        </label>
                                    <asp:GridView ID="gvEquipos" runat="server" CssClass="table table-hover table-striped"
                                        GridLines="None" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:BoundField DataField="idClub" HeaderText="ID" />
                                            <asp:CommandField SelectText="Agregar" ShowSelectButton="True" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div class="form-group">
                                        <label for="transaccionFixture" class="col-md-3 control-label">
                                            Nº de clubes inscriptos</label>
                                        <div class="col-md-9">
                                                <fieldset disabled>
                                                    <asp:TextBox ID="txtNumClubes" CssClass="form-control" runat="server"></asp:TextBox>
                                                </fieldset>
                                            </div>
                                    </div>
                            <div class="btn-group-lg text-center">
                                <h3>
                                    <asp:Label ID="lblMensajeExito" class="label label-success" runat="server"></asp:Label></h3>
                                <h3>
                                    <asp:Label ID="lblMensajeError" class="label label-danger" runat="server"></asp:Label></h3>
                            </div>
                        </div>
                    </div>

                <div class="col-md-6">
                    <div class="panel panel-primary">
                         <div class="form-group">
                                        <label for="transaccionFixture" class="col-md-3 control-label">
                                            Fecha Nº</label>
                                        <div class="col-md-9">
                                                <fieldset disabled>
                                                    <asp:TextBox ID="txtFechaNum" CssClass="form-control" runat="server"></asp:TextBox>
                                                </fieldset>
                                            </div>
                                    </div>
                         <div class="form-group">
                                        <label for="transaccionFixture" class="col-md-3 control-label">
                                            Comienza</label>
                                        <div class="col-md-9">
                                                <fieldset enabled>
                                                    <asp:TextBox ID="txtFechaComienzo" CssClass="form-control" runat="server"></asp:TextBox>
                                                </fieldset>
                                            </div>
                                    </div>
                        <div class="panel-heading">
                            <h4>Partidos</h4>
                        </div>
                        <div class="panel-body">
                            <asp:GridView ID="gvPartidos" runat="server" CssClass="table table-hover table-striped"
                                GridLines="None" AutoGenerateColumns="False" AllowPaging="True"
                                PageSize="15" Width="438px">
                                <Columns>
                                    <asp:BoundField HeaderText="Local" />
                                    <asp:BoundField HeaderText="Visitante" />
                                    <asp:TemplateField HeaderText="Arbitro">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="DdlArbitro" runat="server">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cancha">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="DdlCancha" runat="server">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Fecha" ApplyFormatInEditMode="True" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>                
            </div>
    <%--</form>--%>
</asp:Content>
