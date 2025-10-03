# tex-env

## セットアップ

.env ファイルを作成し，UID および GID を設定する。

```bash
echo "UID=$(id -u)" > ./.devcontainer/.env
echo "GID=$(id -g)" >> ./.devcontainer/.env
```

## ビルドレシピ

- `.vscode/settings.json`の`"latex-workshop.latex.recipe.default"`を変更することでデフォルトのビルドレシピを変更できる．

  - `latexmk`：原稿用
  - `xelatex`：スライド用

## ショートカット

- `keybindings.json`に以下を追加することで，ショートカットを使用できるようになる．

### Windows の場合

```json
{
    "key": "ctrl+alt+t", // ビルドレシピの選択
    "command": "latex-workshop.recipes",
    "when": "editorLangId == latex"
},
{
    "key": "ctrl+alt+d", // ビルドの強制停止
    "command": "latex-workshop.kill",
    "when": "editorLangId == latex"
},
{
    "key": "ctrl+alt+c", // 一時ファイルの削除
    "command": "latex-workshop.clean",
    "when": "editorLangId == latex"
},
{
    "key": "ctrl+alt+s", // ビルドの強制停止 + 一時ファイルの削除 + ビルド
    "command": "runCommands",
    "args": {
        "commands": [
            "latex-workshop.kill",
            "latex-workshop.clean",
            "latex-workshop.build"
        ]
    },
    "when": "editorLangId == latex"
}
```

### Mac の場合

```json
{
    "key": "shift+cmd+t", // ビルドレシピの選択
    "command": "latex-workshop.recipes",
    "when": "editorLangId == latex"
},
{
    "key": "shift+cmd+d", // ビルドの強制停止
    "command": "latex-workshop.kill",
    "when": "editorLangId == latex"
},
{
    "key": "shift+cmd+c", // 一時ファイルの削除
    "command": "latex-workshop.clean",
    "when": "editorLangId == latex"
},
{
    "key": "shift+cmd+s", // ビルドの強制停止 + 一時ファイルの削除 + ビルド
    "command": "runCommands",
    "args": {
        "commands": [
            "latex-workshop.kill",
            "latex-workshop.clean",
            "latex-workshop.build"
        ]
    },
    "when": "editorLangId == latex"
}
```

## SSH 鍵の共有

- keychain を使用して SSH 鍵を共有する．

### keychain のインストール

#### WSL の場合

```bash
sudo apt install keychain
```

#### Mac の場合

```zsh
sudo brew install keychain
```

### keychain の設定

- 共有したい ssh 鍵が`~/.ssh/id_rsa`である場合，以下を`~/.bashrc`または`~/.zshrc`に追加する．

```bash
keychain -q --nogui $HOME/.ssh/id_rsa
source $HOME/.keychain/$(hostname)-sh
```
