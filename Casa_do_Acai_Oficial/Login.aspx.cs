using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Web.Services;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    protected static String ReCaptcha_Key = "6LeVDr4ZAAAAAIlwbRdNXOHyg3S0SgY_HzFOcG2R";
    protected static String ReCaptcha_Secret = "6LeVDr4ZAAAAABRLyjixpCyIytS9GJRDjLxOvhIt";

    Criptografia cripto = new Criptografia("ETEP");

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    [WebMethod]
    public static string VerifyCaptcha(string response)
    {
        string url = "https://www.google.com/recaptcha/api/siteverify?secret=" + ReCaptcha_Secret + "&response=" + response;
        return (new WebClient()).DownloadString(url);
    }

    protected void btnEntrar_Click(object sender, EventArgs e)
    {
        DataView listaLogin;

        DSLogin.SelectParameters["LOGIN"].DefaultValue = cripto.Encrypt(txtLogin.Text);
        DSLogin.SelectParameters["SENHA"].DefaultValue = cripto.Encrypt(txtSenha.Text);

        listaLogin = (DataView)DSLogin.Select(DataSourceSelectArguments.Empty);

        if (listaLogin.Table.Rows.Count > 0)
        {
            Session["Logado"]     = "Entrou";
            Session["idCli"]      = listaLogin.Table.Rows[0]["id_cli"].ToString();
            Session["nomeCli"]    = cripto.Decrypt(listaLogin.Table.Rows[0]["nome_cli"].ToString());
            Session["novaCompra"] = "Sim";
            Response.Redirect("Menu_Logado.aspx");
        }
        else
        {
            Response.Write("<script>alert('Login ou Senha Incorretos !');</script>");

            txtSenha.Text = "";            
        }
    }
}