using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LigaDeFutbolDAL;
using System.Data;
using System.Data.SqlClient;
using LigaDeFutbolDTO;

public partial class ABMArbitro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {           
           CargarComboTipoDocumnto();
           cargarGrilla();
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

    public void cargarGrilla()
    {
        gvClientes.DataSource = ArbitroDAL.obtenerArbitro();
        gvClientes.DataBind();

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
        btnGrabar.Text = "Grabar";
        limpiarCampos();
    }
    protected void btnGrabar_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if(btnGrabar.Text=="Grabar")
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
            cargarGrilla();
            //Response.Redirect("ABMArbitro.aspx");
            }
            if(btnGrabar.Text=="Modificar")
            {
                ArbitroDTO ar = new ArbitroDTO();
                ar.idTipoDocumento = int.Parse(ddlTipoDocumento.SelectedValue);
                ar.numeroDocumento = int.Parse(txtNroDocumetno.Text);
                ar.apellido = txtApellido.Text;
                ar.nombre = txtNombre.Text;
                ar.fechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);
                ar.legajo = int.Parse(txtLegajo.Text);
                // ar.disponibleParaFehca = ChkPrimeraVez.Checked;
                ArbitroDAL.actualizarArbitro(ar);
                limpiarCampos();
                cargarGrilla();
            }
        }
    }


    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        ArbitroDAL.eliminarArbitro(int.Parse(txtLegajo.Text));
        limpiarCampos();
        cargarGrilla();

    }
    protected void gvClientes_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnGrabar.Text = "Modificar";
        ArbitroDTO a = new ArbitroDTO();
        int legajo = int.Parse(gvClientes.Rows[gvClientes.SelectedIndex].Cells[1].Text);
        a = ArbitroDAL.buscarArbitroPorLegajo(legajo);
        ddlTipoDocumento.SelectedValue = a.idTipoDocumento.ToString();
        txtNroDocumetno.Text = a.numeroDocumento.ToString();
        txtApellido.Text = a.apellido;
        txtNombre.Text = a.nombre;
        txtFechaNacimiento.Text=a.fechaNacimiento.ToString();
        txtLegajo.Text=a.legajo.ToString();
        
    }
    protected void gvClientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
       
    }      
}