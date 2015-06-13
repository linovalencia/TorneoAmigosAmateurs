<%@ Application Language="C#" %>
<script runat="server">


    void Application_Start(object sender, EventArgs e) 
    {
        // Código que se ejecuta al iniciarse la aplicación

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Código que se ejecuta al cerrarse la aplicación

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Código que se ejecuta cuando se produce un error sin procesar

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Código que se ejecuta al iniciarse una nueva sesión

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Código que se ejecuta cuando finaliza una sesión. 
        // Nota: el evento Session_End se produce solamente con el modo sessionstate
        // se establece como InProc en el archivo Web.config. Si el modo de sesión se establece como StateServer
        // o SQLServer, el evento no se produce.

    }

    protected void Application_AuthenticateRequest(object sender, EventArgs e)
    {
        HttpCookie authCookie = Context.Request.Cookies[".Test"];
        if (null == authCookie)
        {
            // Si no existe termina
            return;
        }
        FormsAuthenticationTicket autTicket = null;
        try
        {
            autTicket = FormsAuthentication.Decrypt(authCookie.Value);
        }
        catch (Exception ex)
        {
            return;
        }

        if (null == autTicket)
        {
            // No se pudo desencriptar
            return;
        }
        // Separo los roles
        String[] roles = autTicket.UserData.Split(new char[] { '|' });
        // Creo un objeto Identity y lo vinculo al Context
        System.Security.Principal.GenericIdentity id = new System.Security.Principal.GenericIdentity(autTicket.Name);
        System.Security.Principal.GenericPrincipal principal = new System.Security.Principal.GenericPrincipal(id, roles);
        Context.User = principal;
    }
       
</script>
