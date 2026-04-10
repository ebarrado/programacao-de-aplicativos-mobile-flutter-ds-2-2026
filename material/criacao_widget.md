# 🧱 Criação de Widgets Personalizados no Flutter

Este guia explica como criar **widgets reutilizáveis** no Flutter, utilizando como exemplo o componente `AtividadeItem`, usado no projeto **EcoTrack**.


## 📌 O que é um Widget Personalizado?

Um **widget personalizado** é um componente criado por você para representar uma parte da interface.

👉 Ele permite:

* reutilizar código
* organizar melhor o projeto
* evitar repetição
* facilitar manutenção


## 🎯 Exemplo prático

```dart
class AtividadeItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String points;

  const AtividadeItem({
    super.key,
    required this.icon,
    required this.title,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFE8F5E9),
            child: Icon(
              icon,
              color: const Color(0xFF4CAF50),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            points,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32),
            ),
          ),
        ],
      ),
    );
  }
}
```

# 🔍 Explicação do código

## 1. Definição da classe

```dart
class AtividadeItem extends StatelessWidget
```

* `class` → cria um novo componente
* `AtividadeItem` → nome do widget
* `StatelessWidget` → widget sem estado (dados não mudam internamente)


## 2. Atributos (dados recebidos)

```dart
final IconData icon;
final String title;
final String points;
```

Esses são os **parâmetros do widget**.

| Campo  | Função             |
| ------ | ------------------ |
| icon   | ícone da atividade |
| title  | nome da atividade  |
| points | pontuação          |

👉 `final` significa que o valor não muda após a criação.


## 3. Construtor

```dart
const AtividadeItem({
  super.key,
  required this.icon,
  required this.title,
  required this.points,
});
```

* `required` → obriga o envio dos dados
* `this.icon` → associa o valor recebido ao atributo


## 4. Método `build()`

```dart
Widget build(BuildContext context)
```

Esse método define **o que será exibido na tela**.

# 🎨 Estrutura visual do widget

## Container (estrutura principal)

```dart
Container(...)
```

Responsável por:

* fundo branco
* bordas arredondadas
* sombra
* espaçamento interno


## Layout horizontal (Row)

```dart
Row(
  children: [...]
)
```

Organiza os elementos em linha:

```text
[ícone]   [texto]   [pontuação]
```


## Ícone

```dart
CircleAvatar(
  child: Icon(icon)
)
```

* cria um círculo
* recebe o ícone dinamicamente



## Espaçamento

```dart
SizedBox(width: 12)
```

Cria espaço entre os elementos.


## Texto principal

```dart
Expanded(
  child: Text(title)
)
```

* ocupa o espaço disponível
* evita quebra de layout


## Pontuação

```dart
Text(points)
```

Exibe o valor final (ex: +20 pts)


# 📦 Como usar o widget

```dart
AtividadeItem(
  icon: Icons.recycling,
  title: 'Plástico reciclado',
  points: '+20 pts',
)
```


# 🧠 Conceito importante

## Widget = Componente

👉 Esse padrão é igual a:

* React (componentes)
* Angular (componentes)
* Web (div reutilizável)

Você criou um bloco reutilizável da interface.


# ⚙️ Quando criar widgets personalizados?

Crie quando:

* repetir layouts
* trabalhar com listas (ex: ListView)
* criar dashboards
* separar responsabilidades do código


# 🆚 Stateless vs Stateful

| Tipo            | Uso             |
| --------------- | --------------- |
| StatelessWidget | dados fixos     |
| StatefulWidget  | dados que mudam |

👉 Neste caso usamos `StatelessWidget` porque os dados vêm de fora.

# 🧩 Boas práticas

## ✔ Nome claro

```dart
AtividadeItem
```


## ✔ Usar const

Melhora performance


## ✔ Separar em arquivos

```text
lib/widgets/atividade_item.dart
```

## ✔ Evitar lógica dentro do widget

Deixe ele apenas visual


# 🧪 Exemplo visual

```text
┌──────────────────────────────┐
│ ♻️ Plástico reciclado   +20  │
└──────────────────────────────┘
```


# 🚀 Resumo

* Widgets personalizados ajudam a organizar o código
* Permitem reutilização
* Recebem dados via parâmetros
* Constroem a interface no método `build()`
* São fundamentais em projetos Flutter

