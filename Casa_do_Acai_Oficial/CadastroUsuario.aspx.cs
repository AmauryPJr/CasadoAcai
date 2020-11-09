using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Web.Services;

public partial class CadastroLogin : System.Web.UI.Page
{
    protected static String ReCaptcha_Key = "6LeVDr4ZAAAAAIlwbRdNXOHyg3S0SgY_HzFOcG2R";
    protected static String ReCaptcha_Secret = "6LeVDr4ZAAAAABRLyjixpCyIytS9GJRDjLxOvhIt";

    Criptografia cripto = new Criptografia("ETEP");

    ServicoCorreios.AtendeClienteClient sc = new ServicoCorreios.AtendeClienteClient("AtendeClientePort");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            txtSenha.Attributes["value"] = txtSenha.Text;
        }        
    }

    protected void btnValidarCEP_Click(object sender, EventArgs e)
    {
        var dados = sc.consultaCEP(txtCEP.Text);

        if (dados != null)
        {
            string endereco = "" + dados.end + ", " + dados.bairro + " " + dados.cidade + " - " + dados.uf + "";
            Response.Write("<script>confirm('Confirma o seu Endereço: "+endereco+"')</script>");
        }
        else
        {
            Response.Write("<script>alert('CEP Incorreto. Coloque um CEP válido !');</script>");            
        }

        string script = "$('.step-1').attr('hidden', 'hidden'); " +
                    "$('.step-2').removeAttr('hidden'); " +
                    "$('.step-3').attr('hidden', 'hidden');";

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "", script, true);
    }

    protected void btnValidarCPF_Click(object sender, EventArgs e)
    {
        if (Validacao.ValidarCPF(txtCPF.Text) == true)
        {
            Response.Write("<script>alert('CPF é Válido !');</script>");
            txtCPF.Text = Validacao.FormatarCPF(txtCPF.Text);
        }
        else
        {
            Response.Write("<script>alert('CPF Inválido. Coloque um CPF válido !');</script>");
        }        
    }

    protected void btnFinalizar_Click(object sender, EventArgs e)
    {
        Session["nomeCli"] = txtNome.Text;

        DSCadastroCliente.InsertParameters["NOME"].DefaultValue = cripto.Encrypt(txtNome.Text);
        DSCadastroCliente.InsertParameters["TELEFONE"].DefaultValue = cripto.Encrypt(txtTelefone.Text);
        DSCadastroCliente.InsertParameters["CEP"].DefaultValue = cripto.Encrypt(txtCEP.Text);
        DSCadastroCliente.InsertParameters["NUMERO"].DefaultValue = cripto.Encrypt(txtNumero.Text);

        if (txtComplemento.Text != "")
        {
            DSCadastroCliente.InsertParameters["COMPLEMENTO"].DefaultValue = cripto.Encrypt(txtComplemento.Text);
        }
        else
        {
            DSCadastroCliente.InsertParameters["COMPLEMENTO"].DefaultValue = cripto.Encrypt("Sem Complemento");
        }

        string genero = "";

        if (ddlGenero.SelectedIndex == 0)
        {
            genero = "F";
        }

        if (ddlGenero.SelectedIndex == 1)
        {
            genero = "M";
        }

        if (ddlGenero.SelectedIndex == 2)
        {
            genero = "PND";
        }

        DSCadastroCliente.InsertParameters["GENERO"].DefaultValue = cripto.Encrypt(genero);
        DSCadastroCliente.InsertParameters["DATANASC"].DefaultValue = cripto.Encrypt(txtDataNasc.Text);
        DSCadastroCliente.InsertParameters["EMAIL"].DefaultValue = cripto.Encrypt(txtEmail.Text);
        DSCadastroCliente.InsertParameters["CPF"].DefaultValue = cripto.Encrypt(txtCPF.Text);
        DSCadastroCliente.InsertParameters["SENHA"].DefaultValue = cripto.Encrypt(txtSenha.Text);

        DSCadastroCliente.Insert();

        LimparCampos();

        Session["logado"] = "Ok";

        Response.Redirect("Menu_Logado.aspx");
    }
    
    protected void btnValidarSenha_Click(object sender, EventArgs e)
    {
        int qtd_Letras = 0;
        int cont = 0;
        int cont_Maius = 0, cont_Minus = 0, cont_Num = 0, cont_Simb = 0;

        qtd_Letras = txtSenha.Text.Length;


        //Para o evento se a qtd de carácteres
        //for maior que 16 

        if (qtd_Letras > 16)
        {
            Response.Write("<script>alert('O limite máximo é de 16 caracteres.');</script>");
            return;
        }

        if (qtd_Letras < 8)
        {
            Response.Write("<script>alert('A senha deve ter no mínimo 8 caracteres.');</script>");
            return;
        }

        //Contadores de carácteres maiúsculos, minúsculos
        //Números e simbolos

        while (cont < qtd_Letras)
        {
            if (char.IsUpper(txtSenha.Text[cont]))
                cont_Maius++;

            else
            {
                if (char.IsLower(txtSenha.Text[cont]))
                    cont_Minus++;

                else
                {
                    if (char.IsNumber(txtSenha.Text[cont]))
                        cont_Num++;

                    else
                    {
                        if (char.IsSymbol(txtSenha.Text[cont]) || char.IsPunctuation(txtSenha.Text[cont]))
                            cont_Simb++;
                    }
                }

            }

            cont++;
        }

        //Senha Forte

        if (cont_Maius > 0 && cont_Minus > 0 &&
            cont_Num > 0 && cont_Simb > 0 && cont >= 8)
        {
            SenhaForte();
        }

        //Senha Média

        if (cont_Maius == 0 && cont_Minus > 0 &&
            cont_Num > 0 && cont_Simb > 0 && cont >= 8)
        {
            SenhaMedia();
        }

        if (cont_Maius > 0 && cont_Minus == 0 &&
            cont_Num > 0 && cont_Simb > 0 && cont >= 8)
        {
            SenhaMedia();
        }

        if (cont_Maius > 0 && cont_Minus > 0 &&
            cont_Num == 0 && cont_Simb > 0 && cont >= 8)
        {
            SenhaMedia();
        }

        if (cont_Maius > 0 && cont_Minus > 0 &&
            cont_Num > 0 && cont_Simb == 0 && cont >= 8)
        {
            SenhaMedia();
        }

        //Senha Fraca com mais de 8 carácteres

        if (cont_Maius == 0 && cont_Minus == 0 &&
            cont_Num > 0 && cont_Simb > 0 && cont >= 8)
        {
            SenhaFraca();
        }

        if (cont_Maius == 0 && cont_Minus > 0 &&
            cont_Num == 0 && cont_Simb > 0 && cont >= 8)
        {
            SenhaFraca();
        }

        if (cont_Maius == 0 && cont_Minus > 0 &&
            cont_Num > 0 && cont_Simb == 0 && cont >= 8)
        {
            SenhaFraca();
        }

        if (cont_Maius > 0 && cont_Minus == 0 &&
            cont_Num == 0 && cont_Simb > 0 && cont >= 8)
        {
            SenhaFraca();
        }

        if (cont_Maius > 0 && cont_Minus == 0 &&
            cont_Num > 0 && cont_Simb == 0 && cont >= 8)
        {
            SenhaFraca();
        }

        if (cont_Maius > 0 && cont_Minus > 0 &&
            cont_Num == 0 && cont_Simb == 0 && cont >= 8)
        {
            SenhaFraca();
        }

        if (cont_Maius > 0 && cont_Minus == 0 &&
            cont_Num == 0 && cont_Simb == 0 && cont >= 8)
        {
            SenhaFraca();
        }

        if (cont_Maius == 0 && cont_Minus > 0 &&
            cont_Num == 0 && cont_Simb == 0 && cont >= 8)
        {
            SenhaFraca();
        }

        if (cont_Maius == 0 && cont_Minus == 0 &&
            cont_Num > 0 && cont_Simb == 0 && cont >= 8)
        {
            SenhaFraca();
        }

        if (cont_Maius == 0 && cont_Minus == 0 &&
            cont_Num == 0 && cont_Simb > 0 && cont >= 8)
        {
            SenhaFraca();
        }

        //Senha Fraca com menos de 8 carácteres

        if (cont_Maius == 0 && cont_Minus == 0 &&
            cont_Num > 0 && cont_Simb > 0 && cont < 8)
        {
            SenhaFraca();
        }

        if (cont_Maius == 0 && cont_Minus > 0 &&
            cont_Num == 0 && cont_Simb > 0 && cont < 8)
        {
            SenhaFraca();
        }

        if (cont_Maius == 0 && cont_Minus > 0 &&
            cont_Num > 0 && cont_Simb == 0 && cont < 8)
        {
            SenhaFraca();
        }

        if (cont_Maius > 0 && cont_Minus == 0 &&
            cont_Num == 0 && cont_Simb > 0 && cont < 8)
        {
            SenhaFraca();
        }

        if (cont_Maius > 0 && cont_Minus == 0 &&
            cont_Num > 0 && cont_Simb == 0 && cont < 8)
        {
            SenhaFraca();
        }

        if (cont_Maius > 0 && cont_Minus > 0 &&
            cont_Num == 0 && cont_Simb == 0 && cont < 8)
        {
            SenhaFraca();
        }

        if (cont_Maius > 0 && cont_Minus == 0 &&
            cont_Num == 0 && cont_Simb == 0 && cont < 8)
        {
            SenhaFraca();
        }

        if (cont_Maius == 0 && cont_Minus > 0 &&
            cont_Num == 0 && cont_Simb == 0 && cont < 8)
        {
            SenhaFraca();
        }

        if (cont_Maius == 0 && cont_Minus == 0 &&
            cont_Num > 0 && cont_Simb == 0 && cont < 8)
        {
            SenhaFraca();
        }

        if (cont_Maius == 0 && cont_Minus == 0 &&
            cont_Num == 0 && cont_Simb > 0 && cont < 8)
        {
            SenhaFraca();
        }
    }

    public void SenhaForte()
    {
        Response.Write("<script>alert('A sua senha é Forte. Clique em Próximo para prossegir com o Cadastro !');</script>");

        btnFinalizar.Enabled = true;
    }

    public void SenhaMedia()
    {
        Response.Write("<script>alert('A sua senha é Média. Tente uma Senha um pouco mais Forte !');</script>");

        txtSenha.Attributes["value"] = "";
    }

    public void SenhaFraca()
    {
        Response.Write("<script>alert('A sua senha é Fraca. Tente uma Senha mais Forte !')</script>");

        txtSenha.Attributes["value"] = "";
    }

    public void LimparCampos()
    {
        txtNome.Text = "";
        txtTelefone.Text = "";
        txtCEP.Text = "";
        txtNumero.Text = "";
        txtComplemento.Text = "";
        txtEmail.Text = "";
        txtDataNasc.Text = "";
        ddlGenero.ClearSelection();
        txtCPF.Text = "";
        txtSenha.Text = "";
    }
}