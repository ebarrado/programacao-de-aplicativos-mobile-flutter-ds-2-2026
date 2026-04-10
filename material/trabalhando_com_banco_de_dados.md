# 🗄️ Banco de Dados – EcoTrack

Este documento descreve a **estrutura do banco de dados** do projeto **EcoTrack**, incluindo a modelagem, tipos de usuários e organização das coleções no Firebase.


# 📌 Visão Geral

O EcoTrack utilizará o **Firebase Cloud Firestore**, um banco de dados NoSQL baseado em:

* coleções
* documentos
* campos

👉 Diferente de bancos relacionais (MySQL), aqui não usamos tabelas e joins tradicionais.


# 🎯 Objetivo do Banco

Armazenar e gerenciar informações relacionadas a:

* usuários
* ações sustentáveis
* salas e ambientes
* pontos de reciclagem
* tickets de manutenção
* atividades recentes

# 👤 Tipos de Usuários

No sistema, os usuários podem ter diferentes perfis.

## Tipos definidos:

```text
aluno
professor
funcionario
admin
```

## 📌 Uso do campo `tipo`

Dentro da coleção `usuarios`, teremos um campo:

```json
"tipo": "aluno"
```

Esse campo permite:

* controlar permissões
* mostrar telas diferentes
* limitar ações no sistema

## 💡 Exemplos de uso

| Tipo        | Permissões                       |
| ----------- | -------------------------------- |
| aluno       | registrar ações, abrir tickets   |
| professor   | acompanhar alunos, validar ações |
| funcionario | atualizar limpeza e manutenção   |
| admin       | acesso total ao sistema          |


# 🧩 Estrutura do Banco (Firestore)


## 📁 1. Coleção: `usuarios`

Armazena os dados dos usuários do sistema.

### Exemplo:

```json
usuarios
  uid_001
    nome: "Erika"
    sobrenome: "Barrado"
    email: "erika@email.com"
    telefone: "(14) 99999-9999"
    tipo: "professor"
    criadoEm: "2026-04-05"
```

## 📁 2. Coleção: `acoes_sustentaveis`

Registra ações ambientais realizadas.

### Exemplo:

```json
acoes_sustentaveis
  acao_001
    titulo: "Reciclagem de plástico"
    descricao: "Descarte correto de garrafas PET"
    tipo: "reciclagem"
    quantidade: 5
    unidade: "kg"
    pontos: 20
    usuarioId: "uid_001"
    data: "2026-04-05"
```

## 📁 3. Coleção: `salas`

Cadastro das salas e ambientes.

### Exemplo:

```json
salas
  sala_001
    nome: "Laboratório 1"
    bloco: "A"
    capacidade: 30
    status: "disponivel"
```

## 📁 4. Coleção: `limpeza_ambientes`

Controle da limpeza dos ambientes.

### Exemplo:

```json
limpeza_ambientes
  limpeza_001
    ambienteId: "sala_001"
    ambienteNome: "Laboratório 1"
    status: "limpo"
    ultimaLimpeza: "2026-04-05"
```

## 📁 5. Coleção: `pontos_reciclagem`

Cadastro dos pontos de coleta.

### Exemplo:

```json
pontos_reciclagem
  ponto_001
    nome: "Coleta Bloco B"
    localizacao: "Corredor"
    tipoMaterial: ["papel", "plástico"]
    status: "ativo"
```

## 📁 6. Coleção: `tickets_manutencao`

Chamados de manutenção.

### Exemplo:

```json
tickets_manutencao
  ticket_001
    titulo: "Computador com defeito"
    descricao: "Não liga"
    local: "Lab 2"
    status: "aberto"
    prioridade: "media"
    usuarioId: "uid_001"
```

## 📁 7. Coleção: `atividades_recentes`

Histórico exibido na Home.

### Exemplo:

```json
atividades_recentes
  atividade_001
    titulo: "Plástico reciclado"
    pontos: 20
    usuarioId: "uid_001"
    data: "2026-04-05"
```

# 🔗 Relacionamentos (lógica)

Mesmo sendo NoSQL, usamos referências simples:

* `usuarioId` → liga ação ao usuário
* `ambienteId` → liga limpeza à sala
* `ticket` → ligado ao usuário e local

## Exemplo:

```text
usuario (uid_001)
   ↓
acoes_sustentaveis.usuarioId
   ↓
atividade pertence ao usuário
```

# ⚙️ Como criar o banco no Firebase


## 1. Criar projeto

1. Acesse: https://console.firebase.google.com
2. Clique em **Adicionar projeto**
3. Nome: `ecotrack`

## 2. Ativar Firestore

1. Vá em **Firestore Database**
2. Clique em **Criar banco**
3. Escolha:

   * modo de teste (para desenvolvimento)
   * região (ex: southamerica-east1)


## 3. Estrutura inicial

Crie manualmente no console:

* coleção `usuarios`
* coleção `acoes_sustentaveis`
* coleção `tickets_manutencao`

Depois vá expandindo.

# 🔐 Segurança (importante)

No início pode usar:

```js
allow read, write: if true;
```

⚠️ Mas depois deve melhorar para:

* usuário só acessar seus dados
* controle por tipo (`aluno`, `professor`, etc.)


# 📊 Como o banco alimenta a Home

A Home usa dados como:

* total de coletas → `acoes_sustentaveis`
* pontos acumulados → soma dos pontos
* atividades recentes → `atividades_recentes`
* status → `tickets_manutencao`

# 🚀 Evolução futura

* ranking de alunos
* metas por turma
* relatórios gráficos
* notificações automáticas
* controle avançado por perfil

# 🧠 Resumo

* usamos **Firestore (NoSQL)**
* dados organizados em **coleções**
* usuários possuem **tipo (perfil)**
* relacionamentos via **IDs**
* sistema escalável e simples de integrar com Flutter

# 🎓 Conclusão

A estrutura proposta permite:

* flexibilidade no desenvolvimento
* fácil integração com Flutter
* escalabilidade do sistema
* organização clara dos dados

O uso de tipos de usuário (`aluno`, `professor`, `funcionario`, `admin`) torna o sistema mais completo e preparado para crescer.

