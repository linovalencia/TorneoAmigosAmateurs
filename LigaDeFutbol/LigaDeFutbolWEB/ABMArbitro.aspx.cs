using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LigaDeFutbolDAL.DAL;
using System.Data;
using System.Data.SqlClient;

public partial class ABMArbitro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {           
           CargarComboTipoDocumnto();            
        } 

        /*
        // Establece el string de conexión
        string cadenaConexion = "Data Source=MARCIO-PC/SQLEXPRESS;Initial Catalog=LigaDeFutbol;Integrated Security=True";
        //Data Source=MARCIO-PC\SQLEXPRESS;Initial Catalog=LigaDeFutbol;Integrated Security=True

        // Establece la consulta SQL a ejecutar
        string consulta = "SELECT * FROM tipo_documento";

        // Crea un DataAdapter que será el encargado de ejecutar la consulta
        // y Posteriormente ingresar los datos a un DataSet
        SqlDataAdapter daAutores = new SqlDataAdapter(consulta, cadenaConexion);
        // Crea el DataSet
        DataSet dsAutores = new DataSet();
        // Llena el DataSet con la información de la base de datos
        daAutores.Fill(dsAutores, "tipo_documento");
        // Pone el DataTable Authors como fuente de datos para el DropDownList
        ddlTipoDocumento.DataSource = dsAutores.Tables["tipo_documento"].DefaultView;
        // Asigna el valor a mostrar en el DropDownList
        ddlTipoDocumento.DataTextField = "descripcion";
        // Asigna el valor del value en el DropDownList
        ddlTipoDocumento.DataValueField = "idTipoDocumento";
        // Llena el DropDownList con los datos
        ddlTipoDocumento.DataBind();*/
   

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