## NLP Basic
* NLP levels:
  * Morphology: Lowest level, typically just single words
  * Syntax: Relations between words, could be some objects or subjects
  * Semantics: Synthetic structures, which represents the meaning
  * Pragmatics: highest level of abstraction

## Feature Generation
* Tokenization is the process that splits input sequence into so-called tokens, tokenization normalization includes: 1. Stemming: chop off the end of the words to get to its original status; 2. Lemmatization: transform word to its original status by use of a vocabulary and morphological analysis of words.

* tf-idf (Term frequency-inverse document frequency):
  * tf (Term frequency): tf(t, d), frequency for term (or n-gram) t in document d.
  * idf (Inverse document frequency): idf(t, D), total number of documents divided by number of documents where term t happens then take log.
  * tfidf(t, d, D) = tf(t, d) * idf(t, D), we can use this to vectorize tokens in each document.

* Hashing trick

* N-gram model is given previous (N-1) words, predict the next word. For a bigram case, we have P(W1|W2) = P(W1, W2)/P(W2). It is possible that we have some out of vocabulary words in test set (no in train set), to avoid the 0/0 situation we can use some Smoothing technique (Laplacian smoothing: P(W1|W2) = (P(W1, W2) + 1)/(P(W2) + V ), V is the (unique number of unigrams+1)). Based on the probability calculated by count in train set, we can calculate the probability of our test data.   

* part-of-speech tagging (POS tagging): Marking up a word as specific part of the speech (grammatical tagging) based on its own definition and context.

## Topic Modeling
* Semantic Text Similarity
  * Path Similarity: WordNet (http://www.nltk.org/howto/wordnet.html) has the hierarchy of all the words based on their meanings, Path Similarity is calculated based on the distance between two words' location in the WordNet.
  * Lin Similarity: Also based on WordNet, but Lin Similarity is calculated based on the LCS (lowest common Subsumer) of two words.
  * Distribution Similarity: Calculated based on the frequency of two words appearing in the same sentences or documents

* Generative Model and Discriminative Modeling
  * Generative Model focuses on the joint distribution p(X, y) of variables. A generative classifier decides the classification of test data by argmax f(X, y). Typical generative models include Naive Bayes, Gaussian Mixture Models...
  * Discriminative Model focuses on the conditional distribution p(y|X). A discriminative classifier decides the classification of test data by finding a most similar labeled observation and giving out the label class. Typical discriminative models include Logistic Regression, SVM, KNN, Neural Network...

* Latent Dirichlet allocation [LDA](http://www.jmlr.org/papers/volume3/blei03a/blei03a.pdf) is a generative statistical model.
  * Three elements are included in this model: topic (z), document (d) and word (w). We pick an document, the document can be considered as a mixture of topics (P(z|d)). We can generate words given topics (P(w|z)).
  * The distribution of z for each document (Multinomial(theta)) is decided by the Dirichlet distribution with hyperparameter alpha (theta ~ Dir(alpha)), the distribution of the words given topic (Multinomial(phi_z)) is decide by the Dirichlet distribution with hyperparameter beta (phi_z ~ Dir(beta)).
  * Use E-M algorithm or Gibbs Sampling estimate the theta and phi.
  * Number of topics needs to be decided in advance.  
