# Detectia Anomaliilor

Unul dintre primii pasi pe care trebuie sa ii faceti atunci cand vi se da un Training Data Set este
sa detectati asa-zisele anomalii (outliers). Acest lucru poarta numele de Anomaly Detection si
ajuta AI-ul caruia ii dati datele de training sa aiba un set de date consistent, fara greseli, si sa
determine outlierii din datele de testing.

## Functii

Au fost implementate urmatoarele functii:

[estimate_gaussian](estimate-gaussian.md)
: determina media si varianta pentru o distributie normala multivariata

[multivariate_gaussian](multivariate-gaussian.md)
: calculeaza densitatea de probabilitate pentru distributia normala multivariata

[optimal_threshold](optimal-threshold.md)
: determina cel mai bun factor ϵ

[identify_outliers](identify-outliers.md)
: determina outlierii ( probabilitatile mai mici decat epsilon)
