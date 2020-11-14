using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Detalhes : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("ETEP");

    string[] adicionais = { "Morango", "Chocolate", "Caramelo", "Menta", "Tutti frutti", "Maracujá" };

    DataTable listaDescripto = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            if (Session["logado"].Equals("Ok"))
            {
                DataView prodEscolhido;
                prodEscolhido = (DataView)DSDetalhes.Select(DataSourceSelectArguments.Empty);

                txtNome.Text = cripto.Decrypt(prodEscolhido.Table.Rows[0]["nome_prod"].ToString());
                txtPreco.Text = cripto.Decrypt(prodEscolhido.Table.Rows[0]["preco_prod"].ToString());
                txtTamanho.Text = cripto.Decrypt(prodEscolhido.Table.Rows[0]["tam_prod"].ToString());

                if (txtTamanho.Text == "")
                    txtTamanho.Visible = false;

                txtTipo.Text = cripto.Decrypt(prodEscolhido.Table.Rows[0]["nome_tipo"].ToString());

                switch (txtTipo.Text)
                {
                    case "Açaí":
                        imgProd.ImageUrl = "~/Imagens/Acai.png";
                        CarregarAdicionais();
                        break;

                    case "Sacolé":
                        imgProd.ImageUrl = "~/Imagens/Sacole.png";
                        break;

                    case "Geladinho":
                        imgProd.ImageUrl = "~/Imagens/Geladinho.png";
                        break;

                    case "Sorvete":
                        imgProd.ImageUrl = "~/Imagens/Sorvete.png";
                        break;

                    case "Picolé":
                        imgProd.ImageUrl = "~/Imagens/Picole.png";
                        break;

                    case "Cremosinho":
                        imgProd.ImageUrl = "~/Imagens/Cremosinho.png";
                        break;
                }
            }
            else
            {
                Response.Redirect("Menu.aspx");
            }
        }
    }

    protected void btnAdicionar_Click(object sender, EventArgs e)
    {

    }

    private void CarregarAdicionais()
    {
        DataTable listaAdd = new DataTable();
        listaAdd.Columns.Add("Adicional");

        for (int i = 0; i < adicionais.GetLength(0); i++)
        {
            listaAdd.Rows.Add();
            listaAdd.Rows[i]["Adicional"] = adicionais[i].ToString();
        }

        gvAdicional.DataSource = listaAdd;
        gvAdicional.DataBind();
    }
}