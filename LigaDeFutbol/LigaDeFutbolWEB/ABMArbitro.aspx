﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ABMArbitro.aspx.cs" Inherits="ABMArbitro" EnableEventValidation="false" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('[id$=txtFechaNacimiento]').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: "dd-mm-yy",
                showAnim: 'slideDown'
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--<form runat="server">--%>
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4>Árbitro</h4>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="inputArbitro" class="col-md-4 control-label">
                                Tipo Documento
                            </label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="ddlTipoDocumento" CssClass="form-control" runat="server" AppendDataBoundItems="true">
                                    <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlTipoDocumento"
                                    ErrorMessage="Seleccione un Tipo de Documento" InitialValue="0" CssClass="alert-danger"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputArbitro" class="col-md-4 control-label">
                                Numero Documento</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtNroDocumetno" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="ValidacionCantidad" runat="server" ControlToValidate="txtNroDocumetno"
                                    CssClass="alert-danger" Display="Dynamic" ErrorMessage="Ingrese un Numero de documento Valido"
                                    ValidationExpression="[0-9]{1,9}(\[0-9]{0,2})?$"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="ValidacionCantidad2" runat="server" ControlToValidate="txtNroDocumetno"
                                    ErrorMessage="Ingrese un numero de documento" CssClass="alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputArbitro" class="col-md-4 control-label">
                                Apellido</label><div class="col-md-8">
                                    <asp:TextBox ID="txtApellido" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="validacionApellido" runat="server" ErrorMessage="Ingrese un Apellido valido"
                                        ControlToValidate="txtApellido" ValidationExpression="^[a-zA-Z ]*$" CssClass="alert-danger"
                                        Display="Dynamic"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtApellido"
                                        ErrorMessage="Ingrese un apellido" CssClass="alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                        </div>
                        <div class="form-group">
                            <label for="inputArbitro" class="col-md-4 control-label">
                                Nombre</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="validacionNombre" runat="server" ErrorMessage="Ingrese un nombre valido"
                                    ControlToValidate="txtNombre" ValidationExpression="^[a-zA-Z ]*$" CssClass="alert-danger"
                                    Display="Dynamic"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="validacionNombre2" runat="server" ControlToValidate="txtNombre"
                                    ErrorMessage="Ingrese un nombre" CssClass="alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                                  


                        <div class="form-group">
                            <label for="inputPassword3" class="col-md-4 control-label">
                                Fecha de nacimiento</label><div class="col-md-8">
                                    <asp:TextBox ID="txtFechaNacimiento" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:CompareValidator ID="validacionFecha" runat="server" ControlToValidate="txtFechaNacimiento"
                                        ErrorMessage="Ingrese una fecha valida" Operator="DataTypeCheck" Type="Date"
                                        CssClass="alert-danger" Display="Dynamic"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="validacionFecha2" runat="server" ControlToValidate="txtFechaNacimiento"
                                        ErrorMessage="Ingrese una fecha" CssClass="alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>                            
                        </div>
                        <div class="col-md-12 ">
                            <div class="panel panel-info">
                                <div class="panel-heading ">

                                    <h5>Esta Disponible ?
                                    </h5>

                                </div>
                                <div class="panel-body ">
                                    <div class="form-group ">
                                        <input type="radio" class="col-md-1" name="estaDisponible" id="rbtSi" runat="server" /></>
                                    <span class="label label-primary col-md-1">Si </span>
                                        <div>
                                            <input type="radio" class="col-md-1" name="estaDisponible" id="rbtNo" runat="server" /></>
                                        <span class="label label-primary col-md-1 ">No </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">

                            <div class="btn-group-lg text-center">

                                <asp:Button ID="btnNuevo" runat="server" class="btn btn-info" Text="Nuevo" OnClick="btnNuevo_Click"
                                    CausesValidation="False" />
                                <asp:Button ID="btnGrabar" runat="server" class="btn btn-success" Text="Grabar" OnClick="btnGrabar_Click" />
                                <asp:Button ID="btnEliminar" runat="server" class="btn btn-danger" Text="Eliminar"
                                    OnClick="btnEliminar_Click" CausesValidation="False" OnClientClick="return window.confirm('¿Desea eliminar el Arbitro?');" />
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

            <div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4>Listado de Árbitros</h4>
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
    <%-- </form>--%>
</asp:Content>
