# VS Code LaTeX Dev Container

[日本語版](README.ja.md)

A minimal VS Code Dev Container setup for writing and building LaTeX documents with TeX Live.

This repository is intended as a small starting point for LaTeX projects that should build consistently without installing TeX Live directly on the host machine.

## Features

- TeX Live environment provided by a Dev Container
- VS Code LaTeX Workshop extension installed inside the container
- Automatic build on save
- `latexmk` build workflow
- LuaLaTeX by default
- Build artifacts written to `build/`

## Requirements

- [Visual Studio Code](https://code.visualstudio.com/)
- [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- A container runtime supported by VS Code Dev Containers, such as Docker

## Getting Started

1. Clone this repository.

   ```sh
   git clone https://github.com/kai0930/vscode-latex-devcontainer.git
   cd vscode-latex-devcontainer
   ```

2. Open the repository in VS Code.

3. Reopen the workspace in the Dev Container.

   Use **Dev Containers: Reopen in Container** from the VS Code command palette.

4. Edit `main.tex`.

5. Save the file to build automatically, or run:

   ```sh
   latexmk main.tex
   ```

The generated PDF and intermediate files are written to `build/`.

## Project Structure

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

## Configuration

The Dev Container configuration uses the `texlive/texlive` image and installs LaTeX Workshop inside the container.

The LaTeX build behavior is defined in `latexmkrc`:

- Engine: LuaLaTeX
- PDF mode: `latexmk` PDF mode 4
- Output directory: `build/`

LaTeX Workshop is configured to use `latexmk` and build `main.tex`.

## Customization

- Replace `main.tex` with your own document.
- Add project files such as `.bib`, `.sty`, images, and chapters as needed.
- Update `.devcontainer/devcontainer.json` if you need more VS Code extensions or container settings.
- Update `latexmkrc` if you prefer another engine, such as pdfLaTeX or XeLaTeX.

## Using This as a Template

To make this repository available as a GitHub template:

1. Open the repository on GitHub.
2. Go to **Settings**.
3. In **General**, enable **Template repository**.

After that, users can create a new repository from this template with GitHub's **Use this template** button.

After creating your own project from this repository, you can remove the template README files:

```sh
scripts/clean-template-files.sh
```

The script asks for confirmation, then removes `README.md` and `README.ja.md`. It keeps `LICENSE` by default.

## Cleaning Build Files

To remove generated files, run:

```sh
latexmk -C
```

You can also remove the `build/` directory manually.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
