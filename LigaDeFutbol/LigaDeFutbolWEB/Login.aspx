﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="css/bootsnipp.css" rel="stylesheet" />
    <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="email" id="inputEmail" class="form-control" placeholder="Dirección de Email" required="required" autofocus="autofocus"/>
                <input type="password" id="inputPassword" class="form-control" placeholder="Contraseña" required="required"/>
                <div id="remember" class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"/> Recordarme
                    </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Iniciar Sesion</button>
            </form><!-- /form -->
           <%-- <a href="#" class="forgot-password">
                Forgot the password?
            </a>--%>
        </div><!-- /card-container -->
    </div><!-- /container -->
</asp:Content>

