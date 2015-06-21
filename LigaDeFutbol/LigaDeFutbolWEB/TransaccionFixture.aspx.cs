using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LigaDeFutbolDAL;
using LigaDeFutbolDTO;

public partial class TransaccionFixture : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CargarComboTorneos();
        }   
    }

    private void CargarComboTorneos()
    {
        ddlTorneos.DataSource = CampeonatoDAL.obtenerCampeonatos();
        ddlTorneos.DataTextField = "nombre";
        ddlTorneos.DataValueField = "idCampeonato";
        ddlTorneos.DataBind();
        ddlTorneos.TabIndex = 0;
    }

    protected void ddlTorneos_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtId.Text = ddlTorneos.SelectedItem.Value.ToString();

        CampeonatoDTO camp = new CampeonatoDTO();
        int i = int.Parse(ddlTorneos.SelectedItem.Value.ToString());
        camp = CampeonatoDAL.buscarCampeonatosPorId(i);
        txtFechaInicio.Text = camp.fechaInicio.ToString();

        //InscripcionDTO ins = new InscripcionDTO();   
        //ins=FixtureDAL.buscarInscripcionesPorCampeonato(i);
        //gvEquipos.DataSource = ClubDAL.buscarClubPorId(ins.idClub);
        ////gvEquipos.DataKeyNames = new string[] { "idClub" };
        //gvEquipos.DataBind();

        gvEquipos.DataSource = FixtureDAL.buscarInscripcionesPorCampeonato(i);
        //gvEquipos.DataKeyNames = new string[] { "idClub" };
        gvEquipos.DataBind();
    }
}