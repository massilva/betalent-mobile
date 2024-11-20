# Teste Técnico Mobile BeTalent

Este é um repositório de respostas aos Testes Técnicos em Mobile da BeTalent.

## Decisões Técnicas

O uso de boas práticas é fundamental em qualquer projeto de desenvolvimento de software, seja ele mobile, web, entre outros.

Normalmente, divido a aplicação em módulos e crio uma estrutura de pastas utilizando alguma arquitetura conhecida ou uma adaptação. Independente da escolha, seja Arquitetura Limpa, Hexagonal, entre outras, busco seguir os princípios do S.O.L.I.D e sempre analisar se faz sentido o uso ou não de elementos vistos em design patterns.

Resolvi utilizar uma adaptação do `Driven-Domain-Design` e da arquitetura limpa que costumo utilizar, a qual foi baseada na explicação dada pelo pessoal da [Flutterando](https://github.com/Flutterando/Clean-Dart). Fiz essa adaptação para usar em projetos que tenham um conjunto de funcionalidades conhecidas e por se tratar de uma aplicação sem regras de negócios bem definidas, como explicado abaixo:

1. **Presenter**

   - **Page**: A representação da tela visualizada pelo usuário;
   - **Controller**: Responsável por auxiliar as páginas dentro de um mesmo contexto ou módulo, servindo como intermediário entre a tela e os serviços. Normalmente, trata exceções e gerencia o estado das ações realizadas na página;
   - **State**: Estados presentes nas telas, que podem representar uma mudança em toda a página ou em um componente específico;
   - **Entity**: Representa os dados de entrada, como `DTOs`, `ViewModels` ou `ValueObject`, utilizados nas páginas, no controller e passados para o `Service` da próxima camada;

2. **Domain**

    - **Service**: Responsável por realizar o mapeamento ou adaptação entre a camada `Presenter` e a camada `External`;
    - **Model**: Representa os dados conforme utilizados na camada externa, ou seja, de acordo com a implementação de uma aplicação externa, como uma API, banco de dados local ou cache, por exemplo;
    - **Mappers**: Responsável por transformar objetos do tipo `Entity` em `Model`;

3. **External**

    - **Repository**: Responsável por preparar, enviar e receber os dados das aplicações externas;

As `entities` e `models` funcionam como modelos para padronização dos dados utilizados na aplicação, por isso transitam entre as camadas.
