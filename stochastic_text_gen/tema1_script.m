corpus = split_input("../checker/input/task3/data/large_20k_tinyshakespeare.txt");
k = 2;
word_set = distinct_words(corpus);
display("Got word set\n");
k_secv_corpus = k_secv(corpus, k);
display("Got k-grams (of words)\n");
k_secv_set = distinct_k_secv(k_secv_corpus);
display("Got k-grams set\n");
widx = word_idx(word_set);
widx.keys;
display("Created word index\n");
kscvidx = k_secv_idx(k_secv_set);
kscvidx.keys;
display("Greated feature index\n");
stoch = stochastic_matrix(k_secv_corpus, corpus, word_set, k_secv_set, k);
display("Created stochastic matrix\n");
probs = sample_next_word(split_input("test/test.txt"), widx, kscvidx, k, stoch);
display("Sample-ing next word given test.txt\n");
prob_choose(probs, word_set)
display("Sample n words");
sample_n_words(split_input("test/test.txt"), widx, kscvidx, k, stoch, word_set, 10)
