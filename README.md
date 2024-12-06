# tex-env

## ショートカットキーの設定

`keybindings.json`に以下を追加することで、ビルドレシピの選択（`ctrl+alt+t`）、ビルドの強制停止（`ctrl+alt+d`）、一時ファイルの削除（`ctrl+alt+c`）のショートカットを使用できるようになる。
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
}
```
