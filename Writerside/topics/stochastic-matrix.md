# stochastic_matrix

Funcția este folosită pentru a construi o matrice stocastică dintr-un corpus de cuvinte, bazată pe secvențe de cuvinte de lungime `k`.

> **Functia nu depinde de alte functii**
{style="note"}

## Implementare

> function retval = stochastic_matrix(k_secv_corpus, corpus_words, words_set, k_secv_set, k)

Funcția va returna o matrice stocastică `retval`, care reprezintă frecvențele de tranziție între secvențele de cuvinte și cuvintele următoare din corpus.

1. convertesc cuvintele din corpus și secvențele de cuvinte în seturi unice pentru a reduce redundanța și pentru a accelera accesul la date.

   ```C#
      [words_set, ~, corpus_idx] = unique(corpus_words);
      [~, ~, k_secv_idx] = unique(k_secv_corpus);
   ```

2. prealoc matricea de rezultate `retval` cu zerouri,

   ```C#
   retval = zeros(length(k_secv_set), length(words_set));
   ```

3. calculează indexul maxim până la care se poate itera în corpus fără a depăși limita acestuia

   ```C#
   max_word_index = length(corpus_words) - k;
   ```

4. iterez prin corpus și se calculez frecvențele de apariție a fiecărui cuvânt care urmează după o secvență de cuvinte de lungime `k`. Frecvențele sunt actualizate în matricea `retval`.

   ```C#
   for i = 1:max_word_index
        k_seq_index = k_secv_idx(i);
        next_word_index = corpus_idx(i + k);
        retval(k_seq_index, next_word_index) = retval(k_seq_index, next_word_index) + 1;
   end
   ```

## Cod sursa

   ```C#
   function retval = stochastic_matrix(k_secv_corpus, corpus_words, words_set, k_secv_set, k)
         % Convertesc seturile in celule pentru acces ultra fast
         [words_set, ~, corpus_idx] = unique(corpus_words);
         [~, ~, k_secv_idx] = unique(k_secv_corpus);

         % prealoc matricea de rezultate
         retval = zeros(length(k_secv_set), length(words_set));

         % Calculez index maxim
         max_word_index = length(corpus_words) - k;

         % vectorizez si calculez frecventele
         for i = 1:max_word_index
            k_seq_index = k_secv_idx(i);
            next_word_index = corpus_idx(i + k);
            retval(k_seq_index, next_word_index) = retval(k_seq_index, next_word_index) + 1;
         end
   endfunction
   ```
{collapsible="true" default-state="expanded" collapsed-title-line-number="1"}