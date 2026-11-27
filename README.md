# xDev Documentation

This repository contains the [xDev language documentation website](https://xdev-language.github.io/).

The site is built from `*.prg` files. The parser extracts the documentation and examples from these files, and the generator produces HTML pages. This keeps the documentation close to the code.

Building the site requires Node.js 22 or later. From the repository root, run the following command.

```sh
npm run build
```

The generated site is written to the `.site/` directory.

> [!NOTE]
> The xDev compiler is still in development.
