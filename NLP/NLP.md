## NLP Basic
* NLP levels:
  * Morphology: Lowest level, typically just single words
  * Syntax: Relations between words, could be some objects or subjects
  * Semantics: Synthetic structures, which represents the meaning
  * Pragmatics: highest level of abstraction

* Tokenization is the process that splits input sequence into so-called tokens, tokenization normalization includes: 1. Stemming: chop off the end of the words to get to its original status; 2. Lemmatization: transform word to its original status by use of a vocabulary and morphological analysis of words.

* tf-idf (Term frequency-inverse document frequency):
  * tf (Term frequency): tf(t, d), frequency for term (or n-gram) t in document d.
  * idf (Inverse document frequency): idf(t, D), total number of documents divided by number of documents where term t happens then take log.
  * tfidf(t, d, D) = tf(t, d) * idf(t, D), we can use this to vectorize tokens in each document.

* Hashing trick

## N-gram Language Model
* N-gram model is given previous (N-1) words, predict the next word. For a bigram case, we have P(W1|W2) = P(W1, W2)/P(W2). It is possible that we have some out of vocabulary words in test set (no in train set), to avoid the 0/0 situation we can use some Smoothing technique (Laplacian smoothing: P(W1|W2) = (P(W1, W2) + 1)/(P(W2) + V ), V is the (unique number of unigrams+1)). Based on the probability calculated by count in train set, we can calculate the probability of our test data.   

## Sequence Tagging with Probabilistic Models
