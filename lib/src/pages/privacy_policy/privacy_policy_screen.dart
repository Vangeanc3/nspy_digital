import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("NSPY Digital",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body:  SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Política de Privacidade',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text("""Ismael Cardoso Martins desenvolveu o aplicativo NSPY Digital como um aplicativo gratuito. Este SERVIÇO é fornecido por Ismael Cardoso Martins sem custo algum e destina-se a ser usado como está.

Esta página é utilizada para informar os visitantes sobre minhas políticas com relação à coleta, uso e divulgação de Informações Pessoais, caso alguém decida usar meu Serviço.

Ao optar por utilizar meu Serviço, você concorda com a coleta e o uso de informações de acordo com esta política. As Informações Pessoais que coleto são usadas para fornecer e melhorar o Serviço. Não utilizarei nem compartilharei suas informações com ninguém, exceto conforme descrito nesta Política de Privacidade.

Os termos utilizados nesta Política de Privacidade têm os mesmos significados que em nossos Termos e Condições, acessíveis em NSPY Digital, a menos que definido de outra forma nesta Política de Privacidade.

Coleta e Uso de Informações

Para uma melhor experiência, ao utilizar nosso Serviço, posso solicitar que você nos forneça determinadas informações de identificação pessoal, incluindo, mas não se limitando a, Nome, Números de Telefone. As informações que solicito serão retidas em seu dispositivo e não serão coletadas por mim de forma alguma.

O aplicativo utiliza serviços de terceiros que podem coletar informações usadas para identificá-lo.

Link para a política de privacidade de provedores de serviços de terceiros usados pelo aplicativo

Serviços do Google Play
Dados de Registro

Desejo informar que, sempre que você utiliza meu Serviço e ocorre um erro no aplicativo, eu coletarei dados e informações (por meio de produtos de terceiros) do seu telefone, chamados Dados de Registro. Esses Dados de Registro podem incluir informações como o endereço de Protocolo de Internet ("IP") do seu dispositivo, nome do dispositivo, versão do sistema operacional, configuração do aplicativo ao utilizar meu Serviço, hora e data do uso do Serviço e outras estatísticas.

Cookies

Cookies são arquivos com uma pequena quantidade de dados que são comumente usados como identificadores únicos anônimos. Eles são enviados para o seu navegador pelos sites que você visita e são armazenados na memória interna do seu dispositivo.

Este Serviço não utiliza explicitamente esses "cookies". No entanto, o aplicativo pode utilizar códigos e bibliotecas de terceiros que utilizam "cookies" para coletar informações e melhorar seus serviços. Você tem a opção de aceitar ou recusar esses cookies e de saber quando um cookie está sendo enviado ao seu dispositivo. Se você optar por recusar nossos cookies, talvez não consiga utilizar algumas partes deste Serviço.

Provedores de Serviços

Posso empregar empresas e indivíduos terceirizados pelos seguintes motivos:

Facilitar nosso Serviço;
Fornecer o Serviço em nosso nome;
Realizar serviços relacionados ao Serviço; ou
Nos ajudar a analisar como nosso Serviço é utilizado.
Desejo informar aos usuários deste Serviço que esses terceiros têm acesso às suas Informações Pessoais. A razão é executar as tarefas atribuídas a eles em nosso nome. No entanto, eles estão obrigados a não divulgar nem utilizar as informações para qualquer outro propósito.

Segurança

Valorizo a sua confiança ao nos fornecer suas Informações Pessoais, portanto, estamos empenhados em utilizar meios comercialmente aceitáveis para protegê-las. No entanto, lembre-se de que nenhum método de transmissão pela internet ou de armazenamento eletrônico é 100% seguro e confiável, e não posso garantir sua segurança absoluta.

Links para Outros Sites

Este Serviço pode conter links para outros sites. Se você clicar em um link de terceiros, será direcionado a esse site. Note que esses sites externos não são operados por mim. Portanto, aconselho veementemente que você revise a Política de Privacidade desses sites. Não tenho controle sobre o conteúdo, políticas de privacidade ou práticas de quaisquer sites ou serviços de terceiros.

Privacidade de Crianças

Este Serviço não se destina a pessoas menores de 13 anos. Não coletamos conscientemente informações de identificação pessoal de crianças menores de 13 anos. Caso eu descubra que uma criança menor de 13 anos forneceu informações pessoais, excluirei imediatamente essas informações de nossos servidores. Se você é pai, mãe ou responsável e sabe que seu filho nos forneceu informações pessoais, entre em contato comigo para que eu possa tomar as medidas necessárias.

Alterações a Esta Política de Privacidade

Posso atualizar nossa Política de Privacidade de tempos em tempos. Portanto, recomendo que você reveja esta página periodicamente em busca de alterações. Notificarei sobre quaisquer alterações, publicando a nova Política de Privacidade nesta página.

Esta política entra em vigor a partir de 2023-08-24.

Contate-Nos

Se você tiver alguma dúvida ou sugestão sobre minha Política de Privacidade, não hesite em entrar em contato pelo e-mail vangeancetecnologias@gmail.com.
            """)
          ],
        ),));
  }
}
