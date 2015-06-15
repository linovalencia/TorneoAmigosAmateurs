using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LigaDeFutbolDAL;
using LigaDeFutbolDTO;

public partial class ABMArbitro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CargarComboTipoDocumento();
            CargarGrilla();
        }
    }
    protected void btnNuevo_Click(object sender, EventArgs e)
    {
        lblMensajeExito.Text = "";
        lblMensajeError.Text = "";
        limpiarCampos();
        ViewState["idArbitro"] = null;
    }
    protected void btnGrabar_Click(object sender, EventArgs e)
    {

        ArbitroDTO ar = new ArbitroDTO();

        ar.idTipoDocumento = int.Parse(ddlTipoDocumento.SelectedValue);
        ar.numeroDocumento = int.Parse(txtNroDocumetno.Text);
        ar.apellido = txtApellido.Text;
        ar.nombre = txtNombre.Text;
        ar.fechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);

        if (rbtSi.Checked == true)
            ar.disponibleParaFecha = Boolean.Parse("true");
        else
            ar.disponibleParaFecha = Boolean.Parse("false");

        if (ViewState["idArbitro"] == null)
        {
            ArbitroDAL.InsertarArbitro(ar);

            lblMensajeExito.Text = "Arbitro grabado con éxito, ID asignado:" + ArbitroDAL.obtenerIdArbitro().ToString();
        }
        else
        {
            ar.idArbitro = (int)ViewState["idArbitro"];
            ArbitroDAL.actualizarArbitro(ar);
            lblMensajeExito.Text = "Arbitro actualizado con éxito";

        }
        limpiarCampos();
        CargarGrilla();
        ViewState["idArbitro"] = null;

        Response.Redirect("ABMArbitro.aspx");



    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        String id;
        id = ArbitroDAL.obtenerIdArbitro().ToString();

        ArbitroDAL.eliminarArbitro(int.Parse(id));
        Response.Redirect("ABMArbitro.aspx");
    }
    protected void gvArbitros_SelectedIndexChanged(object sender, EventArgs e)
    {
        int i = int.Parse(gvArbitros.SelectedDataKey.Value.ToString());
        ArbitroDTO a = new ArbitroDTO();

        a = ArbitroDAL.buscarArbitroPorId(i);

        ddlTipoDocumento.SelectedValue = a.idTipoDocumento.ToString();
        txtNroDocumetno.Text = a.numeroDocumento.ToString();
        txtApellido.Text = a.apellido;
        txtNombre.Text = a.nombre;
        txtFechaNacimiento.Text = a.fechaNacimiento.ToShortDateString();
        if (a.disponibleParaFecha == Boolean.Parse("true"))
        {
            rbtSi.Checked = true;
            rbtNo.Checked = false;
        }
        else
        {
            rbtNo.Checked = true;
            rbtSi.Checked = false;
        }

        ViewState["idArbitro"] = i;
        lblMensajeError.Text = "";
        lblMensajeExito.Text = "";

    }
    protected void gvArbitros_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvArbitros.PageIndex = e.NewPageIndex;
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
    public void CargarGrilla()
    {
        gvArbitros.DataSource = ArbitroDAL.obtenerArbitro();
        gvArbitros.DataKeyNames = new string[] { "idArbitro" };
        gvArbitros.DataBind();

    }
    private void CargarComboTipoDocumento()
    {
        ddlTipoDocumento.DataSource = TipoDocumentoDAL.ObtenerTodo();
        ddlTipoDocumento.DataTextField = "descripcion";
        ddlTipoDocumento.DataValueField = "idTipoDocumento";
        ddlTipoDocumento.DataBind();
        ddlTipoDocumento.TabIndex = 0;

    }
    }