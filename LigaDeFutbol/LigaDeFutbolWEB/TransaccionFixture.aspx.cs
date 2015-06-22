using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LigaDeFutbolDAL;
using LigaDeFutbolDTO;
using System.Data;

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
    //    camp = CampeonatoDAL.buscarCampeonatosPorId(i);
        txtFechaInicio.Text = camp.fechaInicio.ToString();

      //  gvEquipos.DataSource = FixtureDAL.buscarInscripcionesPorCampeonato(i);
        gvEquipos.DataKeyNames = new string[] { "idClub" };
        gvEquipos.DataBind();

        txtNumClubes.Text = gvEquipos.Rows.Count.ToString();
    }



    protected void gvEquipos_SelectedIndexChanged(object sender, EventArgs e)
    {

        // Se define una lista temporal de registro seleccionados
        List<GridViewRow> rowSelected = new List<GridViewRow>();

        //acá quiero capturar la fila actual
        GridViewRow puntero = gvEquipos.SelectedRow;
        // Se recupera el campo/fila seleccionado y se agrega a la lista temporal
        rowSelected.Add(puntero);

        foreach (GridViewRow row in rowSelected)
        { //// Se agrega el item seleccionado a la grilla de destino
            DataTable dt = new DataTable();
            DataRow dr = dt.NewRow();
            dt.Rows.Add(new object[] { row.Cells[1].Text });

            gvPartidos.DataSource = dt;
            gvPartidos.DataBind();
        }
    }
}