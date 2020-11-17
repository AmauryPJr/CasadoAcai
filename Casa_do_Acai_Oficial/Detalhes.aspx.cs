using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

public partial class Detalhes : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("ETEP");

    string[] adicionais = { "Morango", "Chocolate", "Caramelo", "Menta", "Tutti frutti", "Maracujá" };

    DataTable listaDescripto = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["logado"] != null)
            {
                if (Session["logado"].Equals("Entrou"))
                {
                    lCarrinho.Text = GerarNavCarrinho();
                    lSair.Text = GerarNavSair();

                    DataView prodEscolhido;
                    prodEscolhido = (DataView)DSDetalhes.Select(DataSourceSelectArguments.Empty);

                    txtNome.Text = cripto.Decrypt(prodEscolhido.Table.Rows[0]["nome_prod"].ToString());

                    string preco = cripto.Decrypt(prodEscolhido.Table.Rows[0]["preco_prod"].ToString()).Replace('.', ',');
                   
                    txtPreco.Text = preco;
                    txtTamanho.Text = cripto.Decrypt(prodEscolhido.Table.Rows[0]["tam_prod"].ToString());

                    if (txtTamanho.Text == "")
                        txtTamanho.Text = "Não Unitário";

                    txtTipo.Text = cripto.Decrypt(prodEscolhido.Table.Rows[0]["nome_tipo"].ToString());

                    switch (txtTipo.Text)
                    {
                        case "Açaí":
                            imgProd.ImageUrl = "~/Imagens/Acai.png";
                            CarregarAdicionais();
                            break;

                        case "Sacolé":
                            imgProd.ImageUrl = "~/Imagens/Sacole.png";
                            Session["add"] = "";
                            break;

                        case "Geladinho":
                            imgProd.ImageUrl = "~/Imagens/Geladinho.png";
                            Session["add"] = "";
                            break;

                        case "Sorvete":
                            imgProd.ImageUrl = "~/Imagens/Sorvete.png";
                            Session["add"] = "";
                            break;

                        case "Picolé":
                            imgProd.ImageUrl = "~/Imagens/Picole.png";
                            Session["add"] = "";
                            break;

                        case "Cremosinho":
                            imgProd.ImageUrl = "~/Imagens/Cremosinho.png";
                            Session["add"] = "";
                            break;
                    }
                }
            }
            else
            {
                Response.Redirect("Menu.aspx");
            }
        }
    }

    public string GerarNavCarrinho()
    {
        StringBuilder sb = new StringBuilder();

        sb.AppendLine("<a class='nav-link' id='btn5' href='Carrinho.aspx' onclick='mudarCor('btn4')'>CARRINHO</a>");

        return sb.ToString();
    }

    public string GerarNavSair()
    {
        StringBuilder sbSair = new StringBuilder();

        if (Session["logado"] == null || Session["logado"].Equals("Saiu"))
        {
            sbSair.AppendLine("<a class='nav-link' id='btn5' href='Login.aspx' onclick='mudarCor('btn4')'>LOGIN</a>");
            return sbSair.ToString();
        }

        else
        {
            sbSair.AppendLine("<a class='nav-link' id='btn5' href='Sair.aspx' onclick='mudarCor('btn4')'>SAIR</a>");
            return sbSair.ToString();
        }
    }

    protected void btnAdicionar_Click(object sender, EventArgs e)
    {
        if (Session["logado"] != null || Session["logado"].Equals("Saiu"))
        {
            if (Session["logado"].Equals("Entrou"))
            {                
                if (Session["novaCompra"].ToString() == "Sim")
                {
                    DateTime data;
                    string dataFormatada;

                    data = DateTime.Today;                    

                    dataFormatada = data.ToString("dd/MM/yyyy");

                    DSNovaVenda.InsertParameters["DATA"].DefaultValue = cripto.Encrypt(dataFormatada);
                    DSNovaVenda.Insert();

                    DataView ultVenda = (DataView)DSUltimaVenda.Select(DataSourceSelectArguments.Empty);
                    Session["ultVenda"] = ultVenda.Table.Rows[0]["ultVenda"].ToString();

                    Session["novaCompra"] = "Não";
                }

                double preco, totalProd;
                int qtd;
                qtd = Convert.ToInt32(txtQtdDesejada.Text);
                preco = Convert.ToDouble(txtPreco.Text);
                totalProd = qtd * preco;

                DSItemVenda.InsertParameters["QTD"].DefaultValue = cripto.Encrypt(qtd.ToString());
                DSItemVenda.InsertParameters["TOTAL"].DefaultValue = cripto.Encrypt(totalProd.ToString());

                if (gvAdicional.Visible)
                {
                    foreach (GridViewRow linha in gvAdicional.Rows)
                    {
                        RadioButton rbEscolhaAdd = (RadioButton)linha.FindControl("rbEscolhaAdd");

                        if (rbEscolhaAdd.Checked)
                        {
                            Session["add"] += adicionais[linha.DataItemIndex].ToString() + ", ";
                        }
                    }

                    if (Session["add"] == null)
                        Session["add"] = "";

                    else
                        Session["add"].ToString().TrimEnd();
                }

                else
                {
                    Session["add"] = "";
                }

                if (Session["add"].Equals(""))
                    DSItemVenda.InsertParameters["ADICIONAL"].DefaultValue = cripto.Encrypt(Session["add"].ToString());

                else
                    DSItemVenda.InsertParameters["ADICIONAL"].DefaultValue = cripto.Encrypt(Session["add"].ToString());

                DSItemVenda.Insert();

                Response.Write("<script>alert('Item adicionado ao Carrinho !');</script>");
            }

            else
            {
                Session["qtdDes"] = txtQtdDesejada.Text;

                Response.Redirect("Login.aspx");
            }
        }

        else
        {
            Session["qtdDes"] = txtQtdDesejada.Text;
            
            Response.Redirect("Login.aspx");
        }        
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