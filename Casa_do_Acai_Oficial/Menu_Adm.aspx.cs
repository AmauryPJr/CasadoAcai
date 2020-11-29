using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Menu_Adm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adm"] == null || Session["adm"].Equals("Saiu"))
            Response.Redirect("Menu.aspx");

        else
            lblBemVindo.Text = "Bem-Vindo ADM !";
    }
}