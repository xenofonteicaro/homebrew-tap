# Icaro's Homebrew tap

Pacotes mantidos em código aberto.

## Zé Coleta

Utilitário macOS em SwiftUI para revisar arquivos temporários, encontrar
arquivos grandes e desinstalar aplicativos. Código sob licença MIT.

```sh
brew install --formula xenofonteicaro/tap/ze-coleta
ze-coleta
```

A fórmula exige macOS 14+ e Xcode 16+ já instalado. Compila uma revisão
imutável do código localmente, com SHA-256 verificado. Não instala Xcode,
não altera Gatekeeper e não remove quarantine. O app fica no prefixo do
Homebrew e o comando `ze-coleta` o abre.

```sh
ze-coleta --version
brew upgrade ze-coleta
brew uninstall ze-coleta
```

O primeiro pacote é experimental (`0.1.0-alpha.1`). A remoção de arquivos
exige seleção e revisão na interface, e usa a Lixeira do macOS. O app não
esvazia a Lixeira. Não há Cask ativo de binário notarizado nesta primeira
publicação; essa modalidade depende de Developer ID/notarização Apple.

Fonte, escopo e limitações: [xenofonteicaro/ze-coleta](https://github.com/xenofonteicaro/ze-coleta).
