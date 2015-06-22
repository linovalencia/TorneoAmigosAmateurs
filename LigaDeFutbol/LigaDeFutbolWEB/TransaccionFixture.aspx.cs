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
    //    camp = CampeonatoDAL.buscarCampeonatosPorId(i);
        txtFechaInicio.Text = camp.fechaInicio.ToString();

      //  gvEquipos.DataSource = FixtureDAL.buscarInscripcionesPorCampeonato(i);
        gvEquipos.DataKeyNames = new string[] { "idClub" };
        gvEquipos.DataBind();

        txtNumClubes.Text = gvEquipos.Rows.Count.ToString();
    }

    protected void gvEquipos_SelectedIndexChanged(object sender, EventArgs e)
    {
        ////
        //// Se define una lista temporal de registro seleccionados
        ////
        //List<DataGridItem> filaSeleccionada = new List<DataGridItem>();

        ////
        //// Se recorre ca registro de la grilla de origen
        ////
        //foreach (DataGridItem row in gvEquipos.Rows)
        //{
        //    filaSeleccionada.Add(row);
        //}

        ////
        //// Se agrega el item seleccionado a la grilla de destino
        //// eliminando la fila de la grilla original
        ////
        //foreach (DataGridItem row in filaSeleccionada)
        //{
        //    gvPartidos.Rows.Add(new object[] {false,
        //                                    row.Cells[1];
        //    gvPartidos.row
        //    dgvProductos.Rows.Remove(row);
        //}
        //gvEquipos.DeleteRow(gvEquipos.SelectedRow.RowIndex);
    }
}