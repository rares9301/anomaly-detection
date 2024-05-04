# Markov Text Generation

Cel mai simplu task actual, in LLMs este Text Generation. ChatGPT insusi este un ”text
generator” implementat ca Transformer. In acest task, nu vom ajunge nici pe departe la nivelul
lui ChatGPT, ci vom incerca insa sa cream un mini-AI bazat pe Lanturi Markov care poate
genera text care sa semene cu un fisier de input.
Scopul acestui task este in primul rand sa va familiarizeze cu lucrul cu Stringuri si Cells in
MATLAB, si mai apoi sa va prezinte terminologia folosita in AI training.

## Functii

Au fost implementate urmatoarele functii:

[distinct_words](distinct-words.md)
: intoarce tokenurile sortate si unice.

[k_secv](k-secv.md)
: pentru un cell-array unidimensional returneaza un cell-array de k-secvente

[distinct_k_secv](distinct-k-secv.md)
: intoarce k-secventele sortate si unice.

[word_idx](word-idx.md)
: intoarce un dictionar care contine indecsii asociati fiecarui label.

[k_secv_idx](k-secv-idx.md)
: intoarce un dictionar care contine indecsii asociati fiecarui feature (k-secventa).

[stochastic_matrix](stochastic-matrix.md)
: creeaza matricea stochastica

