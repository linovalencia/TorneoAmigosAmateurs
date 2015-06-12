using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LigaDeFutbolDAL;
using LigaDeFutbolDTO;

public partial class ABMClub : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            PanelDatosClub.Visible = false;
            BtnEliminar.Visible = false;
            BtnModificar.Visible = false;
            LblNombreYaUsado.Visible = false;
          
            DdlCancha.DataSource = CanchaDAL.obtenerCancha();
            DdlCancha.DataTextField = "nombreCancha";
            DdlCancha.DataValueField = "idCancha";
            DdlCancha.DataBind();
        }
    }

    protected void BtnNuevoClub_Click(object sender, EventArgs e)
    {
        PanelDatosClub.Visible = true;
    }
    protected void BtnGuardarClub_Click(object sender, EventArgs e)
    {
        if (Page.IsValid && ClubDAL.ComprobarNombreClubExiste(TxtNombreClub.Text) == 0)
        {
            ClubDTO club = new ClubDTO();

            club.nombreClub = TxtNombreClub.Text;
            club.calle = TxtCalleDomicilioClub.Text;
            club.numeroCalle = int.Parse(TxtNumDomicilioClub.Text);
            club.fechaFundacion = DateTime.Parse(TxtFechaFund.Text);
            club.idCancha = int.Parse(DdlCancha.SelectedItem.Value);
            club.participoAntesEnLiga = ChkPrimeraVez.Checked;
           
            ClubDAL.insertarClub(club);
            Response.Redirect("ABMClub.aspx");
        }
        else
        {
            TxtNombreClub.Text ="";
            TxtNombreClub.Focus();
            LblNombreYaUsado.Visible = true;
        }
    }


    protected void BtnVerClubes_Click(object sender, EventArgs e)
    {
        GridClubes.DataSource = ClubDAL.obtenerClubes();
        GridClubes.DataBind();
        BtnEliminar.Visible = true;
        BtnModificar.Visible = true;
    }

    protected void BtnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("ABMClub.aspx");
    }
    protected void GridClubes_SelectedIndexChanged(object sender, EventArgs e)
    {
        ClubDTO c =new ClubDTO();
        int i = int.Parse(GridClubes.Rows[GridClubes.SelectedIndex].Cells[0].Text);
        c=ClubDAL.buscarClubPorId(i);
        TxtIdClubDatos.Text = c.idClub.ToString();
        TxtNombreClub.Text= c.nombreClub;
        TxtFechaFund.Text = c.fechaFundacion.ToString();
        DdlCancha.SelectedValue = c.idCancha.ToString();
        TxtCalleDomicilioClub.Text = c.calle;
        TxtNumDomicilioClub.Text = c.numeroCalle.ToString();
         PanelDatosClub.Visible = true;
    }
    protected void BtnEliminar_Click(object sender, EventArgs e)
    {
        ClubDAL.eliminarClub(int.Parse(TxtIdClubDatos.Text));
        Response.Redirect("ABMClub.aspx");
    }
    protected void BtnModificar_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            ClubDTO club = new ClubDTO();

            club.idClub = int.Parse(TxtIdClubDatos.Text);
            club.nombreClub = TxtNombreClub.Text;
            club.calle = TxtCalleDomicilioClub.Text;
            club.numeroCalle = int.Parse(TxtNumDomicilioClub.Text);
            club.fechaFundacion = DateTime.Parse(TxtFechaFund.Text);
            if (ChkPrimeraVez.Checked == true)
                club.participoAntesEnLiga = Boolean.Parse("true");
            else
                club.participoAntesEnLiga = Boolean.Parse("false");
            
            club.idCancha = int.Parse(DdlCancha.SelectedValue);
            club.idClub = int.Parse(TxtIdClubDatos.Text);
            ClubDAL.actualizarClub(club);
            Response.Redirect("ABMClub.aspx");
        }
    }
  
    protected void TxtNombreClub_TextChanged(object sender, EventArgs e)
    {
        if (ClubDAL.ComprobarNombreClubExiste(TxtNombreClub.Text) == 1)
        {
            LblNombreYaUsado.Visible = true;
        }
        else
        {
            LblNombreYaUsado.Visible = false;
        }
        //sdsdsdsdsd
    }
}