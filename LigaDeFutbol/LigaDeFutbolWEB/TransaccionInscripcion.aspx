<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TransaccionInscripcion.aspx.cs" Inherits="TransaccionInscripcion" %>

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
    <div class="container">
        <div class="row">
            <%--       <form id="ForTransaccionInscripcion" class="form-horizontal" role="form" runat="server">--%>
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4>Inscripciones</h4>
                    </div>
                    <div class="panel-body">


                        <div class="col-md-8">                        
                            <div class="form-group">
                                <label for="transaccionInscripcion" class="col-md-3 control-label">
                                    Fecha de Inscripción</label>
                                <div class="col-md-9">
                                    <fieldset disabled>
                                        <asp:TextBox ID="txtFechaIn" CssClass="form-control" runat="server"></asp:TextBox>
                                    </fieldset>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="transaccionInscripcion" class="col-md-3 control-label">
                                    Club
                                </label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlClub" CssClass="form-control" runat="server" AutoPostBack="True"
                                        AppendDataBoundItems="true" OnSelectedIndexChanged="ddlClub_SelectedIndexChanged"
                                        Display="Dynamic">
                                        <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlClub"
                                        ErrorMessage="seleccione un club" InitialValue="0" CssClass="alert-danger"
                                        Display="Dynamic" ValidationGroup="inscripcion"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="transaccionInscripcion" class="col-md-3 control-label">
                                    Campeonato
                                </label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlCampeonato" CssClass="form-control" runat="server" AutoPostBack="True"
                                        AppendDataBoundItems="true" OnSelectedIndexChanged="ddlCampeonato_SelectedIndexChanged"
                                        Display="Dynamic">
                                        <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlCampeonato"
                                        ErrorMessage="Seleccione un campeonato" InitialValue="0" CssClass="alert-danger"
                                        Display="Dynamic" ValidationGroup="inscripcion"></asp:RequiredFieldValidator>
                                </div>
                            </div>


                        </div>
                        <div class="col-md-12">
                            <div class="panel panel-info">
                                <div class="panel-heading  small">
                                    <h5>Jugadores</h5>
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="inputCliente" class="col-md-3 control-label">
                                                Apellido
                                            </label>
                                            <div class="col-md-7">
                                                <asp:TextBox ID="txtApellido" CssClass="form-control" runat="server"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="validacionApellido" runat="server" ErrorMessage="Ingrese un Apellido valido"
                                                    ControlToValidate="txtApellido" ValidationExpression="^[a-zA-Z ]*$" CssClass="alert-danger"
                                                    Display="Dynamic" ValidationGroup="jugador"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtApellido"
                                                    ErrorMessage="Ingrese un apellido" CssClass="alert-danger" Display="Dynamic"
                                                    ValidationGroup="jugador"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputCliente" class="col-md-3 control-label">
                                                Nombre
                                            </label>
                                            <div class="col-md-7">
                                                <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="validacionNombre" runat="server" ErrorMessage="Ingrese un nombre valido"
                                                    ControlToValidate="txtNombre" ValidationExpression="^[a-zA-Z ]*$" CssClass="alert-danger"
                                                    Display="Dynamic" ValidationGroup="jugador"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="validacionNombre2" runat="server" ControlToValidate="txtNombre"
                                                    ErrorMessage="Ingrese un nombre" CssClass="alert-danger" Display="Dynamic" ValidationGroup="jugador"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-6">

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
                                        <div class="btn-group-lg text-center">
                                            <asp:Button ID="btnAgregar" runat="server" class="btn btn-info" Text="Agregar" OnClick="btnAgregar_Click"
                                                ValidationGroup="jugador" />
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>



                        <div class="col-md-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4>Detalle de Inscripción
                                    </h4>
                                </div>
                                <div class="panel-body">
                                    <asp:GridView ID="gvJugadores" runat="server" CssClass="table table-hover table-striped"
                                        GridLines="None" AutoGenerateColumns="False" OnSelectedIndexChanged="gvJugadores_SelectedIndexChanged">
                                        <Columns>
                                            <asp:CommandField SelectText="Eliminar" ShowSelectButton="True" />
                                            <asp:BoundField DataField="apellido" HeaderText="Apellido       " />
                                            <asp:BoundField DataField="nombre" HeaderText="Nombre       " />
                                            <asp:BoundField HeaderText="Nº Documento" DataField="numeroDocumento" />
                                            <asp:BoundField HeaderText="Fecha Nacimiento" DataField="fechaNacimiento" DataFormatString="{0:d}" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>



                        
                            <div class="col-md-12">
                                <div class="btn-group-lg text-center">
                                    <asp:Button ID="btnRegistrar" runat="server" class="btn btn-success" Text="Registrar"
                                        OnClick="btnRegistrar_Click" ValidationGroup="inscripcion" />

                                    <asp:Button ID="btnCancelar" runat="server" class="btn btn-danger" Text="Cancelar"
                                        CausesValidation="False" OnClick="btnCancelar_Click" OnClientClick="return window.confirm('¿Desea cancelar la registro de la inscripcion?');" />
                                </div>
                            </div>
                        

                        <div class="col-md-12">
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
            <%--      </form>--%>
        </div>

    </div>


</asp:Content>

