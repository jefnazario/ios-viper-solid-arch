##  Descrição da arquitetura deste projeto

### Metodologia adotada

Para o desenvolvimento deste projeto algumas técnicas, princípios e padrões foram utilizados para manter um bom nível de organização, manutenção e robustez tanto na arquitetura do projeto quanto no código fonte.
Os tópicos abaixo descrevem, brevemente, como a arquitetura do projeto será desenvolvida:

#### Princípio SOLID
 > O princípio base utilizado neste projeto é o SOLID.

 Para ficarmos de acordo com os princípios descritos no SOLID vamos usar as seguintes técnicas:

*   Implementação baseada no _Clean Code_ - Esta forma de implementar visa atender ao princípio `S` do SOLID, _Single Responsability_, que garantirá que uma classe terá uma, e somente uma, responsabilidade. Vale ressaltar que, utilizando esta técnica, teremos um projeto com muitas classes com poucas linhas cada uma. Muito questionam esta implementação pois a árvore de arquivos do projeto fica muito extensa, porém, ao meu ver, os benefícios gerados com a facilidade de visualizar e dar manutenção em uma classe com poucas linhas de código e uma única responsabilidade, superam qualquer "incômodo" gerado pela grande quantidade de arquivos.

*   Implementação orientada à _Interface_ - Toda comunicação entre classes será, obrigatoriamente, realiazada através de _interfaces_. Esta técnica permite que o princípio _open-closed_, letra `O` do SOLID, seja aplicado corretamente no decorrer da implementação. No caso, para este projeto de iOS, as _interfaces_ são denominadas _protocol_. Os nossos contratos serão assinados nestas classes _protocol_.
    Um ponto importante sobre o uso desta técnica de implementação, somado à prática de _Clean code_, é o fato de conseguirmos associar o princípio `O` com o princípio `I`. Como manteremos nosso código _clean_, conesquentemente, iremos segregar nossas _interfaces_.

* Para a implementação dos requests/responses que realizaremos nas API's vamos utilizar o princípio `L`, _Liskov Substitution_, do SOLID para garantirmos uma aplicação 100% saudável (sem crash). Toda requisição no qual dependeremos de resultado de terceiros implementará este princípio, esperando um comportamento bem definido destas classes. Se por algum motivo alguma implementação destas classes de terceiros altere o retorno das chamadas receberemos avisos e não seremos pegos de surpresa com um crash ou um erro genérico para o usuário.

* Para cumprirmos com o princípio `D`, _Dependency Inversion_, do SOLID vamos, mais uma vez, aproveitar da implementação orientada à _interfaces_. As dependências entre as classes devem, obrigatoriamente, serem feitas através de _interfaces_, para que a superclasse não conheça detalhes da implementação da classe no qual ela está se relacionando. Todo o acesso à funcionalidades de qualquer classe deve ser feito através das assinaturas das _interfaces_ e não pela implementação direta dos métodos/atributos/propriedades.


#### Especialização da arquitetura VIPER
> A palavra VIPER é um acrônimo para _View_, _Interactor_, _Presenter_, _Entity_ e _Routing_.

A arquitetura _VIPER_ é uma forma especializada da [arquitetura Clean](https://8thlight.com/blog/uncle-bob/2012/08/13/the-clean-architecture.html) aplicada para iOS apps. A arquitetura _Clean_ divide uma estrutura lógica de um app em camadas de responsabilidades. Isto faz com que isolemos de forma fácil as dependências, como por exemplo: database, acesso a API e etc. Com este isolamento de dependências a realização de testes automatizados e interações entre as camadas fica muito mais fácil.

Abaixo temos uma breve descrição sobre cada camada do VIPER:
* **V**iew: exibe o que é informado pelo _presenter_ e transmite a entrada do usuário de volta para o _presenter_.
* **I**nteractor: contém a lógica de negócio conforme especificado por um caso de uso.
* **P**resenter: contém a lógica da visão para preparar o conteúdo que será exibido (como os dados recebidos do _interactor_) e reage às ações do usuário (como solicitar novos dados do _interactor_).
* **E**ntity: contém objetos de modelo básicos usados pelo Interactor.
* **R**outing: contém a lógica de navegação para descrever quais telas são mostradas em qual ordem.

O artigo no qual tomei como base para estudo (você pode ler o artigo completo aqui: [Architecting iOS Apps with VIPER](https://www.objc.io/issues/13-architecture/viper/)), possui a seguinte recomendação:

> While the components of VIPER can be implemented in an application in any order, we’ve chosen to introduce the components in the order that we recommend implementing them. You’ll notice that this order is roughly consistent with the process of building an entire application, which starts with discussing what the product needs to do, followed by how a user will interact with it.

Esta ordem de implementação que eles sugerem segue o seguinte fluxo:
 - Interactor -> Entity -> Presenter -> View -> Routing

#### Proposta de arquitetura deste projeto
> Explicar aqui sobre a estrutura/arquitetura adotada neste projeto.

* Interactor não pode ser genérico, pois ele conterá as regras de negócio aplicadas a cada caso de uso
* Entity não pode ser genérico também, pois são as classes de domínio do projeto (neste caso não teremos uma pasta Entity no módulo _Generics_).
