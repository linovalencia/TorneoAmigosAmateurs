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
      
        cargarGrilla();
        TxtIdCancha.Enabled = false;
        
    }
  
    protected void btnNuevo_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(CanchaDAL.ObtenerIDCancha());
        TxtIdCancha.Text = id.ToString();
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
            cargarGrilla();
        }
    }


    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        CanchaDAL.eliminarCancha(int.Parse(TxtIdCancha.Text));
        limpiarCampos();
        cargarGrilla();
        
    }
    //protected void gvClientes_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    CanchaDTO cancha = new CanchaDTO();

    //    int id = int.Parse(gvCancha.Rows[gvCancha.SelectedIndex].Cells[2].Text);
    //    cancha=CanchaDAL.buscarClubPorId(id);
    //    TxtIdCancha.Text = cancha.idCancha.ToString();
    //    txtNombre.Text = cancha.nombreCancha;
    //    txtCalle.Text = cancha.calle;
    //    txtNroCalle.Text = cancha.numeroCalle.ToString();
    //    txtFechaIn.Text = cancha.fechaInaguracion.ToString();
    //}
    public void limpiarCampos()
    {
        txtNombre.Text = "";
        txtCalle.Text = "";
        txtNroCalle.Text = "";
        txtFechaIn.Text = "";
    }

    public void cargarGrilla()
    {
        //gvCancha.DataSource = CanchaDAL.obtenerCancha();
        //gvCancha.DataBind();
    }
    protected void txtNombre_TextChanged(object sender, EventArgs e)
    {
        if(CanchaDAL.ExisteNombre(txtNombre.Text)==1)
        {
            existeCancha.Visible = true ;
        }
    }
}