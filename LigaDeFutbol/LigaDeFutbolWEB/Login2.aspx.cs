using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LigaDeFutbolDAL;
using LigaDeFutbolDTO;
using System.Security;
using System.Web.Security;
public partial class Login2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        string usuario =Login1.UserName.ToString();
        string password= Login1.Password.ToString();
        string rol;

        Session.Add("user",usuario);
        Session.Add("pass",password);

        if(UsuarioDAL.validarUsuario(usuario,password)==true)
        {
            rol=UsuarioDAL.buscarRol(usuario,password);
        }
        
        else 
        {
            rol="anonimo";
        }

        FormsAuthenticationTicket autTicket = new FormsAuthenticationTicket(1, Login1.UserName.ToString(), DateTime.Now, DateTime.Now.AddMinutes(60), false, rol);
        string encrAuthTick = FormsAuthentication.Encrypt(autTicket);
        HttpCookie autCookie = new HttpCookie(".Test", encrAuthTick);
            
        Response.Redirect(FormsAuthentication.GetRedirectUrl(Login1.UserName.ToString(),false));

    }
}