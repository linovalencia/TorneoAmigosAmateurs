using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LigaDeFutbolDAL;
public partial class TransaccionPartido : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CargarCombo();

    }

    private void CargarCombo()
    {
        ddlFechas.DataSource = ResultadoPartidoDAL.obtenerFechas();
        ddlFechas.DataValueField = "idFechaCampeonato";
        ddlFechas.DataTextField = "numeroFecha";
        ddlFechas.DataBind();
        ddlFechas.TabIndex = 0;
    }
}