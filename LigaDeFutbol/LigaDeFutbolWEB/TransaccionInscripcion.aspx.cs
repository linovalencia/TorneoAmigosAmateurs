using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LigaDeFutbolDAL;
using LigaDeFutbolDTO;

public partial class TransaccionInscripcion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CargarComboTipoDocumento();
            CargarComboClub();
        }

    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {

    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {

    }
    protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddlLocalidad_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ddlClub_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void gvJugadores_SelectedIndexChanged(object sender, EventArgs e)
    {
        int idJugador = int.Parse(gvJugadores.SelectedDataKey.Value.ToString());


        foreach (JugadorDTO de in Jugadores)
        {
            if (de.idJugador == idJugador)
            {
                Jugadores.Remove(de);
                break;
            }

        }

        CargarGrilla();

    }
    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            JugadorDTO j = new JugadorDTO();
            j.idJugador = Jugadores.Count;
            j.nombre = txtNombre.Text;
            j.apellido = txtApellido.Text;
            j.idTipoDocumento = int.Parse(ddlTipoDocumento.SelectedValue);
            j.numeroDocumento = int.Parse(txtNroDocumetno.Text);
            j.fechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);

            Jugadores.Add(j);

        }
        catch (ApplicationException ex)
        {
            lblMensajeError.Text = ex.Message;
        }


        limpiarCampos();

        CargarGrilla();

    }
    public void limpiarCampos()
    {
        ddlTipoDocumento.SelectedIndex = 0;
        txtNroDocumetno.Text = "";
        txtApellido.Text = "";
        txtNombre.Text = "";
        txtFechaNacimiento.Text = "";
    }

    private void CargarGrilla()
    {
        try
        {
            gvJugadores.DataSource = Jugadores;
            gvJugadores.DataKeyNames = new string[] { "idJugador" };
            gvJugadores.DataBind();
        }
        catch (ApplicationException ex)
        {
            lblMensajeError.Text = ex.Message;
        }
    }

    public List<JugadorDTO> Jugadores
    {
        get
        {
            if (Session["jugadores"] == null)
            {
                Session["jugadores"] = new List<JugadorDTO>();
            }
            return (List<JugadorDTO>)Session["jugadores"];
        }
        set
        {
            Session["jugadores"] = value;
        }
    }
    private void CargarComboTipoDocumento()
    {
        ddlTipoDocumento.DataSource = TipoDocumentoDAL.ObtenerTodo();
        ddlTipoDocumento.DataTextField = "descripcion";
        ddlTipoDocumento.DataValueField = "idTipoDocumento";
        ddlTipoDocumento.DataBind();
        ddlTipoDocumento.TabIndex = 0;

    }

    private void CargarComboClub()
    {
        ddlClub.DataSource = ClubDAL.obtenerClubes();
        ddlClub.DataTextField = "nombreClub";
        ddlClub.DataValueField = "idClub";
        ddlClub.DataBind();
        ddlClub.TabIndex = 0;

    }
}