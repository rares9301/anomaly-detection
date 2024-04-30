# split_dataset

Funcția este folosită pentru a împărți un set de date `X` și etichetele asociate `y` în două subgrupuri: unul pentru antrenament și unul pentru predicții, bazat pe un procentaj dat.

> **Functia nu depinde de alte functii**
{style="note"}

## Implementare


> function [X_train, y_train, X_pred, y_pred] = split_dataset (X, y, percentage)

Funcția va returna patru seturi de date: `X_train` și `y_train` pentru antrenament, și `X_pred` și `y_pred` pentru predicții.

1. determin numărul total de puncte de date din setul `X`

   ```C#
   num_data = size(X, 1);
   ```

2. calculez numărul de puncte de date care vor fi folosite pentru antrenament, rotunjind produsul dintre procentajul dat și numărul total de date.

   ```C#
   num_train_data = round(percentage * num_data);
   ```

3. creez un vector de indici `train_indices` pentru datele de antrenament

   ```C#
   train_indices = 1:num_train_data;
   ```

4. creez un vector de indici `pred_indices` pentru datele de predicție

   ```C#
   pred_indices = num_train_data + 1:num_data;
   ```
5. extrag datele de antrenament `X_trai`n și etichetele `y_train` folosind indicii de antrenament.

   ```C#
   X_train = X(train_indices, :);
   y_train = y(train_indices);
   ```

6. extrag datele de predicție `X_pred` și etichetele `y_pred` folosind indicii de predicție.

   ```C#
   X_pred = X(pred_indices, :);
   y_pred = y(pred_indices);
   ```


## Cod sursa

   ```C#
   function [X_train, y_train, X_pred, y_pred] = split_dataset (X, y, percentage)
      % total data points
      num_data = size(X, 1);

      % round 
      num_train_data = round(percentage * num_data);

      % indices for training
      train_indices = 1:num_train_data;

      % indices for preds
      pred_indices = num_train_data + 1:num_data;

      % training data
      X_train = X(train_indices, :);
      y_train = y(train_indices);

      % prediction data
      X_pred = X(pred_indices, :);
      y_pred = y(pred_indices);

   endfunction
   ```
{collapsible="true" default-state="expanded" collapsed-title-line-number="1"}