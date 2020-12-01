using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Cadastro_Produto : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("ETEP");
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adm"] == null || Session["adm"].Equals("Saiu"))
            Response.Redirect("Menu.aspx");

        else
            return;
    }

    protected void btnCadastrar_Click(object sender, EventArgs e)
    {
        if (txtNome.Text == "" || txtTipo.Text == "" || txtPreço.Text == "")
            Response.Write("<script>alert('Favor preencher os campos obrigatórios !')</script>");

        else
        {
            int tipo_Prod_Int = 0;
            string tipo_Prod_Texto = txtTipo.Text;
            string tamanho = txtTamanho.Text;
            string preco = txtPreço.Text.Replace(',', '.');

            if (tamanho == "")
                DSCadastro.InsertParameters["TAMANHO"].DefaultValue = cripto.Encrypt("");

            else
                DSCadastro.InsertParameters["TAMANHO"].DefaultValue = cripto.Encrypt(tamanho);


            if (tipo_Prod_Texto == "Açaí")
                tipo_Prod_Int = 1;

            if (tipo_Prod_Texto == "Sacolé")
                tipo_Prod_Int = 2;

            if (tipo_Prod_Texto == "Geladinho")
                tipo_Prod_Int = 3;

            if (tipo_Prod_Texto == "Sorvete")
                tipo_Prod_Int = 4;

            if (tipo_Prod_Texto == "Picolé")
                tipo_Prod_Int = 5;

            if (tipo_Prod_Texto == "Cremosinho")
                tipo_Prod_Int = 6;

            DSCadastro.InsertParameters["TIPO"].DefaultValue = tipo_Prod_Int.ToString();
            DSCadastro.InsertParameters["NOME"].DefaultValue = cripto.Encrypt(txtNome.Text);
            DSCadastro.InsertParameters["PRECO"].DefaultValue = cripto.Encrypt(preco.ToString());
            DSCadastro.Insert();

            Response.Write("<script>alert('Novo produto Cadastrado com Sucesso !')</script>");

            txtNome.Text = "";
            txtPreço.Text = "";
            txtTamanho.Text = "";
            txtTipo.Text = "";
        }
    }
}