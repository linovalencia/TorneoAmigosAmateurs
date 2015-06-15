using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LigaDeFutbolDTO;
using LigaDeFutbolDAL;

public partial class ABMCancha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

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

        CanchaDTO c = new CanchaDTO();

        c.calle = txtCalle.Text;
        c.numeroCalle = int.Parse(txtNroCalle.Text.Trim());
        c.nombreCancha = txtNombre.Text.Trim();
        c.fechaInaguracion = DateTime.Parse(txtFechaIn.Text);

        if (rbtSi.Checked == true)
            c.habilitada = Boolean.Parse("true");
        else
            c.habilitada = Boolean.Parse("false");

        if (ViewState["idCancha"] == null)
        {
            CanchaDAL.insertarCancha(c);

            lblMensajeExito.Text = "Cancha grabada con éxito, ID asignado:" + CanchaDAL.ObtenerIDCancha().ToString();
        }
        else
        {
            c.idCancha = (int)ViewState["idCancha"];
            CanchaDAL.actualizarCancha(c);
            lblMensajeExito.Text = "Cancha actualizada con éxito";

        }

        limpiarCampos();
        CargarGrilla();
        ViewState["idCancha"] = null;

        Response.Redirect("ABMCancha.aspx");
    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        String id;
        id = CanchaDAL.ObtenerIDCancha().ToString();

        CanchaDAL.eliminarCancha(int.Parse(id));
        Response.Redirect("ABMCancha.aspx");
    }
    protected void gvCanchas_SelectedIndexChanged(object sender, EventArgs e)
    {
        int i = int.Parse(gvCanchas.SelectedDataKey.Value.ToString());
        CanchaDTO c = new CanchaDTO();

        c = CanchaDAL.buscarCanchaPorId(i);

        txtNombre.Text = c.nombreCancha;
        txtCalle.Text = c.calle;
        txtNroCalle.Text = c.numeroCalle.ToString();
        txtFechaIn.Text = c.fechaInaguracion.ToShortDateString();
        if (c.habilitada == Boolean.Parse("true"))
        {
            rbtSi.Checked = true;
            rbtNo.Checked = false;
        }
        else
        {
            rbtNo.Checked = true;
            rbtSi.Checked = false;
        }
        ViewState["idCancha"] = i;
        lblMensajeError.Text = "";
        lblMensajeExito.Text = "";
    }
    protected void gvCanchas_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvCanchas.PageIndex = e.NewPageIndex;
        CargarGrilla();

    }
    public void limpiarCampos()
    {
        txtCalle.Text = "";
        txtFechaIn.Text = "";
        txtNombre.Text = "";
        txtNroCalle.Text = "";
    }
    public void CargarGrilla()
    {

        gvCanchas.DataSource = CanchaDAL.obtenerCancha();
        gvCanchas.DataKeyNames = new string[] { "idCancha" };
        gvCanchas.DataBind();

    }
    /*protected void txtNombre_TextChanged(object sender, EventArgs e)
    {
        if (CanchaDAL.ExisteNombre(txtNombre.Text) == 1)
        {
            existeNombre.ErrorMessage.Trim();
        }
    }*/
}

