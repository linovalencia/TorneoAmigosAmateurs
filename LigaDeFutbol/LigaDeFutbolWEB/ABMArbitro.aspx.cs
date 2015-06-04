using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LigaDeFutbolDAL.DAL;
using System.Data;
using System.Data.SqlClient;
using LigaDeFutbolDTO.Entidad;

public partial class ABMArbitro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {           
           CargarComboTipoDocumnto();            
        } 

        

    }

    public void limpiarCampos()
    {
        ddlTipoDocumento.SelectedIndex=0;
        txtNroDocumetno.Text="";
        txtApellido.Text="";
        txtNombre.Text="";
        txtFechaNacimiento.Text="";
        txtLegajo.Text="";
    
    }
    private void CargarComboTipoDocumnto()
    {
        ddlTipoDocumento.DataSource = TipoDocumentoDAL.ObtenerTodo();
        ddlTipoDocumento.DataTextField = "descripcion";
        ddlTipoDocumento.DataValueField = "idTipoDocumento";
        ddlTipoDocumento.DataBind();
        ddlTipoDocumento.TabIndex = 0;

    }


    protected void btnNuevo_Click(object sender, EventArgs e)
    {

    }
    protected void btnGrabar_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            ArbitroDTO ar = new ArbitroDTO();
            ar.idTipoDocumento = int.Parse(ddlTipoDocumento.SelectedValue);
            ar.numeroDocumento = int.Parse(txtNroDocumetno.Text);
            ar.apellido = txtApellido.Text;
            ar.nombre = txtNombre.Text;
            ar.fechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);
            ar.legajo = int.Parse(txtLegajo.Text);
            // ar.disponibleParaFehca = ChkPrimeraVez.Checked;
            ArbitroDAL.InsertarArbitro(ar);
            limpiarCampos();
            Response.Redirect("ABMArbitro.aspx");
        }
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