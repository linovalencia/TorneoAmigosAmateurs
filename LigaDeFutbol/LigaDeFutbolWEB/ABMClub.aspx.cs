using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LigaDeFutbolDAL.DAL;
using LigaDeFutbolDTO.Entidad;

public partial class ABMClub : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            PanelDatosClub.Visible = false;
        }
    }
    protected void BtnBuscarClub_Click(object sender, EventArgs e)
    {
        GridView1.DataSource = ClubDAL.buscarClubPorId(int.Parse(TxtIdClubBuscar.Text));
        GridView1.DataBind();
    }
    protected void BtnNuevoClub_Click(object sender, EventArgs e)
    {
        PanelDatosClub.Visible = true;
    }
    protected void BtnGuardarClub_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            ClubDTO club = new ClubDTO();

            club.nombreClub = TxtNombreClub.Text;
            club.calle = TxtCalleDomicilioClub.Text;
            club.numeroCalle = int.Parse(TxtNumDomicilioClub.Text);
            club.fechaFundacion = DateTime.Parse(TxtFechaFund.Text);
            club.idCancha = 0;
            club.participoAntesEnLiga = ChkPrimeraVez.Checked;
           
            ClubDAL.insertarClub(club);
            Response.Redirect("Login.aspx");
        }
    }

}