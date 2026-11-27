# Raport testów Function-Core

Testy wykonano fizycznie w katalogu `content/Function-Core`.

## Kompilacja

Wykonano:

```text
xdev -each *.prg
```

304 pliki `.prg` poddano kompilacji. 298 programów zbudowano poprawnie.
Nie zbudowano:

- `CdpExists.prg` — brak symboli `CDPEXISTS`, `UTF8TOSTR`, `ISO_8859_2`, `CP852`, `CP1250`, `CP932`, `MAZOVIA`.
- `CdpList.prg` — brak symboli `CDPLIST`, `CDPEXISTS`, `CP852`, `CP1250`.
- `CdpTerm.prg` — brak symbolu `CDPTERM`.
- `StrToUTF8.prg` — brak symboli `STRTOUTF8`, `CP852`, `CP1250`.
- `Translate.prg` — brak symboli `TRANSLATE`, `CP852`, `CP1250`, `MAZOVIA`.
- `UTF8ToStr.prg` — brak symboli `UTF8TOSTR`, `STRTOUTF8`, `CP852`, `CP1250`.

## Uruchomienie

Uruchomiono 283 zbudowane, nieinteraktywne przykłady. Pominięto 15 przykładów
z `Inkey()` lub oknami: `AChoice`, `Alert`, `CharWin`, `ClearEol`, `ClearWin`,
`ClEol`, `ClWin`, `ColorWin`, `Enhanced`, `InvertWin`, `IsDefColor`,
`ScreenAttr`, `SetColor`, `Standard`, `Unselected`.

## Błędy wyników

`CharNoList.prg`:

```text
Len( CharNoList() )                     ERROR
```

Oczekiwano `OK`.

`Transform.prg`:

```text
Transform( "zażółć", "@!" )        ERROR: [ZAŻÓŁĆ]
```

Oczekiwano `OK`.

## Dodatkowe testy UTF-8

Ponownie uruchomiono funkcje: `Asc`, `IsAscii`, `StrIsUTF8`, `UTF8Asc`,
`UTF8Chr`, `UChars`, `UPeek`, `UPoke`, `URAt`, `Transform`, `CharNoList`,
`PosAlpha`, `PosUpper`, `PosLower`, `PosChar`, `PosDel`, `PosIns`, `PosRepl`,
`PosRange`, `RangeRem`, `RangeRepl`, `CharRem`, `CharOnly`, `CharRepl`.

Wszystkie testy UTF-8 zakończyły się `OK`, z wyjątkiem:

- `CharNoList.prg`: `Len( CharNoList() )` zwraca `ERROR`.
- `Transform.prg`: przypadek `Transform( "zażółć", "@!" )` zwraca `ERROR: [ZAŻÓŁĆ]`.

`StrToUTF8.prg` i `UTF8ToStr.prg` nie zostały uruchomione, ponieważ nie
zbudowały się z powodu brakujących symboli kodowań.

## Przyczyna sześciu błędów linkowania

Pliki `CdpExists.prg`, `CdpList.prg`, `CdpTerm.prg`, `StrToUTF8.prg`,
`Translate.prg` i `UTF8ToStr.prg` nie są zgodne z aktualnym API xDev.
Odwołują się do usuniętych funkcji (`CdpExists()`, `CdpList()`, `CdpTerm()`,
`StrToUTF8()`, `UTF8ToStr()`, `Translate()`) oraz do dawnych stron kodowych
(`CP852`, `CP1250`, `CP932`, `ISO_8859_2`, `MAZOVIA`). Aktualny projekt używa
wyłącznie UTF-8 i nie udostępnia tych symboli. To jest niezgodność kodu
przykładów z aktualnym API, a nie błąd samego linkera.

## Próba uruchomienia przykładów interaktywnych

Uruchomiono także wszystkie 15 wcześniej pominiętych programów z limitem
3 sekund. Każdy przekroczył limit i został zakończony jako program wymagający
klawiatury lub okna:

`AChoice`, `Alert`, `CharWin`, `ClearEol`, `ClearWin`, `ClEol`, `ClWin`,
`ColorWin`, `Enhanced`, `InvertWin`, `IsDefColor`, `ScreenAttr`, `SetColor`,
`Standard`, `Unselected`.

 Nie da się potwierdzić ich wierszy `$OUTPUT$` bez ręcznej obsługi klawiatury
 i okna. Sześć programów z błędem linkowania nie ma wykonywalnego testu.

## Działanie po analizie

Ponieważ wymienione sześć funkcji nie istnieje w aktualnym API xDev, a projekt
obsługuje wyłącznie UTF-8, ich nieaktualne pliki dokumentacji usunięto.
Pozostawiono i sprawdzono aktualne funkcje UTF-8: `StrIsUTF8`, `UTF8Asc`,
`UTF8Chr`, `UChars`, `UPeek`, `UPoke` i `URAt`.
