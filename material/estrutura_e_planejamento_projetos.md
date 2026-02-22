# 📱 Estrutura e Planejamento de Projetos Flutter

## 🎯 Objetivos da Aula

- ✅ Entender o que é planejar antes de programar
- ✅ Compreender a estrutura padrão de um projeto Flutter
- ✅ Identificar a função de cada pasta e arquivo
- ✅ Relacionar estrutura de projeto com manutenção, desempenho e sustentabilidade
- ✅ Decidir quando usar StatelessWidget e StatefulWidget

---

## ESTRUTURA BÁSICA DE UM PROJETO FLUTTER

```text
lib/
├── main.dart
├── screens/
├── widgets/
├── models/
└── services/
```

### 📍 main.dart

| Item | Descrição |
|------|-----------|
| **Função** | Arquivo principal do app, ponto de entrada da aplicação |
| **Composição** | `runApp()`, configuração do tema, tela inicial |

### 📍 screens/ (Telas)

| Item | Descrição |
|------|-----------|
| **Função** | Guardar as telas completas do aplicativo |
| **Exemplos** | `login_screen.dart`, `home_screen.dart`, `ranking_screen.dart` |
| **Característica** | Cada arquivo representa uma tela inteira, geralmente StatefulWidget |

### 📍 widgets/ (Componentes reutilizáveis)

| Item | Descrição |
|------|-----------|
| **Função** | Guardar pequenos componentes reutilizáveis |
| **Exemplos** | `botao_padrao.dart`, `card_acao.dart` |
| **Característica** | Normalmente são StatelessWidget, não controlam estado complexo |

### 📍 models/ (Modelos de Dados)

| Item | Descrição |
|------|-----------|
| **Função** | Representar os dados do sistema |
| **Exemplos** | `usuario.dart`, `acao_sustentavel.dart` |
| **Conteúdo** | Atributos, construtores, métodos simples |

### 📍 services/ (Regras e serviços)

| Item | Descrição |
|------|-----------|
| **Função** | Comunicação com banco de dados ou API, regras de negócio |
| **Exemplos** | `auth_service.dart`, `acao_service.dart` |

---

## 📱 ESTUDO DE CASO: APLICATIVO ECOTRACK

### 🎯 Planejamento da Tela de Login

**Objetivo:** Permitir que o usuário (aluno ou professor) acesse o aplicativo EcoTrack de forma segura e simples.

#### 📋 Componentes Visuais da Tela de Login

| Componente Flutter | Função na Tela |
|-------------------|----------------|
| `Scaffold` | Estrutura base da tela |
| `AppBar` (opcional) | Título do aplicativo |
| `Column` | Organizar os elementos verticalmente |
| `Padding` | Espaçamento interno |
| `Center` | Centralizar conteúdo |
| `SingleChildScrollView` | Evitar erro de overflow |

#### 🖼️ Cabeçalho

| Componente | Uso |
|------------|-----|
| `Icon` ou `Image` | Ícone sustentável (folha, planeta, reciclagem) |
| `Text` | Nome do app: **EcoTrack** |
| `Text` | Frase de impacto sustentável |

#### ⌨️ Componentes de Entrada (Formulário)

| Componente | Função | Tipo |
|------------|--------|------|
| `TextField` | Campo de e-mail | Entrada de texto |
| `TextField` | Campo de senha | Entrada protegida |
| `InputDecoration` | Rótulos e ícones | Estético |
| `Icon` | Ícone de e-mail e senha | Visual |

#### 🔘 Botões de Ação

| Componente | Função |
|------------|--------|
| `ElevatedButton` | Botão **Entrar** |
| `TextButton` | Esqueci a senha |
| `TextButton` | Criar conta |

#### 💬 Mensagens ao Usuário

| Componente | Uso |
|------------|-----|
| `Text` | Mensagens de erro |
| `SnackBar` | Aviso de login inválido |

**Mensagens previstas:**
- "E-mail ou senha inválidos"
- "Campos obrigatórios"

### 🔄 Fluxo da Tela de Login

```text
Usuário digita e-mail
Usuário digita senha

Ao clicar em Entrar:
Se campos estiverem vazios
Mostrar erro
Senão
Validar login
Se válido
Ir para Home
Senão
Mostrar mensagem de erro
```

---

## 🛠️ IMPLEMENTAÇÃO PASSO A PASSO

### 📁 Estrutura de Pastas do Projeto

```text
lib/
├── main.dart
└── screens/
├── login_screen.dart
└── criar_conta_screen.dart
```

### 1️⃣ Arquivo `login_screen.dart`

#### Passo 1: Criar a classe principal

```dart
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
```

### Explicação:

* StatefulWidget → tela com comportamento dinâmico

* createState() → cria o estado da tela

#### Passo 2: Criar o estado da tela

```dart
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Tela de Login EcoTrack"),
      ),
    );
  }
}
```

