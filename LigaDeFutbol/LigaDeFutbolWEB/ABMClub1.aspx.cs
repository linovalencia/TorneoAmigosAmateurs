using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LigaDeFutbolDAL;
using LigaDeFutbolDTO;

public partial class ABMClub1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CargarCombo();
            CargarGrilla();
        }
    }



    protected void gvClub_SelectedIndexChanged(object sender, EventArgs e)
    {
        int i = int.Parse(gvClub.SelectedDataKey.Value.ToString());
        ClubDTO c = new ClubDTO();

        c = ClubDAL.buscarClubPorId(i);
        txtNombre.Text = c.nombreClub;
        txtFechaFundacion.Text = c.fechaFundacion.ToShortDateString();
        ddlCancha.SelectedValue = c.idCancha.ToString();
        txtCalle.Text = c.calle;
        txtNro.Text = c.numeroCalle.ToString();

        if (c.participoAntesEnLiga == Boolean.Parse("true"))
        {
            rbtSi.Checked = true;
            rbtNo.Checked = false;
        }
        else
        {
            rbtNo.Checked = true;
            rbtSi.Checked = false;
        }
        ViewState["idClub"] = i;
        lblMensajeError.Text = "";
        lblMensajeExito.Text = "";



    }
    protected void gvClub_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvClub.PageIndex = e.NewPageIndex;
        CargarGrilla();

    }
    protected void btnNuevo_Click(object sender, EventArgs e)
    {
        lblMensajeExito.Text = "";
        lblMensajeError.Text = "";
        blanquearCampos();
        ViewState["idClub"] = null;

    }
    protected void btnGrabar_Click(object sender, EventArgs e)
    {
        ClubDTO club = new ClubDTO();

        club.nombreClub = txtNombre.Text;
        club.calle = txtCalle.Text;
        club.numeroCalle = int.Parse(txtNro.Text);
        if (txtFechaFundacion.Text == "")
        {
            club.fechaFundacion = DateTime.Parse(null);
        }
        else
        {
            club.fechaFundacion = DateTime.Parse(txtFechaFundacion.Text);
        }

        club.idCancha = int.Parse(ddlCancha.SelectedValue);
        if (rbtSi.Checked == true)
            club.participoAntesEnLiga = Boolean.Parse("true");
        else
            club.participoAntesEnLiga = Boolean.Parse("false");

        if (ViewState["idClub"] == null)
        {
            ClubDAL.insertarClub(club);
            lblMensajeExito.Text = "Club grabado con éxito, ID asignado:" + ClubDAL.obtenerIdClub().ToString();
        }
        else
        {
            club.idClub = (int)ViewState["idClub"];
            ClubDAL.actualizarClub(club);
            lblMensajeExito.Text = "Club actualizado con éxito";
        }

        blanquearCampos();
        CargarGrilla();
        ViewState["idClub"] = null;

        Response.Redirect("ABMClub1.aspx");



    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        String id;
        id = ClubDAL.obtenerIdClub().ToString();

        ClubDAL.eliminarClub(int.Parse(id));
        Response.Redirect("ABMClub1.aspx");

    }

    private void CargarGrilla()
    {
        gvClub.DataSource = ClubDAL.obtenerClubes();
        gvClub.DataKeyNames = new string[] { "idClub" };
        gvClub.DataBind();


    }
    private void CargarCombo()
    {
        ddlCancha.DataSource = CanchaDAL.obtenerCancha();
        ddlCancha.DataTextField = "nombreCancha";
        ddlCancha.DataValueField = "idCancha";
        ddlCancha.DataBind();
        ddlCancha.TabIndex = 0;
    }
    private void blanquearCampos()
    {
        txtNombre.Text = "";
        txtCalle.Text = "";
        txtFechaFundacion.Text = "";
        txtNro.Text = "";
        rbtNo.Checked = false;
        rbtSi.Checked = false;
        ddlCancha.SelectedIndex = 0;

    }
}