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
            CargarComboCampeonato();
            txtFechaIn.Text = DateTime.Today.ToShortDateString();
        }

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

            j.nombre = txtNombre.Text;
            j.apellido = txtApellido.Text;
            j.idTipoDocumento = int.Parse(ddlTipoDocumento.SelectedValue);
            j.numeroDocumento = int.Parse(txtNroDocumetno.Text);
            j.fechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);

            DetalleInscripcionDTO detalle = new DetalleInscripcionDTO();
            detalle.idJugador = j.idJugador;
            detalle.idDetalleInscripcion = -1;
            detalle.idInscripcion = -1;
            Detalles.Add(detalle);

            Jugadores.Add(j);


        }
        catch (ApplicationException ex)
        {
            lblMensajeError.Text = ex.Message;
        }


        limpiarCampos();

        CargarGrilla();

    }
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        lblMensajeError.Text = String.Empty;
        lblMensajeExito.Text = String.Empty;
        try
        {
            InscripcionDTO inscripcion = new InscripcionDTO();
            inscripcion.fechaInscripcion = DateTime.Today;
            inscripcion.idCampeonato = int.Parse(ddlCampeonato.SelectedItem.Value);
            inscripcion.idClub = int.Parse(ddlClub.SelectedItem.Value);
            InscripcionDAL.insertarInscripcion(inscripcion, Detalles, Jugadores);

            Detalles = new List<DetalleInscripcionDTO>();
            Jugadores = new List<JugadorDTO>();

            lblMensajeExito.Text = "Inscripción grabada con exito";
        }
        catch (ApplicationException ex)
        {
            lblMensajeError.Text = ex.Message;
        }

    }

    public List<DetalleInscripcionDTO> Detalles
    {
        get
        {
            if (Session["detalles"] == null)
            {
                Session["detalles"] = new List<DetalleInscripcionDTO>();
            }
            return (List<DetalleInscripcionDTO>)Session["detalles"];
        }
        set
        {
            Session["detalles"] = value;
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
    private void CargarComboCampeonato()
    {
        ddlCampeonato.DataSource = CampeonatoDAL.obtenerCampeonatos();
        ddlCampeonato.DataTextField = "nombre";
        ddlCampeonato.DataValueField = "idCampeonato";
        ddlCampeonato.DataBind();
        ddlCampeonato.TabIndex = 0;

    }


    protected void ddlClub_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void ddlCampeonato_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}