<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ABMCancha.aspx.cs" Inherits="ABMCancha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .table-striped {}
        .panel-primary {
            width: 459px;
            margin-right: 119px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
    <div class="row">
         
        <div class="col-lg-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4>Cancha</h4>
                </div>

                <div class="panel-body">
                    <form class='form-horizontal' role='form'>
                         <div class="form-group">
                                <label for="inputCliente" class="col-md-4 control-label">
                                     Id Cancha</label>
                            <div class="col-md-8">
                                    <asp:TextBox ID="TxtIdCancha" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                         </div>


                <div class="panel-body">
                    <form class='form-horizontal' role='form'>
                         <div class="form-group">
                            <label for="inputCliente" class="col-md-4 control-label">
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

                            <label for="inputCliente" class="col-md-4 control-label">
                                Calle</label><div class="col-md-8">
                                    <asp:TextBox ID="txtCalle" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Ingrese una Calle valida"
                                        ControlToValidate="txtCalle" ValidationExpression="^[a-zA-Z ]*$" CssClass="alert-danger"
                                        Display="Dynamic"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCalle"
                                        ErrorMessage="Ingrese una calle" CssClass="alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                        </div>

                       
                        <div class="form-group">
                            <label for="inputCliente" class="col-md-4 control-label">
                                Numero</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtNroCalle" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="ValidacionCantidad" runat="server" ControlToValidate="txtNroCalle"
                                    CssClass="alert-danger" Display="Dynamic" ErrorMessage="Ingrese un Numero de calle Valido"
                                    ValidationExpression="[0-9]{1,9}(\[0-9]{0,2})?$"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="ValidacionCantidad2" runat="server" ControlToValidate="txtNroCalle"
                                    ErrorMessage="Ingrese un numero de calle" CssClass="alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        
                       
                        <div class="form-group">
                            <label for="inputPassword3" class="col-md-4 control-label">
                                Fecha de inauguracion</label><div class="col-md-8">
                                    <asp:TextBox ID="txtFechaIn" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:CompareValidator ID="validacionFecha" runat="server" ControlToValidate="txtFechaIn"
                                        ErrorMessage="Ingrese una fecha valida" Operator="DataTypeCheck" Type="Date"
                                        CssClass="alert-danger" Display="Dynamic"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="validacionFecha2" runat="server" ControlToValidate="txtFechaIn"
                                        ErrorMessage="Ingrese una fecha" CssClass="alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                        </div>
                     
                        
                        <div class="form-group">
                            
                            <div class="btn-group-lg text-center">
                         
                                <asp:Button ID="btnNuevo" runat="server" class="btn btn-info" Text="Nuevo" OnClick="btnNuevo_Click"
                                    CausesValidation="False" />
                                <asp:Button ID="btnGrabar" runat="server" class="btn btn-success" Text="Grabar" OnClick="btnGrabar_Click" />
                                <asp:Button ID="btnEliminar" runat="server" class="btn btn-danger" Text="Eliminar"
                                    OnClick="btnEliminar_Click" CausesValidation="False" OnClientClick="return window.confirm('¿Desea eliminar el Cliente?');" />
                            </div>
                                

                        </div>
                            </form>
                   
                         


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
                    <h4 style="width: 397px">
                        Listado de Canchas</h4>
                </div>
                <div class="panel-body">
                    <%--  <asp:GridView ID="gvCancha" runat="server" CssClass="table table-hover table-striped"
                        GridLines="None" AutoGenerateColumns="False" 
                        OnSelectedIndexChanged="gvCancha_SelectedIndexChanged" AllowPaging="True" 
                        PageSize="15" OnPageIndexChanging="gvCancha_PageIndexChanging" Width="438px">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="idCancha" HeaderText="idCancha" Visible="false" />
                              <asp:BoundField DataField="idCancha" HeaderText="idCancha" />
                            <asp:BoundField DataField="nombreCancha" HeaderText="Nombre" />
                            <asp:BoundField DataField="fechaInaguracion" HeaderText="Fecha Inaguración" />
                          <%--  <asp:BoundField DataField="apellido" HeaderText="Apellido       " />
                            <asp:BoundField DataField="nombre" HeaderText="Nombre       " />--%>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    -</div>
    </div>
</asp:Content>

