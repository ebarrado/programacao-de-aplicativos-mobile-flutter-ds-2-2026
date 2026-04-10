# GridView

O GridView é um widget usado para exibir itens em formato de grade (grid) — ou seja, em linhas e colunas, diferente do ListView que mostra apenas uma lista vertical.

👉 Pense nele como uma tabela visual, muito usada para:

* dashboards (como no EcoTrack ✅)
* menus com ícones
* galerias de imagens
* cards organizados

## Quando usar

Use GridView quando você precisa:

* mostrar vários itens lado a lado
* organizar conteúdo em blocos visuais
* criar telas tipo dashboard
* exibir opções (botões/cards)

## Tipos de GridView

1. GridView.count (mais simples)

Você define quantas colunas quer.

```dart
GridView.count(
  crossAxisCount: 2,
  children: [
    Container(color: Colors.green),
    Container(color: Colors.blue),
    Container(color: Colors.red),
    Container(color: Colors.orange),
  ],
)
```
* crossAxisCount: 2 → 2 colunas
* os itens se organizam automaticamente

2. GridView.builder (mais usado em projetos reais)

Usado quando você tem lista dinâmica de dados

```dart
GridView.builder(
  itemCount: 10,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
  ),
  itemBuilder: (context, index) {
    return Container(
      margin: const EdgeInsets.all(8),
      color: Colors.green,
      child: Center(
        child: Text('Item $index'),
      ),
    );
  },
)
```

### Propriedades importantes

|propriedade| descrição |
|-----| ----|
|crossAxisCount|crossAxisCount|
|Número de colunas|mainAxisSpacing|
|Espaço vertical entre os itens|Espaço horizontal entre os itens|
|childAspectRatio|childAspectRatioZ
|shrinkWrap|Muito importante quando usado dentro de Column ou Scroll|
|physics|Evita conflito de scroll|

## Evita conflito de scroll

```dart
GridView.count(
  crossAxisCount: 2,
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  mainAxisSpacing: 12,
  crossAxisSpacing: 12,
  childAspectRatio: 1.3,
  children: const [
    ResumoCard(
      icon: Icons.recycling,
      title: 'Coletas',
      value: '12',
    ),
    ResumoCard(
      icon: Icons.emoji_events,
      title: 'Pontos',
      value: '340',
    ),
    ResumoCard(
      icon: Icons.eco,
      title: 'CO₂',
      value: '18kg',
    ),
    ResumoCard(
      icon: Icons.track_changes,
      title: 'Meta',
      value: '75%',
    ),
  ],
)
```
> Se você usar GridView dentro de um Column ou ScrollView, pode dar erro:

## 🆚 GridView vs ListView

| Característica | GridView                 | ListView       |
| -------------- | ------------------------ | -------------- |
| Layout         | grade (linhas + colunas) | lista vertical |
| Uso            | dashboards, cards        | listas simples |
| Visual         | mais organizado          | mais linear    |


> GridView é uma tabela visual com cards.