### Conceitos importantes:

* TextEditingController → captura texto digitado

* Scaffold → estrutura base da tela

### Passo 3: Montar o layout completo

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 4️⃣ Logo do EcoTrack
            Image.asset(
              'assets/logo_ecotrack.png',
              height: 120,
            ),

            // 5️⃣ Nome do App
            const SizedBox(height: 16),
            const Text(
              'EcoTrack',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            // 6️⃣ Campo de E-mail
            const SizedBox(height: 32),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),

            // 7️⃣ Campo de Senha
            const SizedBox(height: 16),
            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),

            // 8️⃣ Botão Entrar
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                realizarLogin();
              },
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    ),
  );
}
```
## Por que usar SingleChildScrollView?

Evita erro de overflow em telas pequenas

## Por que usar Padding?

Garante espaçamento adequado nas bordas

## Por que usar Column?

Organiza todos elementos na vertical

### Passo 9: Função de Login (lógica simples)

```dart
void realizarLogin() {
  String email = emailController.text;
  String senha = senhaController.text;

  if (email.isEmpty || senha.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Preencha todos os campos')),
    );
  } else {
    // Login fictício (por enquanto)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login realizado com sucesso')),
    );
  }
}
```

### 2️⃣ Arquivo main.dart

```dart
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const EcoTrackApp());
}

class EcoTrackApp extends StatelessWidget {
  const EcoTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoTrack',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
```

### 3️⃣ Configuração do pubspec.yaml

```ya,l
flutter:
  assets:
    - assets/logo_ecotrack.png
```
> O logo é um recurso visual armazenado na pasta assets/

### 4️⃣ Tela de Criar Conta
Arquivo `criar_conta_screen.dart`

```dart
import 'package:flutter/material.dart';

class CriarContaScreen extends StatefulWidget {
  const CriarContaScreen({super.key});

  @override
  State<CriarContaScreen> createState() => _CriarContaScreenState();
}

class _CriarContaScreenState extends State<CriarContaScreen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Campo Nome
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // Campo E-mail
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // Campo Senha
            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24),

            // Botão Criar Conta
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  criarConta();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Criar Conta'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void criarConta() {
    if (nomeController.text.isEmpty ||
        emailController.text.isEmpty ||
        senhaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Conta criada com sucesso')),
      );

      // Volta para a tela de login
      Navigator.pop(context);
    }
  }
}
```

> Atualizar login_screen.dart com navegação

* Adicione o import e o botão "Criar Conta":

```dart
import 'criar_conta_screen.dart'; // No topo do arquivo

// Dentro do Column, após o botão Entrar
const SizedBox(height: 16),
TextButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CriarContaScreen()),
    );
  },
  child: const Text('Criar conta'),
),
```

## 💾 PERSISTÊNCIA DE DADOS

No arquivo pubspec.yaml:

```yaml
dependencies:
  flutter:
    sdk: flutter
  path_provider: ^2.1.2
```

## O que é path_provider?

Biblioteca que descobre onde o app pode salvar arquivos no dispositivo

No criar_conta_screen.dart:
```dart
import 'dart:io';
import 'package:path_provider/path_provider.dart';
```
### 💾 Função para salvar dados

```dart
Future<void> salvarUsuario() async {
  try {
    // Obtém o diretório de documentos do app
    Directory diretorio = await getApplicationDocumentsDirectory();
    
    // Cria o arquivo usuario.txt
    File arquivo = File('${diretorio.path}/usuario.txt');
    
    // Escreve os dados no arquivo
    await arquivo.writeAsString(
      'Nome: ${nomeController.text}\n'
      'Email: ${emailController.text}\n'
      'Senha: ${senhaController.text}'
    );
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Dados salvos com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  } catch (e) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao salvar: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
```

### 🔄 Atualizar função criarConta

```dart
void criarConta() {
  if (nomeController.text.isEmpty ||
      emailController.text.isEmpty ||
      senhaController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Preencha todos os campos')),
    );
  } else {
    // Salvar os dados
    salvarUsuario();
    
    // Volta para a tela de login
    Navigator.pop(context);
  }
}
```
### Lembre-se : StatelessWidget vs StatefulWidget


| StatelessWidget| 	StatefulWidget | 
| ----------------| -------------- | 
| Não muda após construído	| Pode mudar dinamicamente| 
| Interface estática |  Interface interativa| 
| Exemplo: ícone, texto fixo	| Exemplo: formulário, contador| 

## 📁 Organização de Pastas


| Pasta	| Tipo de Widget | 	Exemplo | 
|------- |-------| ----| 
| screens/	| StatefulWidget (geralmente)	| Tela de login| 
| widgets/	| StatelessWidget (geralmente)| Botão personalizado| 
| models/	| Classes Dart	| Classe Usuário| 
| services/	| Lógica de negócio	| AuthService| 