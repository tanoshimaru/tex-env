# tex-env

## ビルドレシピ

- `.vscode/settings.json`の`"latex-workshop.latex.recipe.default"`を変更することでデフォルトのビルドレシピを変更できる．

  - `latexmk`：原稿用
  - `xelatex`：スライド用

## ショートカット

- `keybindings.json`に以下を追加することで，ビルドレシピの選択（`ctrl+alt+t`），ビルドの強制停止（`ctrl+alt+d`），一時ファイルの削除（`ctrl+alt+c`）のショートカットを使用できるようになる．

```
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
    "key": "cmd+s", // ビルドの強制停止 + 一時ファイルの削除 + ビルド
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

**※以下の作業はすべてホスト OS で行う．**

### keychain のインストール

- keychain をホスト OS にインストールする．

```bash
sudo apt install keychain
```

### keychain の設定

- 共有したい ssh 鍵が`~/.ssh/id_rsa`である場合，以下を`~/.bashrc`または`~/.zshrc`に追加する．

```bash
keychain -q --nogui $HOME/.ssh/id_rsa
source $HOME/.keychain/$(hostname)-sh
```
