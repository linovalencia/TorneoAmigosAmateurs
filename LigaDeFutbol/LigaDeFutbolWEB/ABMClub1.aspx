<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ABMClub1.aspx.cs" Inherits="ABMClub1"      %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<form runat="server">--%>
        <div class="container">
            <div class="row">

                <div class="col-lg-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4>Club</h4>
                        </div>
                        <div class="panel-body">
                            <%--<form class='form-horizontal' role='form'>--%>
                            <div class="form-group">
                                <label for="inputClub" class="col-md-4 control-label">
                                    Nombre</label><div class="col-md-8">
                                        <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Ingrese un Nombre valido"
                                            ControlToValidate="txtNombre" ValidationExpression="^[a-zA-Z ]*$" CssClass="alert-danger"
                                            Display="Dynamic"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombre"
                                            ErrorMessage="Ingrese un nombre" CssClass="alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                            </div>
                            <div class="form-group">
                                <label for="inputClub" class="col-md-4 control-label">
                                    Calle</label><div class="col-md-8">
                                        <asp:TextBox ID="txtCalle" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Ingrese una Calle valida"
                                            ControlToValidate="txtCalle" ValidationExpression="^[a-zA-Z ]*$" CssClass="alert-danger"
                                            Display="Dynamic"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCalle"
                                            ErrorMessage="Ingrese una calle" CssClass="alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                            </div>
                            <div class="form-group">
                                <label for="inputClub" class="col-md-4 control-label">
                                    Numero</label><div class="col-md-8">
                                        <asp:TextBox ID="txtNro" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtNro"
                                            CssClass="alert-danger" Display="Dynamic" ErrorMessage="ingrese un número valido"
                                            ValidationExpression="[0-9]{1,9}(\[0-9]{0,2})?$"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtNro"
                                            ErrorMessage="ingrese un numero" CssClass="alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                            </div>



                            <div class="form-group">
                                <label for="inputClub" class="col-md-4 control-label">
                                    Fecha de fundación</label><div class="col-md-8">
                                        <asp:TextBox ID="txtFechaFundacion" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:CompareValidator ID="validacionFecha" runat="server" ControlToValidate="txtFechaFundacion"
                                            ErrorMessage="Ingrese una fecha valida" Operator="DataTypeCheck" Type="Date"
                                            CssClass="alert-danger" Display="Dynamic"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="validacionFecha2" runat="server" ControlToValidate="txtFechaFundacion"
                                            ErrorMessage="Ingrese una fecha" CssClass="alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                            </div>

                            <div class="form-group">
                                <label for="inputClub" class="col-md-4 control-label">
                                    Cancha
                                </label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlCancha" CssClass="form-control" runat="server" AppendDataBoundItems="true">
                                        <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlCancha"
                                        ErrorMessage="Seleccione una Cancha" InitialValue="0" CssClass="alert-danger"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>


                            <div class="col-md-12 ">
                                <br />


                                <div class="panel panel-info">
                                    <div class="panel-heading ">

                                        <h5>Participó antes en el Torneo ?
                                        </h5>

                                    </div>
                                    <div class="panel-body ">
                                        <div class="form-group ">
                                            <input type="radio" class="col-md-1" name="aParticiado" id="rbtSi" runat="server" /></>
                                    <span class="label label-primary col-md-1">Si </span>
                                            <div>
                                                <input type="radio" class="col-md-1" name="aParticiado" id="rbtNo" runat="server" /></>
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
                                        OnClick="btnEliminar_Click" CausesValidation="False" OnClientClick="return window.confirm('¿Desea eliminar el Club?');" />
                                </div>


                            </div>
                            <%-- </form>--%>
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
                            <h4>Listado de Clubes</h4>
                        </div>
                        <div class="panel-body">
                            <asp:GridView ID="gvClub" runat="server" CssClass="table table-hover table-striped"
                                GridLines="None" AutoGenerateColumns="False"
                                OnSelectedIndexChanged="gvClub_SelectedIndexChanged" AllowPaging="True"
                                PageSize="15" OnPageIndexChanging="gvClub_PageIndexChanging" Width="438px">
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="idClub" HeaderText="idClub" />
                                    <asp:BoundField DataField="nombreClub" HeaderText="Nombre" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                -
            </div>
        </div>
   <%-- </form>--%>
</asp:Content>

