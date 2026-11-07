# Dokumentacja xDev

Repozytorium strony dokumentacji języka xDev: [xdev-language.github.io](https://xdev-language.github.io/).

Strona powstaje z plików `*.prg`. Parser odczytuje zawartą w nich dokumentację i przykłady, a generator tworzy strony HTML. Dokumentacja pozostaje blisko kodu.

Do zbudowania strony potrzebny jest Node.js w wersji 22 lub nowszej. W katalogu repozytorium uruchom:

```sh
npm run build
```

Gotowa strona trafi do katalogu `.site/`.

> [!NOTE]
> Kompilator xDev jest nadal w trakcie rozwoju.
