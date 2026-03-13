# Form no Flutter

O **Form** é um widget do **:contentReference[oaicite:0]{index=0}** utilizado para **agrupar e validar campos de entrada de dados** em uma aplicação.

Ele é muito usado em telas como:

- Login
- Cadastro de usuários
- Formulários de contato
- Atualização de perfil

O `Form` trabalha em conjunto com widgets como:

- `TextFormField`
- `DropdownButtonFormField`
- `CheckboxListTile`

---

# 📌 Estrutura básica de um Form

Para criar um formulário no Flutter utilizamos:

1. `Form`
2. `GlobalKey`
3. Campos como `TextFormField`
4. Funções de validação (`validator`)

### Exemplo básico

```dart
final _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(),
      ElevatedButton(
        onPressed: () {},
        child: Text("Enviar"),
      )
    ],
  ),
)
```

## `GlobalKey` no Form

O `GlobalKey<FormState>` permite acessar e controlar o estado do formulário.

Com ele podemos:
* validar os campos
* salvar os dados
* resetar o formulário

```dart
final _formKey = GlobalKey<FormState>();
```

Ele é ligado ao formulário através da propriedade key.

## Usando TextFormField

O TextFormField é um campo de texto com suporte a validação automática.

Exemplo:

```dart
TextFormField(
  decoration: InputDecoration(
    labelText: "Email",
  ),
)
```

## Validação de campos

A validação é feita através da propriedade validator.

``dart
TextFormField(
  decoration: InputDecoration(
    labelText: "Nome",
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return "Informe o nome";
    }
    return null;
  },
)
```

## alidando o formulário

Para verificar se todos os campos são válidos usamos:

```dart
_formKey.currentState!.validate()
```

## Exemplo dentro de um botão:

```dart
ElevatedButton(
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      print("Formulário válido");
    }
  },
  child: Text("Enviar"),
)
```

## Exemplo completo de formulário

```dart

import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nome",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Digite o nome";
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),

              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Digite o email";
                  }
                  return null;
                },
              ),

              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Dados enviados!");
                  }
                },
                child: Text("Cadastrar"),
              )

            ],
          ),
        ),
      ),
    );
  }
}
```

# DropdownButtonFormField no Flutter

O **DropdownButtonFormField** é um widget do **:contentReference[oaicite:0]{index=0}** utilizado para criar **listas suspensas (dropdown)** dentro de formulários.

Ele permite que o usuário **selecione uma opção entre várias disponíveis** e possui **integração com validação de formulários (`Form`)**.

É muito utilizado em campos como:

- Seleção de cidade
- Seleção de estado
- Tipo de usuário
- Categoria de produto
- Gênero
- Status

---

# 📌 Diferença entre DropdownButton e DropdownButtonFormField

| Widget | Uso |
|---|---|
| `DropdownButton` | Lista suspensa simples |
| `DropdownButtonFormField` | Lista suspensa com validação para formulários |

Se estiver dentro de um **Form**, o ideal é usar **DropdownButtonFormField**.

---

# 📐 Estrutura básica

```dart
DropdownButtonFormField(
  items: [],
  onChanged: (value) {},
)

```

## Exemplo simples

```dart

String? cidadeSelecionada;

DropdownButtonFormField<String>(
  decoration: InputDecoration(
    labelText: "Cidade",
  ),
  items: [
    DropdownMenuItem(
      value: "Marília",
      child: Text("Marília"),
    ),
    DropdownMenuItem(
      value: "Bauru",
      child: Text("Bauru"),
    ),
    DropdownMenuItem(
      value: "Lins",
      child: Text("Lins"),
    ),
  ],
  onChanged: (value) {
    cidadeSelecionada = value;
  },
)
```


## Validação com Form

O DropdownButtonFormField permite validação usando validator, assim como o TextFormField.

```dart
DropdownButtonFormField<String>(
  decoration: InputDecoration(
    labelText: "Cidade",
  ),
  items: [
    DropdownMenuItem(
      value: "Marília",
      child: Text("Marília"),
    ),
    DropdownMenuItem(
      value: "Bauru",
      child: Text("Bauru"),
    ),
  ],
  validator: (value) {
    if (value == null) {
      return "Selecione uma cidade";
    }
    return null;
  },
  onChanged: (value) {},
)
```
Se o usuário não selecionar nada, o formulário exibirá uma mensagem de erro.

## Exemplo dentro de um Form

```dart
final _formKey = GlobalKey<FormState>();
String? cidade;

Form(
  key: _formKey,
  child: Column(
    children: [

      DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: "Cidade",
        ),
        items: [
          DropdownMenuItem(
            value: "Marília",
            child: Text("Marília"),
          ),
          DropdownMenuItem(
            value: "Bauru",
            child: Text("Bauru"),
          ),
          DropdownMenuItem(
            value: "Lins",
            child: Text("Lins"),
          ),
        ],
        validator: (value) {
          if (value == null) {
            return "Selecione uma cidade";
          }
          return null;
        },
        onChanged: (value) {
          cidade = value;
        },
      ),

      SizedBox(height: 20),

      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            print("Cidade selecionada: $cidade");
          }
        },
        child: Text("Enviar"),
      )

    ],
  ),
)
```

## Propriedades importantes


| Propriedade  | Função                        |
| ------------ | ----------------------------- |
| `items`      | Lista de opções               |
| `onChanged`  | Executado quando o valor muda |
| `value`      | Valor selecionado             |
| `validator`  | Validação do campo            |
| `decoration` | Aparência do campo            |


## Criando lista dinâmica

Podemos gerar as opções a partir de uma lista.
```dart
List<String> cidades = ["Marília", "Bauru", "Lins"];

DropdownButtonFormField(
  items: cidades.map((cidade) {
    return DropdownMenuItem(
      value: cidade,
      child: Text(cidade),
    );
  }).toList(),
  onChanged: (value) {},
)
```