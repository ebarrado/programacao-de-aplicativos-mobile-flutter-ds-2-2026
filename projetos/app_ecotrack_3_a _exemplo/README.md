# 🌱 EcoTrack

Aplicativo mobile desenvolvido em Flutter com foco em **sustentabilidade escolar**, permitindo o registro, monitoramento e gerenciamento de ações ambientais dentro da escola.

---

## 📱 Sobre o Projeto

O **EcoTrack** é uma solução digital voltada para instituições de ensino, como a ETEC, com o objetivo de promover a **consciência ambiental**, organização dos espaços e melhoria contínua da infraestrutura escolar.

A aplicação permite:

* registrar ações sustentáveis realizadas pelos alunos;
* controlar ambientes e salas;
* gerenciar pontos de reciclagem;
* abrir tickets de manutenção;
* acompanhar indicadores ambientais em tempo real.

---

## 🎯 Objetivo

Criar um sistema centralizado que permita:

* monitorar práticas sustentáveis;
* incentivar ações ecológicas;
* organizar a gestão dos ambientes escolares;
* registrar e acompanhar problemas estruturais;
* fornecer dados para tomada de decisão.

---

## 🖼️ Interface do Aplicativo

### 🔐 Tela de Login

Tela inicial com autenticação do usuário.

### 📝 Tela de Cadastro

Permite registrar novos usuários no sistema.

### 🏠 Home (Dashboard Ambiental)

Tela principal com:

* saudação ao usuário;
* data atual;
* indicadores ambientais;
* ações rápidas;
* atividades recentes;
* navegação inferior.

### 📊 Estrutura da Home

* **Resumo**

  * ♻️ Coletas realizadas
  * 🏆 Pontos acumulados
  * 🌿 CO₂ economizado
  * 🎯 Meta do mês

* **Ações rápidas**

  * Registrar coleta
  * Pontos de coleta
  * Relatórios
  * Histórico
  * Metas ambientais
  * Dicas sustentáveis

* **Atividades recentes**

  * Últimas ações realizadas
  * Pontuação obtida
  * Notificações

---

## 🚀 Funcionalidades

* Autenticação de usuários
* Cadastro de ações sustentáveis
* Controle de salas e ambientes
* Gestão de pontos de reciclagem
* Abertura de tickets de manutenção
* Dashboard com indicadores ambientais
* Histórico de atividades
* Navegação entre telas

---

## 🧩 Estrutura do Projeto

```
lib/
├── main.dart
├── screens/
│   ├── login_screen.dart
│   ├── cadastro_screen.dart
│   ├── home_screen.dart
│   ├── historico_screen.dart
│   ├── mapa_screen.dart
│   └── perfil_screen.dart
├── widgets/
│   ├── resumo_card.dart
│   ├── acao_rapida_card.dart
│   └── atividade_item.dart
├── services/
│   └── auth_service.dart
```

---

## 🗂️ Estrutura do Banco de Dados (Firebase)

O projeto utiliza o **Cloud Firestore** com as seguintes coleções:

* `usuarios`
* `acoes_sustentaveis`
* `salas`
* `limpeza_ambientes`
* `pontos_reciclagem`
* `tickets_manutencao`
* `atividades_recentes`

---

## 🧪 Tecnologias Utilizadas

* Flutter
* Dart
* Firebase Authentication
* Cloud Firestore
* Firebase Storage
* Material Design

---

## ⚙️ Como Executar o Projeto

### 1. Clonar o repositório

```bash
git clone https://github.com/seu-usuario/ecotrack.git
```

### 2. Acessar o diretório

```bash
cd ecotrack
```

### 3. Instalar dependências

```bash
flutter pub get
```

### 4. Executar o projeto

```bash
flutter run
```

---

## 📦 Dependências principais

```yaml
dependencies:
  flutter:
    sdk: flutter
  intl: ^0.19.0
  firebase_core: ^latest
  firebase_auth: ^latest
  cloud_firestore: ^latest
```

---

## 🎓 Atividade Acadêmica

Este projeto também foi utilizado como atividade prática para os alunos, com o objetivo de desenvolver:

* interfaces com Flutter;
* organização de layout (dashboard);
* uso de widgets;
* navegação entre telas;
* estruturação de aplicações mobile.

---

## 📌 Próximas melhorias

* integração completa com Firebase;
* persistência de dados real;
* upload de imagens (tickets);
* sistema de ranking de alunos;
* notificações push;
* dashboard com gráficos;
* controle de permissões por perfil.

---

## 👩‍💻 Autora

Projeto desenvolvido por **Erika Barrado**
Instrutora / Desenvolvedora

---

## 📄 Licença

Este projeto é de uso educacional.
