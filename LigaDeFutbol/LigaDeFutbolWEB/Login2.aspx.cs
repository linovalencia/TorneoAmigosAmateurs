using LigaDeFutbolDAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        string nombreUsuario = Login1.UserName.ToString();
        string password = Login1.Password.ToString();
        string roles;

        Session.Add("user", nombreUsuario);
        Session.Add("pass", password);

        if (UsuarioDAL.validarUsuario(nombreUsuario, password) == true)
        {
            roles = UsuarioDAL.buscarRol(nombreUsuario, password);

        }
        else
        {
            roles = "Anonimo";
        }



        if (Login1.UserName != "Impostor")
        {
            
            FormsAuthenticationTicket autTicket = new FormsAuthenticationTicket(1, Login1.UserName.ToString(), DateTime.Now, DateTime.Now.AddMinutes(60), false, roles);
            string encrAutTicket = FormsAuthentication.Encrypt(autTicket);
            HttpCookie autCookie = new HttpCookie(".Test", encrAutTicket);
            Response.Cookies.Add(autCookie);

            Response.Redirect(FormsAuthentication.GetRedirectUrl(Login1.UserName.ToString(), false));
        }
        else
        {
            e.Authenticated = false;
        }
    }
}