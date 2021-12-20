import rand
import math
pub fn to_ngram(input []string, n_order int) (map[string][]string, []string) {
	if n_order < 1 { error("Bruh.") }

	mut n_gram := map[string][]string{}
	mut beginnings := []string{}

	for i in 0 .. input.len {
		sentence := input[i]
		words := sentence.split(" ")

		mut sentence_beginnings := words[0]
		for j in 1 .. n_order {
			word := words[j]
			sentence_beginnings += ' $word'
		}
		beginnings << sentence_beginnings

		for j in 0 .. words.len {
			mut values := ""
			mut keys := ""

			for k in 0 .. n_order {
				value := if j + 1 + k >= words.len { "" } else { words[j + 1 + k] }
				key := if j + k >= words.len { "" } else { words[j + k] }
				values += if k == 0 {value} else {' $value'}
				keys += if k == 0 {key} else {' $key'}
			}

			n_gram[keys] << values
		}
	}

	return n_gram, beginnings
}

pub fn from_ngram(n_gram map[string][]string, beginnings []string) string {
	mut innit := beginnings[int(math.floor(rand.f64() * beginnings.len))]
	mut result := innit + " "
	for {
		if innit !in n_gram { break }
		gram := n_gram[innit]
		rand_index := int(math.floor(rand.f64() * gram.len))

		next_words := gram[rand_index]
		next_words_split := next_words.split(" ")
		next_word := next_words_split[next_words_split.len - 1] + " "
		result += next_word
		innit = next_words
	}
	return result
}