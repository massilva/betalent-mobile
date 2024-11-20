# Teste Técnico Mobile BeTalent

Este é um repositório de respostas aos Testes Técnicos em Mobile da BeTalent.

## Arquitetura

O uso de boas práticas é fundamental em qualquer projeto de desenvolvimento de software, seja ele mobile, web, entre outros.

Normalmente, divido a aplicação em módulos e crio uma estrutura de pastas utilizando alguma arquitetura conhecida ou uma adaptação. Independentemente da escolha, seja Arquitetura Limpa, Hexagonal, entre outras, busco seguir os princípios do S.O.L.I.D e sempre analisar se faz sentido o uso ou não de elementos vistos em design patterns.

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

## Aplicação

### Componentes

Na pasta `lib/components`, foram adicionados os componentes utilizados em todos os módulos. Caso a aplicação cresça, pode-se criar uma pasta desta em cada módulo e deixar esta pasta para componentes utilizados entre os módulos.

Adaptei os conceitos presentes no `Atomic Design`, mas não separei-os visualmente na pasta em `átomos`, `moléculas`, etc., pois isso traz complexidade na granularidade de construção dos componentes, que até então não foi necessária. Por exemplo, temos o átomo `Logo` e criei a molécula `CenteredLogo`, mas não criei outras variações, pois não foram necessárias. Porém, a existência dessa molécula induz o desenvolvedor a criar `LeftLogo` ou `RightLogo`, se necessário.

### Core

Na pasta `lib/core`, há ferramentas auxiliares para a configuração da aplicação. Normalmente, adiciono o gerenciador de rotas, de injeção de dependências e as constantes utilizadas.

#### Constantes

Normalmente utilizo o padrão `AppConstants` concatenado com palavras-chave semânticas relacionadas ao que se refere o arquivo. Por exemplo, `AppConstantsStyleColor` para representar a classe que contém as constantes de cores, que são relacionadas ao estilo do projeto. Nesta aplicação, criei um arquivo centralizador `AppConstants` que tem acesso às outras classes de constantes, além das constantes de string global do projeto. Para este projeto, isso se mostrou cansativo e verboso, mas o seu uso ficou semântico e simples. Por exemplo, `AppConstants.colors.primary`.

## Executar a aplicação

Primeiro, baixe as dependências:

```bash
flutter pub get
```

Em seguida, execute a aplicação na plataforma que desejar. Para saber o ID do seu dispositivo, execute:

```bash
flutter devices
```

Normalmente, o ID do dispositivo desktop no macOS é macos e o web com o Chrome é chrome. Após confirmar o ID, execute o comando:

```bash
flutter run -d {DEVICE_ID}
```

Substitua `{DEVICE_ID}` pelo ID do seu dispositivo.

1. Web

```bash
flutter run -d chrome
```

2. Desktop

```bash
flutter run -d macos
```

3. Smartphone ou emulador

Primeiramente, conecte o dispositivo ao seu computador via USB ou abra um emulador. Após configurar o dispositivo e executar o comando para listar os dispositivos conectados, substitua {DEVICE_ID} pelo valor mostrado, por exemplo:

```bash
flutter run -d  ff1234
```

## Padrão dos commits

Adotei o padrão descrito repositório do [IURI](https://github.com/iuricode/padroes-de-commits) e busco agrupar os arquivos no commit a partir de uma dependência lógica, por exemplo: no caso onde foi modificado o arquivo `pubspec.yaml` o indicado seria fazer o commit desse arquivo usando `chore`, mas se a mudança foi associada a adicionar suporte a pasta `assets`, por exemplo, para mim, não faz sentido que este arquivo seja commit sozinho, mas sim, junto com a funcionalidade que depende utiliza esse asset, dessa forma, caso volte o commit não ficará com uma dependência "faltando".
