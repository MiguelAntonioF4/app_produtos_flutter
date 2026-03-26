# 📦 App de Cadastro de Produtos

**Nome:** [Miguel Antônio]
**Turma:** ADS 5ª Fase — 2026/1
**Disciplina:** Desenvolvimento para Dispositivos Móveis

---

## 📱 Sobre o Projeto

Aplicativo Flutter desenvolvido como atividade prática da Aula 8, focado em navegação entre múltiplas telas com passagem de dados usando `Navigator.push()` e `Navigator.pop()`.

---

## 🗂️ Estrutura de Pastas

```
app_produtos/
├── android/
│   └── app/src/main/
│       └── AndroidManifest.xml
└── lib/
    ├── main.dart
    ├── models/
    │   └── produto.dart
    └── screens/
        ├── lista_produtos.dart
        ├── cadastro_produto.dart
        └── detalhe_produto.dart
```

---

## 🖼️ Screenshots

### Tela 1 — Lista de Produtos
<img width="1892" height="930" alt="image" src="https://github.com/user-attachments/assets/cfb7e252-6462-4528-8f27-abfa1c4ea08c" />


### Tela 2 — Cadastro de Produto
<img width="1900" height="683" alt="image" src="https://github.com/user-attachments/assets/0f2cf9bb-ad0e-4e67-87b7-c7388c2450a0" />


### Tela 3 — Detalhes do Produto
<img width="1892" height="884" alt="image" src="https://github.com/user-attachments/assets/0348a678-20d5-4651-81af-ab573d314efd" />


---

## 🔄 Fluxo de Navegação

```
Tela 1 (Lista)
    │
    ├── FAB (+) ──────────────────► Tela 2 (Cadastro)
    │                                      │
    │        produto retornado via pop() ◄──┘
    │        → adicionado à lista
    │
    └── Toque no produto ──────────► Tela 3 (Detalhes)
                                           │
                                    botão voltar ◄──┘
```

1. **Lista → Cadastro:** usuário toca no FAB `+`, é levado ao formulário de cadastro
2. **Cadastro → Lista:** ao salvar, o produto é retornado via `Navigator.pop(context, produto)` e adicionado à lista com `setState()`
3. **Lista → Detalhes:** ao tocar em um produto da lista, o objeto `Produto` é passado para a tela de detalhes
4. **Detalhes → Lista:** botão voltar da AppBar retorna à lista

---

## ✅ Funcionalidades Implementadas

- [x] Listar produtos cadastrados
- [x] Mensagem quando a lista está vazia
- [x] Cadastrar novo produto (nome, preço, descrição)
- [x] Visualizar detalhes do produto
- [x] Navegação com `Navigator.push()` e `Navigator.pop()`
- [x] Passagem de dados entre telas
- [x] Validação de campos no formulário
- [x] Formatação de preço em `R$ 0,00`
- [x] Suporte a imagem via URL *(bônus)*

---

## 🚀 Como Executar

### Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado
- Android Studio ou VS Code configurado
- Emulador Android ou dispositivo físico conectado

### Passo a passo

```bash
# 1. Clone o repositório
git clone https://github.com/seu-usuario/app-produtos-flutter-seunome.git

# 2. Entre na pasta do projeto
cd app-produtos-flutter-seunome

# 3. Instale as dependências
flutter pub get

# 4. Execute o app
flutter run
```

---

## 🛠️ Tecnologias

- [Flutter](https://flutter.dev/) 3.x
- Dart
- Material Design 3
