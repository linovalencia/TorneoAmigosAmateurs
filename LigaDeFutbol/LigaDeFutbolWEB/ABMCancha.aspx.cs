using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LigaDeFutbolDTO.Entidad;
using LigaDeFutbolDAL.DAL;

public partial class ABMCancha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
  
    protected void btnNuevo_Click(object sender, EventArgs e)
    {

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
        CanchaDTO c = new CanchaDTO();
        //c.idCancha = int.Parse(txtIdCancha.Text);
        c.calle=txtCalle.Text.Trim();
        c.numeroCalle=int.Parse(txtNroCalle.Text.Trim());
        c.nombreCancha = txtNombre.Text.Trim();
        c.fechaInaguracion = DateTime.Parse(txtFechaIn.Text);
        //if (ChkHabilitada.Checked == true)
        //    c.habilitada = Boolean.Parse("true");
        //else
        //    c.habilitada = Boolean.Parse("false");



        CanchaDAL.insertarCancha(c);
        limpiarCampos();
    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {

    }
    protected void gvClientes_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void gvClientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }      
}