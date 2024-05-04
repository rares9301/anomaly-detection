# Kernel Regression

În viața de zi cu zi ne întâlnim cu ideea de predicție. De exemplu, ne dorim să estimăm cât de
mult timp ne va consuma o temă, cât de mult timp vom sta în trafic, etc. Evident că răspunsurile
la astfel de întrebări depind de foarte mulți parametri și ne este destul de greu să găsim relații
de cauzalitate între ei.

## Functii

Au fost implementate urmatoarele functii:

[kernel_functions](kernel-functions.md)
: functii pentru a construi kernels de tipuri diferite

[build_kernel](build-kernel.md)
: constructor pentru kernel

[cholesky](cholesky.md)
: metoda pentru descompunerea LU a unei matrici pozitiv semi-definite.

[get_lower_inverse](get-lower-inverse.md)
: inverseaza o matrice lower folosind un algoritm de eliminare gaussiana.

[get_prediction-params](get-predictions-params.md)
: calculeaza parametrii de predicție

[get_prediction-params-iter](get-prediction-params-iter.md)
: calculeaza parametrii de predicție iterativ

[split_dataset](split-dataset.md)
: imparte dataset in train_data si pred_data
