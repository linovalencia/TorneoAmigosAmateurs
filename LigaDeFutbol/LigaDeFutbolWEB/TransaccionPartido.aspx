﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TransaccionPartido.aspx.cs" Inherits="TransaccionPartido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
            <div class="row">
                <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4>Partido</h4>
                        </div>
                        <div class="panel-body">
                            <%--<div class="col-md-12">--%>
                                <div class="col-md-6">

                                    <div class="form-group">
                                        <label for="transaccionPartido" class="col-md-3 control-label">
                                            Fecha N°</label><div class="col-md-9">
                                            <asp:DropDownList ID="ddlFechas" CssClass="form-control" runat="server" AutoPostBack="True"
                                                AppendDataBoundItems="true" 
                                                Display="Dynamic" OnSelectedIndexChanged="ddlFechas_SelectedIndexChanged">
                                                <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlFechas"
                                                ErrorMessage="seleccione una fecha" InitialValue="0" CssClass="alert-danger"
                                                Display="Dynamic" ValidationGroup="fecha"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                        <div class="form-group">
                                        <label for="transaccionPartido" class="col-md-3 control-label">
                                            Estado Fecha</label><div class="col-md-9">
                                            <asp:DropDownList ID="ddlEstadoFecha" CssClass="form-control" runat="server" AutoPostBack="True"
                                                AppendDataBoundItems="true" 
                                                Display="Dynamic">
                                                <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlFechas"
                                                ErrorMessage="seleccione un estado" InitialValue="0" CssClass="alert-danger"
                                                Display="Dynamic" ValidationGroup="fecha"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                     
                                  

                                </div>

                                <div class="form-group">
                                    <label for="transaccionPartido" class="col-md-3 control-label">
                                            Partidos Jugados
                                        </label>

                                    <asp:GridView ID="gvPartido" runat="server" CssClass="table table-hover table-striped"
                                        GridLines="None" AutoGenerateColumns="False" OnSelectedIndexChanged="gvPartido_SelectedIndexChanged">
                                        <Columns>
                                            <asp:BoundField DataField="idPartido" HeaderText="ID       " />
                                            <asp:BoundField DataField="nombreClubLocal" HeaderText="Club Local       " />
                                             <asp:BoundField DataField="nombreClubVisitante" HeaderText="Club Visitante       " />

                                            <asp:TemplateField HeaderText="Goles Local">
                                                <AlternatingItemTemplate>
                                                    Club Local
                                                </AlternatingItemTemplate>
                                                <EditItemTemplate>
                                                    Club Visitante
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    Goles Visitante
                                                </FooterTemplate>
                                                <HeaderTemplate>
                                                    Goles Local
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    ID
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Goles Visitante">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtGolesVisitante" runat="server"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="fechaPartido" HeaderText="Fecha" />
                                            <asp:BoundField DataField="horaPartido" HeaderText="Hora" />
                                            <asp:TemplateField HeaderText="Estado">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlEstadoPartido" runat="server" OnSelectedIndexChanged="ddlEstadoPartido_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            <div class="form-group">

                            <div class="btn-group-lg text-center">
                                <asp:Button ID="btnGrabar" runat="server" class="btn btn-success" Text="Grabar"/> 
                            </div>
                               
                            <%--</div>--%>
                            <div class="btn-group-lg text-center">
                                <h3>
                                    <asp:Label ID="lblMensajeExito" class="label label-success" runat="server"></asp:Label></h3>
                                <h3>
                                    <asp:Label ID="lblMensajeError" class="label label-danger" runat="server"></asp:Label></h3>
                            </div>
                        </div>
                    </div>

            </div>
    </div>
    </div>
</asp:Content>

