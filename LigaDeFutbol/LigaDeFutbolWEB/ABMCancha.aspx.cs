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
      gvCancha.DataSource = CanchaDAL.obtenerCancha();
        gvCancha.DataBind();
        TxtIdCancha.Enabled = false;
        
    }
  
    protected void btnNuevo_Click(object sender, EventArgs e)
    {
        //int id = CanchaDAL.buscarIDCancha();
        //TxtIdCancha.Text = id.ToString();
    }

    public void limpiarCampos() 
    {
        txtNombre.Text = "";
        txtCalle.Text = "";
        txtNroCalle.Text = "";
        txtFechaIn.Text = "";
    }
    protected void btnGrabar_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            CanchaDTO c = new CanchaDTO();

            c.calle = txtCalle.Text.Trim();
            c.numeroCalle = int.Parse(txtNroCalle.Text.Trim());
            c.nombreCancha = txtNombre.Text.Trim();
            c.fechaInaguracion = DateTime.Parse(txtFechaIn.Text);
            //if (ChkHabilitada.Checked == true)
            //    c.habilitada = Boolean.Parse("true");
            //else
            //    c.habilitada = Boolean.Parse("false");



            CanchaDAL.insertarCancha(c);
            limpiarCampos();
        }
    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        CanchaDAL.eliminarCancha(int.Parse(TxtIdCancha.Text));

        
    }
    protected void gvClientes_SelectedIndexChanged(object sender, EventArgs e)
    {
        CanchaDTO cancha = new CanchaDTO();

        int id = int.Parse(gvCancha.Rows[1].Cells.ToString());
        CanchaDAL.buscarClubPorId(id);
        TxtIdCancha.Text = cancha.idCancha.ToString();
        txtNombre.Text = cancha.nombreCancha;
        txtCalle.Text = cancha.calle;
        txtNroCalle.Text = cancha.numeroCalle.ToString();
        txtFechaIn.Text = cancha.fechaInaguracion.ToString();
    }
    protected void gvClientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }      
}