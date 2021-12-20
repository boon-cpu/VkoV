# VkoV

VkoV is a smart and easy-to-use [Markov Chain](https://en.wikipedia.org/wiki/Markov_chain) manager written in [V](https://vlang.io) and based off of [boonkov](https://github.com/boon-cpu/boonkov).

### Example:

```v
import vkov { to_ngram, from_ngram }

sentences := [
  "This is the example input string",
  "This is another example string",
]
n_order := 1

// Generates N-Gram.
n_gram, beginnings := to_ngram(sentences, n_order) ?
// Uses N-Gram to generate new sentence.
output_string := from_ngram(n_gram, beginnings)

println(output_string)
```

## Methods

### to_ngram

The `to_ngram` function takes two parameters:

- `input` - An array of strings that build up the lexicon.
- `n_order` - A number (above 0) that determines the depth of the algorithm (lower number means quirkier responses.

The function returns two objects:

- `n_gram` - A map of strings and string arrays used to generate new sentences.
- `beginnings` - An array of strings used to determine sentence starters.

### from_ngram

The `from_ngram` function takes two parameters:

- `n_gram` - A map of strings and string arrays, can be generated using `to_ngram`.
- `beginnings` - An array of strings, can be generated using `to_ngram`

The function returns 1 object:

- `result` - A string containing a randomly generated sentence based off of the 2 parameters.
