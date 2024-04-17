#!/bin/bash
root=../tests
all_args=("$@")
tests=0
scores=(0 5 5 5 7 8 5 10 10 15 5 10 15)
desc=("-" "split_input on x_piatza.txt" "distinct_words on x_piatza.txt" "distinct_words on x_abc.txt" "k_secv for k=2 on x_abc.txt" "k_secv for k=3 on x_abc.txt" "distinct_k_secv, k=2 on x_abc.txt" "distinct_k_secv & distinct_words, k=2 on small_100_poe.txt" "word_idx on small_100_poe.txt" "word_idx & k_secv_idx on small_100_poe.txt" "stochastic_matrix with k=2 on x_abc.txt" "stochastic_matrix with k=2 on small_100_poe.txt" "stochastic_matrix with k=2 on medium_2k_jekyll_and_hyde.txt")
score=0

for ((i=1; i<= 9; ++i)); do
    length=${#desc[i]}
    padding=$((81 - length))
    desc[i]="${desc[i]}$(printf '%*s' $padding)"
done

for ((i=10; i<= 12; ++i)); do
    length=${#desc[i]}
    padding=$((80 - length))
    desc[i]="${desc[i]}$(printf '%*s' $padding)"
done

check-diff() {
    test=$1
    out_file_path=$root/out/$(ls -h $root/out | grep "^${1}_out")
    ref_file_path=$root/ref/$(ls -h $root/ref | grep "^${1}_ref")
    difference=$(diff "$out_file_path" "$ref_file_path")
    lines=$(echo "$difference" | grep "^>" | wc -l)
    echo "$difference" > $root/logs/"${1}_diff"
    echo "$lines"
}

compute-score() {
    lines=$(check-diff "$1")
    if [ "$lines" -lt 2 ]; then
        # correct

        echo "Test $1: ${desc[$1]}    [PASSED] ..... [+${scores[$1]}]"
        echo "<SCORE>: ${scores[$1]}"
        score=$((score + scores[$1]))
    else
        echo "Test $1: ${desc[$1]}    [FAILED] ..... [ - ]"

        return 1
    fi
}

if [ "$#" -eq 0 ]; then
    rm $root/out/* 2> /dev/null
    echo Testing All 12 tests...
    echo To test only one test and see error messages, use ./checker.sh -t [test-number]
    echo "------------------------"
    echo
    octave checker_run.m -a > $root/logs/checker_logs.txt 2> $root/logs/error_all.txt
    exit_code=$?
    if [ "$exit_code" -ne 0 ]; then
        echo
        echo "Errors encountered! Please run tests individually to debug:)"
        echo "    Check out $root/logs/checker_logs.txt and $root/logs/error_all.txt"
        echo "    or run cat $root/logs/error_all.txt"
    else
        for ((i=1; i<=12; i++)); do
            compute-score $i
            echo
        done
    fi
else
    rm $root/out/${2}_*  2> /dev/null
    echo Testing Test \#$2
    octave checker_run.m "${all_args[@]}" > $root/logs/checker_logs.txt 2> $root/logs/error_test_${2}.txt
    exit_code=$?
    tests=$2
    if [ "$exit_code" -ne 0 ]; then
        echo "Test $2: ${desc[$2]}    [!ERROR] ..... [ - ]"
        echo "    Check out $root/logs/checker_logs.txt and $root/logs/error_test_${2}.txt"
    else
        compute-score $tests
    fi
fi