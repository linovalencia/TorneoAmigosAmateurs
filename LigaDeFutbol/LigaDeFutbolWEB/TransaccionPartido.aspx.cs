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
        if (!Page.IsPostBack)
        {
            CargarComboFechas();
            CargarComboEstadoFecha();
        }
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

   

    //protected void btnRegistrarResultado_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        FechaCampeonato fe = new FechaCampeonato();
    //        fe.idEstado = int.Parse(ddlEstadoFecha.SelectedItem.Value);


    //        int i = int.Parse(gvPartido.SelectedDataKey.Value.ToString());
            

            
    //        PartidoDTO pa = new PartidoDTO();
    //        Partidos = ResultadoPartidoDAL.obtenerPartidosDeFechaXPorId(i);

    //        pa.idPartido = ;
           
    //        Partidos.Add(pa);

    //        ResultadoPartidoDAL.insertarResultados(fe,Partidos);

    //        lblMensajeExito.Text = "Inscripción grabada con exito";
    //    }
    //    catch (ApplicationException ex)
    //    {
    //        lblMensajeError.Text = ex.Message;
    //    }

    //}

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
            int i = int.Parse(ddlFechas.SelectedItem.Value);

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


  
    private void CargarComboEstadoPartido() 
    {
        DropDownList ddl=(DropDownList)gvPartido.FindControl("ddlEstadoPartido");
        ddl.DataSource=EstadoFechaDAL.obtenerEstadoFecha();
        
        ddl.DataTextField = "descripcion";
        ddl.DataValueField = "idEstado";
        ddl.DataBind();
        ddl.TabIndex = 0;
    }

    protected void gvPartido_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ddlEstadoPartido_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }
  
    protected void ddlFechas_SelectedIndexChanged(object sender, EventArgs e)
    {
        CargarGrillaPartidos();
        CargarComboEstadoPartido();
    }
}