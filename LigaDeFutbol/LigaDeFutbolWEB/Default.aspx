<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="css/Style.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/Style.css" rel="stylesheet" />

    <div class="container">
        <div class="row">
            <div class="col-md-12 jumbotron">
                <div class="text-center">
                     <h1>Bienvenidos!</h1>
                    <p>Aquí podrás encontrar información para realizar la gestión de los campeonatos que organiza "Torneo de Amigos Amateurs" y se podran registrar los clubes participantes con todos sus jugadores. </p>                                   
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br /> 

    <div class="container">
      <!-- Example row of columns -->
      <div class="row" >
        <div class="col-md-4">
          <h2>Arbitro</h2>
          <p>En esta seccion se podrá realizar el alta, baja, modificación y consulta de los Árbitros</p>
          <p><a class="btn btn-default" href="ABMArbitro.aspx" role="button">CargarArbitro &raquo;</a></p>
        </div>
         
        <div class="col-md-4">
          <h2>Cancha</h2>
          <p>En esta se ccion se podrá realizar el alta, baja, modificación y consulta de las Canchas</p>
          <p><a class="btn btn-default" href="ABMCancha.aspx" role="button">Cargar Cancha &raquo;</a></p>
       </div>

        <div class="col-md-4">
          <h2>Club</h2>
          <p>En esta seccion se podrá realizar el alta, baja, modificación y consulta de los Clubes</p>
          <p><a class="btn btn-default" href="ABMClub.aspx" role="button">Cargar Club &raquo;</a></p>
        </div>
      </div>     
    </div> <!-- /container -->
       
   </asp:Content>

