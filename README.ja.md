# VS Code LaTeX Dev Container

[English](README.md)

VS Code の Dev Container で LaTeX 文書を作成・ビルドするための最小構成テンプレートです。

ホスト環境に TeX Live を直接インストールせず、コンテナ内の TeX Live で再現性のあるビルド環境を用意することを目的としています。

## 特徴

- Dev Container による TeX Live 環境
- コンテナ内に VS Code LaTeX Workshop 拡張を導入
- 保存時の自動ビルド
- `latexmk` によるビルド
- デフォルトで LuaLaTeX を使用
- ビルド成果物は `build/` に出力

## 必要なもの

- [Visual Studio Code](https://code.visualstudio.com/)
- [Dev Containers 拡張](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- Docker など、VS Code Dev Containers が対応するコンテナ実行環境

## 使い方

1. このリポジトリをクローンします。

   ```sh
   git clone https://github.com/kai0930/vscode-latex-devcontainer.git
   cd vscode-latex-devcontainer
   ```

2. VS Code でリポジトリを開きます。

3. Dev Container でワークスペースを開き直します。

   VS Code のコマンドパレットから **Dev Containers: Reopen in Container** を実行します。

4. `main.tex` を編集します。

5. ファイルを保存すると自動でビルドされます。手動でビルドする場合は、次を実行します。

   ```sh
   latexmk main.tex
   ```

生成された PDF と中間ファイルは `build/` に出力されます。

## ディレクトリ構成

```text
.
├── .devcontainer/
│   └── devcontainer.json
├── .vscode/
│   └── extensions.json
├── latexmkrc
├── main.tex
├── README.md
├── README.ja.md
├── scripts/
│   └── clean-template-files.sh
└── LICENSE
```

## 設定内容

Dev Container では `texlive/texlive` イメージを使用し、コンテナ内に LaTeX Workshop をインストールします。

LaTeX のビルド設定は `latexmkrc` で定義しています。

- エンジン: LuaLaTeX
- PDF モード: `latexmk` の PDF mode 4
- 出力先: `build/`

LaTeX Workshop は `latexmk` を使って `main.tex` をビルドするように設定されています。

## カスタマイズ

- `main.tex` を自分の文書に置き換えてください。
- 必要に応じて `.bib`、`.sty`、画像、章ごとの TeX ファイルなどを追加できます。
- VS Code 拡張やコンテナ設定を追加したい場合は `.devcontainer/devcontainer.json` を編集してください。
- pdfLaTeX や XeLaTeX を使いたい場合は `latexmkrc` を変更してください。

## テンプレートとして使う場合

このリポジトリを GitHub のテンプレートとして使えるようにするには、GitHub 上で次の設定を行います。

1. GitHub でこのリポジトリを開きます。
2. **Settings** を開きます。
3. **General** の中にある **Template repository** を有効にします。

有効化すると、GitHub の **Use this template** ボタンからこのリポジトリを元に新しいリポジトリを作成できます。

このリポジトリから自分のプロジェクトを作成したあと、テンプレート用 README を削除できます。

```sh
scripts/clean-template-files.sh
```

このスクリプトは確認後に `README.md` と `README.ja.md` を削除します。`LICENSE` はデフォルトでは残します。

## ビルドファイルの削除

生成ファイルを削除するには、次を実行します。

```sh
latexmk -C
```

または、`build/` ディレクトリを手動で削除してください。

## ライセンス

このプロジェクトは MIT License で公開されています。詳細は [LICENSE](LICENSE) を参照してください。
