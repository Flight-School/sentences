# sentences

`sentences` is a command-line utility
that splits natural language text into sentences.

```terminal
$ cat propositions.txt
All men are mortal. Socrates is a man. Therefore, Socrates is mortal.

$ sentences propositions.txt
All men are mortal.
Socrates is a man.
Therefore, Socrates is mortal.

```

---

For more information about natural language processing,
check out Chapter 7 of the
[Flight School Guide to Swift Strings](https://flight.school/books/strings).

---

## Requirements

- macOS 10.13+

## Installation

Install `sentences` with [Homebrew](https://brew.sh) using the following command:

```terminal
$ brew install flight-school/formulae/sentences
```

## Usage

Text can be read from either standard input or file arguments,
and named entities are written to standard output on separate lines.

### Reading from Piped Standard Input

```terminal
$ echo "Designed by Apple in California. Assembled in China." | sentences
Designed by Apple in California. 
Assembled in China.

$ echo "床前明月光，疑是地上霜。举头望明月，低头思故乡。" | sentences
床前明月光，疑是地上霜。
举头望明月，低头思故乡。

```

### Reading from Standard Input Interactively

```terminal
$ sentences
Greetings from Cupertino, California! (This text is being typed into standard input.)
Greetings from Cupertino, California!
(This text is being typed into standard input.)

```

### Reading from a File

```terminal
$ head -n 1 think_different.txt
Here's to the crazy ones. The misfits. The rebels. The troublemakers.

$ sentences think_different.txt
Here's to the crazy ones.
The misfits.
The rebels.
The troublemakers.
The round pegs in the square holes.
The ones who see things differently.
They're not fond of rules.
And they have no respect for the status quo.
You can quote them, disagree with them, glorify or vilify them.
About the only thing you can't do is ignore them.
Because they change things.
They push the human race forward.
And while some may see them as the crazy ones, we see genius.
Because the people who are crazy enough to think they can change the world, are the ones who do.

```

## Advanced Usage

`sentences` can be chained with
[Unix text processing commands](https://en.wikibooks.org/wiki/Guide_to_Unix/Commands/Text_Processing),
like `cut`, `sort`, `uniq`, `comm`, `grep` `sed`, and `awk` ---
as well as its sibling tools,
[`ner`](https://github.com/Flight-School/ner) and [`pos`](https://github.com/Flight-School/pos).

### Filtering Tags

```terminal
$ sentences think_different.txt | head -n 1 | pos
ADVERB	Here
VERB	's
PREPOSITION	to
DETERMINER	the
ADJECTIVE	crazy
NOUN	ones
```

## Additional Details

`sentences` uses
[`NLTagger`](https://developer.apple.com/documentation/naturallanguage/nltagger)
when available,
falling back on
[`NSLinguisticTagger`](https://developer.apple.com/documentation/foundation/nslinguistictagger)
for older versions of macOS.

## License

MIT

## Contact

Mattt ([@mattt](https://twitter.com/mattt))
