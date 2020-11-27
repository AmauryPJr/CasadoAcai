using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Validacao
{
    /*Como funciona o Validação do CPF:
     * 
     * O usuário digita 11 números inteiros dos quais,
     * 2 são Dígitos Verificadores (dv). Cada dv é calculado
     * com base nos 9 primeiros digitos anteriores e juntos
     * servem para validar o CPF.
     * 
     * Por exemplo: 546.471.429-49
     * 
     * O cálculo dos DVs é executado em duas etapas usando
     * para isto o módulo de divisão 11 (módulo de divisão
     * é a parte inteira do resultado de uma divisão):
     * 
     * Para calcular o 1º dígito verificador: 
     * 
     * Cada um dos nove primeiros números do CPF é multiplicado
     * por um peso que começa de 10 e que vai sendo diminuido de
     * 1 a cada passo, somando-se as parcelas calculadas:
     * 
     * 
     * sm = (5 * 10) + (4 * 9) + (6 * 8) + (4 * 7) + (7 * 6) + (1 * 5) + (4 * 4) + (2 * 3) + (9 * 2) = 249;
     * 
     * 
     * Calcula-se o dígito através da seguinte expressão:
     * 
     * 
     * resto = 11 - (sm % 11) 
     *       = 11 - (249 % 11)
     *       = 11 - 7 
     *       = 4
     * 
     * OBS: Se o resto da divisão (operador %) calculado for 10 ou 11, o
     * dígito verificador será 0; nos outros casos, o dígito verificador é
     * o próprio resto.
     * 
     * Para calcular o 2º dígito verificador:
     * 
     * Cada um dos dez primeiros números do CPF, considerando-se aqui o
     * primeiro DV, é multiplicado por um peso que começa de 11 e que
     * vai sendo diminuido de 1 a cada passo, somando-se as parcelas
     * calculadas:
     * 
     * sm = (5 * 11) + (4 * 10) + (6 * 9) + (4 * 8) + (7 * 7) + (1 * 6) + (4 * 5) + (2 * 4) + (9 * 3) + (4 * 2) = 299;
     * 
     * Calcula-se o dígito através da seguinte expressão:
     * 
     * resto = 11 - (sm % 11) 
     *       = 11 - (299 % 11)
     *       = 11 - 2
     *       = 9
     * 
     * OBS: se o resto da divisão (operador %) calculado for 10 ou 11,
     * o dígito verificador será 0; nos outros casos, o dígito
     * verificador é o próprio resto.
     */

    public static bool ValidarCPF(string CPF)
    {
        // Considera-se erro de CPF formados por uma sequencia de numeros iguais
        if (CPF.Equals("00000000000") || CPF.Equals("11111111111") ||
            CPF.Equals("22222222222") || CPF.Equals("33333333333") ||
            CPF.Equals("44444444444") || CPF.Equals("55555555555") ||
            CPF.Equals("66666666666") || CPF.Equals("77777777777") ||
            CPF.Equals("88888888888") || CPF.Equals("99999999999") ||
            (CPF.Length != 11))
            return false;

        //Proteger o codigo para eventuais erros de conversao de tipo (int)
        try
        {
            char dv1, dv2;
            int soma = 0, resto = 0, num = 0, peso = 10;

            // Calculo do 1º Digito Verificador
            for (int i = 0; i < 9; i++)
            {
                num = (int)(CPF[i] - 48);
                soma += (num * peso);
                peso -= 1;
            }

            // Converter o i em caractere do CPF em um numero
            // Por exemplo, transforma o caractere '0' no inteiro 0
            // Pois o caractere '0' na tabela ASCII, corresponde a 48
            // No sistema decimal.


            resto = 11 - (soma % 11);

            if (resto == 10 || resto == 11)
                dv1 = '0';
            else
                dv1 = (char)(resto + 48);
                // Converte no respectivo caractere numerico

            soma = 0;
            peso = 11;

            // Calculo do 2º Digito Verificador
            for (int i = 0; i < 10; i++)
            {
                num = (int)(CPF[i] - 48);
                soma += (num * peso);
                peso -= 1;
            }

            resto = 11 - (soma % 11);

            if (resto == 10 || resto == 11)
                dv2 = '0';
            else
                dv2 = (char)(resto + 48);

            // Verificar se os digitos calculados conferem com os digitos informados.
            if (dv1 == CPF[9] && dv2 == CPF[10])
                return true;
            else
                return false;
        }
        catch
        {
            return false;
        }
    }

    public static String FormatarCPF(string CPF)
    {
        string cpfFormatado = CPF.Substring(0, 3) + ".";
        cpfFormatado += CPF.Substring(3, 3) + ".";
        cpfFormatado += CPF.Substring(6, 3) + "-";
        cpfFormatado += CPF.Substring(9, 2);
        
        return cpfFormatado;
    }
}