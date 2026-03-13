# SingleChildScrollView no Flutter

O SingleChildScrollView é um widget do Flutter que permite rolagem (scroll) quando o conteúdo de um layout ultrapassa o tamanho da tela.

Ele é muito usado quando temos conteúdos maiores que a tela, como:

* formulários
* telas de cadastro
* listas pequenas
* telas com muitos widgets

Sem ele, o Flutter gera o erro:

```text
Bottom overflowed by XX pixels
```
## Exemplo de problema sem scroll

Quando usamos vários widgets dentro de uma Column, pode acontecer de o conteúdo ultrapassar a tela.

```dart
Column(
  children: [
    Text("Campo 1"),
    TextField(),
    Text("Campo 2"),
    TextField(),
    Text("Campo 3"),
    TextField(),
    Text("Campo 4"),
    TextField(),
    Text("Campo 5"),
    TextField(),
  ],
)
```

> Se a tela for pequena, ocorrerá overflow.

## Solução com SingleChildScrollView

Envolvendo a `Column` com `SingleChildScrollView`, o conteúdo passa a ter rolagem.

```text
SingleChildScrollView(
  child: Column(
    children: [
      Text("Campo 1"),
      TextField(),
      Text("Campo 2"),
      TextField(),
      Text("Campo 3"),
      TextField(),
      Text("Campo 4"),
      TextField(),
      Text("Campo 5"),
      TextField(),
    ],
  ),
)
```
## Estrutura básica

```dart
SingleChildScrollView(
  scrollDirection: Axis.vertical,
  child: Widget()
)
```

### Propriedades importantes

| Propriedade       | Função                   |
| ----------------- | ------------------------ |
| `child`           | Widget que terá rolagem  |
| `scrollDirection` | Direção do scroll        |
| `padding`         | Espaçamento interno      |
| `physics`         | Comportamento da rolagem |

## Direção da rolagem

### Vertical (padrão)

```dart
SingleChildScrollView(
  scrollDirection: Axis.vertical,
  child: Column(
    children: [],
  ),
)
```

### Horizontal

```dart
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: [],
  ),
)
```
* Usado em :
    * menus horizontais
    * carrosséis simples
    * listas pequenas

## Exemplo completo (formulário)

```dart
import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              decoration: InputDecoration(
                labelText: "Nome",
              ),
            ),

            SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),

            SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                labelText: "Telefone",
              ),
            ),

            SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                labelText: "Endereço",
              ),
            ),

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {},
              child: Text("Salvar"),
            )

          ],
        ),
      ),
    );
  }
}
```

## Quando não Usar

O `SingleChildScrollView` não é recomendado para listas grandes.

### Ruim para:
* listas com muitos itens
* dados do banco
* listas dinâmicas

Para esses casos use:
* `ListView`
* `ListView.builder`
* `GridView`

## Comparação

| Widget                  | Uso                        |
| ----------------------- | -------------------------- |
| `SingleChildScrollView` | Conteúdo pequeno           |
| `ListView`              | Listas médias              |
| `ListView.builder`      | Listas grandes e dinâmicas |
