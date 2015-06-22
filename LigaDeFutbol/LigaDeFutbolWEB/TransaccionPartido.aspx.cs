using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LigaDeFutbolDAL;
using LigaDeFutbolDTO;
public partial class TransaccionPartido : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CargarComboFechas();
        CargarComboEstadoFecha();
    }

    private void CargarComboFechas()
    {
        ddlFechas.DataSource = ResultadoPartidoDAL.obtenerFechas();
        ddlFechas.DataTextField = "numeroFecha";
        ddlFechas.DataValueField = "idFechaCampeonato";
        ddlFechas.DataBind();
        ddlFechas.TabIndex = 0;
    }

    private void CargarComboEstadoFecha()
    {
        ddlEstadoFecha.DataSource = EstadoFechaDAL.obtenerEstadoFecha();
        ddlEstadoFecha.DataTextField = "descripcion";
        ddlEstadoFecha.DataValueField = "idEstado";
        ddlEstadoFecha.DataBind();
        ddlEstadoFecha.TabIndex = 0;

    }

    protected void ddlFechas_SelectedIndexChanged(object sender, EventArgs e)
    {

        CargarGrillaPartidos();
        
    }

    protected void btnRegistrarResultado_Click(object sender, EventArgs e)
    {
        try
        {
            FechaCampeonato fe = new FechaCampeonato();
            fe.idEstado = ddlEstadoFecha.SelectedItem.Value;


            int i = int.Parse(gvPartido.SelectedDataKey.Value.ToString());
            

            
            PartidoDTO pa = new PartidoDTO();
            pa = ResultadoPartidoDAL.(i)
            pa.idPartido = j.idJugador;
            detalle.idDetalleInscripcion = -1;
            detalle.idInscripcion = -1;
            Detalles.Add(detalle);

            ResultadoPartidoDAL.insertarResultados(fe,Partidos);

            lblMensajeExito.Text = "Inscripción grabada con exito";
        }
        catch (ApplicationException ex)
        {
            lblMensajeError.Text = ex.Message;
        }

    }

    public List<PartidoDTO> Partidos
    {
        get
        {
            if (Session["Partidos"] == null)
            {
                Session["Partidos"] = new List<PartidoDTO>();
            }
            return (List<PartidoDTO>)Session["Partidos"];
        }
        set
        {
            Session["Partidos"] = value;
        }
    }

    private void CargarGrillaPartidos()
      {
        try
        {
            int i = int.Parse(ddlFechas.SelectedItem.Value.ToString());

            //gvPartido.DataSource = ResultadoPartidoDAL.obtenerPartidosDeFechaXPorId(i);
            //gvPartido.DataBind();

            //gvPartido.DataSource = Partidos;
            gvPartido.DataSource = ResultadoPartidoDAL.obtenerPartidosDeFechaXPorId(i);
            gvPartido.DataKeyNames = new string[] { "idPartido" };
            gvPartido.DataBind();
        }
        catch (ApplicationException ex)
        {
            lblMensajeError.Text = ex.Message;
        }
    }


}