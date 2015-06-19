﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TransaccionFixture.aspx.cs" Inherits="TransaccionFixture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <div class="container">
            <div class="row">
                <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4>Fixture</h4>
                        </div>
                        <div class="panel-body">
                            <div class="col-md-12">
                                <div class="col-md-6">

                                    <div class="form-group">
                                        <label for="transaccionFixture" class="col-md-3 control-label">
                                            Torneo</label><div class="col-md-9">
                                            <asp:DropDownList ID="ddlTorenos" CssClass="form-control" runat="server" AutoPostBack="True"
                                                AppendDataBoundItems="true" OnSelectedIndexChanged="ddlTorneos_SelectedIndexChanged"
                                                Display="Dynamic">
                                                <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlTorneos"
                                                ErrorMessage="seleccione un torneo" InitialValue="0" CssClass="alert-danger"
                                                Display="Dynamic" ValidationGroup="inscripcion"></asp:RequiredFieldValidator>
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
                                        GridLines="None" AutoGenerateColumns="False" OnSelectedIndexChanged="gvEquipos_SelectedIndexChanged">
                                        <Columns>
                                            <asp:BoundField DataField="idClub" HeaderText="ID       " />
                                            <asp:BoundField DataField="nombreClub" HeaderText="Nombre       " />
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
                        <div class="panel-heading">
                            <h4>Partidos</h4>
                        </div>
                        <div class="panel-body">
                            <asp:GridView ID="gvArbitros" runat="server" CssClass="table table-hover table-striped"
                                GridLines="None" AutoGenerateColumns="False" DataKeyNames="legajo"
                                OnSelectedIndexChanged="gvArbitros_SelectedIndexChanged" AllowPaging="True"
                                PageSize="15" OnPageIndexChanging="gvArbitros_PageIndexChanging" Width="438px">
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="idArbitro" HeaderText="Id" />
                                    <asp:BoundField DataField="apellido" HeaderText="Apellido       " />
                                    <asp:BoundField DataField="nombre" HeaderText="Nombre       " />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>                
            </div>
        </div>
    </form>
</asp:Content>