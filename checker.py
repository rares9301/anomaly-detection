#!/usr/bin/python3

# ==============================================================================
#                             [ MIT License Notice ]
# ==============================================================================
#  Copyright (c) 2023 Valentin-Ioan VINTILĂ
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in
#  all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#  SOFTWARE.
# ==============================================================================

CHECKER_FOLDER = "checker"
JSON_CONFIG_PATH = f"{CHECKER_FOLDER}/config.json"
DEFAULT_TEST_TIMEOUT = 20  # seconds

import multiprocessing
import subprocess
import shutil
import math
import json
import time
import sys
import os


# This function will read the checker configuration from a given JSON file and
# save the info in specific variables.
# - - -
# Params: filename = A path to the JSON config file.
# - - -
# Returns: json_config
def read_configuration(filename):
    if os.path.isfile(filename) == False:
        return None
    fjson = open(filename, "r")
    json_config = json.load(fjson)
    return json_config


# This function will check that the provided JSON configuration is valid.
# - - -
# Params: json_config = The JSON configuration that shall be applied.
# - - -
# Returns: True iff no problem occured, False otherwise
def check_configuration(json_config):
    # Check the JSON file itself (through json_config)
    if not "test-groups" in json_config:
        print("[ FATAL:JSON ] Missing 'test-groups'. Please check the JSON file for errors.")
        return False
    if type(json_config["test-groups"]) != type([]):
        print("[ FATAL:JSON ] 'test-groups' must be a list. Please check the JSON file for errors.")
        return False
    for test_group in json_config["test-groups"]:
        if type(test_group) != type({}):
            print(
                "[ FATAL:JSON ] Each test group must be a dict (use {}). Please check the JSON file for errors."
            )
            print(f"[ FATAL:JSON ] The problem was encountered for {test_group}")
            return False
        if not "name" in test_group:
            print(
                "[ FATAL:JSON ] Each test group must contain a 'name' field. Please check the JSON file for errors."
            )
            print(f"[ FATAL:JSON ] The problem was encountered for {test_group}")
            return False
        if not "folder" in test_group:
            print(
                "[ FATAL:JSON ] Each test group must contain a 'folder' field. Please check the JSON file for errors."
            )
            print(f"[ FATAL:JSON ] The problem was encountered for {test_group}")
            return False
        if not "expected-file" in test_group:
            print(
                "[ FATAL:JSON ] Each test group must contain a 'expected-file' field. Please check the JSON file for errors."
            )
            print(f"[ FATAL:JSON ] The problem was encountered for {test_group}")
            return False
        if not "tests" in test_group:
            print(
                "[ FATAL:JSON ] Each test group must contain a 'tests' field. Please check the JSON file for errors."
            )
            print(f"[ FATAL:JSON ] The problem was encountered for {test_group}")
            return False
        if type(test_group["tests"]) != type([]):
            print(
                "[ FATAL:JSON ] The 'test' field inside a test group must be a list. Please check the JSON file for errors."
            )
            print(f"[ FATAL:JSON ] The problem was encountered for {test_group}")
            return False
        for test in test_group["tests"]:
            if type(test) != type({}):
                print(
                    "[ FATAL:JSON ] Each test inside a test group must be a dict (use {}). Please check the JSON file for errors."
                )
                print(
                    f"[ FATAL:JSON ] The problem was encountered inside the '{test_group['name']}' test group: {test}"
                )
                return False
            if not "name" in test:
                print(
                    "[ FATAL:JSON ] Each test inside a test group must contain a 'name' field. Please check the JSON file for errors."
                )
                print(
                    f"[ FATAL:JSON ] The problem was encountered inside the '{test_group['name']}' test group: {test}"
                )
                return False
            if not "test-score" in test:
                print(
                    "[ FATAL:JSON ] Each test inside a test group must contain a 'name' field. Please check the JSON file for errors."
                )
                print(
                    f"[ FATAL:JSON ] The problem was encountered inside the '{test_group['name']}' test group: {test}"
                )
                return False
            if not "test-type" in test:
                print(
                    "[ FATAL:JSON ] Each test inside a test group must contain a 'test-type' field. Please check the JSON file for errors."
                )
                print(
                    f"[ FATAL:JSON ] The problem was encountered inside the '{test_group['name']}' test group: {test}"
                )
                return False
            if test["test-type"] != "exact" and test["test-type"] != "approx":
                print(
                    '[ FATAL:JSON ] The \'test-type\' field may only be set to "exact" or "approx". Please check the JSON file for errors.'
                )
                print(
                    f"[ FATAL:JSON ] The problem was encountered inside the '{test_group['name']}' test group: {test}"
                )
                return False
            if test["test-type"] == "approx" and not "max-error" in test:
                print(
                    "[ FATAL:JSON ] The 'test-type' field is set to \"approx\", so a 'max-error' field should be provided. Please check the JSON file for errors."
                )
                print(
                    f"[ FATAL:JSON ] The problem was encountered inside the '{test_group['name']}' test group: {test}"
                )
                return False
            if test["test-type"] == "exact" and "max-error" in test:
                print(
                    "[ FATAL:JSON ] The 'test-type' field is set to \"exact\", so a 'max-error' field should NOT be provided. Please check the JSON file for errors."
                )
                print(
                    f"[ FATAL:JSON ] The problem was encountered inside the '{test_group['name']}' test group: {test}"
                )
                return False

    # Check the subfiles and subfolders
    for test_group in json_config["test-groups"]:
        expected_dir = f"{CHECKER_FOLDER}/{test_group['folder']}"
        if not os.path.isdir(expected_dir):
            print(
                f"[ FATAL:DIR ] Missing folder for test group '{test_group['name']}' (expected '{expected_dir}')"
            )
            return False
        for test in test_group["tests"]:
            expected_subdir = f"{expected_dir}/{test['name']}"
            if not os.path.isdir(expected_subdir):
                print(
                    f"[ FATAL:SUBDIR ] Missing subfolder for test group '{test_group['name']}' / test '{test['name']}' (expected '{expected_subdir}')"
                )
                return False
            test_file = f"{expected_subdir}/run_test.m"
            if not os.path.isfile(test_file):
                print(
                    f"[ FATAL:TEST ] Missing 'run_test.m' file for test group '{test_group['name']}' / test '{test['name']}' (expected '{test_file}')"
                )
                return False
            test_ref = f"{expected_subdir}/ref"
            if not os.path.isfile(test_ref):
                print(
                    f"[ FATAL:TEST ] Missing 'ref' file for test group '{test_group['name']}' / test '{test['name']}' (expected '{test_ref}')"
                )
                return False

    # All went well
    return True


# This function evaluates a given test.
# - - -
# Params: test_group = The test group in which the test is currently found.
#         test = The test that shall be run.
# - - -
# Returns: (score, msg), where:
#          score = A score from 0 to test-score
#          msg = A text description of the final result
def evaluate_test(test_group, test):
    if not os.path.isdir(test_group["expected-file"]):
        return (0, f"missing '{test_group['expected-file']}'")

    test_subdir = f"{CHECKER_FOLDER}/{test_group['folder']}/{test['name']}/"
    src_files = os.listdir(test_group["expected-file"])
    task2_data = int((test_group["folder"])[-1]) == 2
    for file_name in src_files:
        full_file_name = os.path.join(test_group["expected-file"], file_name)
        if os.path.isfile(full_file_name):
            shutil.copy(full_file_name, os.path.join(test_subdir, file_name))

    with open(f"{test_subdir}/stdout", "w") as fout:
        with open(f"{test_subdir}/stderr", "w") as ferr:
            p = subprocess.Popen(
                ["octave", "run_test.m"], cwd=test_subdir, stdout=fout, stderr=ferr
            )
            try:
                if task2_data and "gradient" or "4" in test_subdir:
                    timeout = DEFAULT_TEST_TIMEOUT + 1
                    p.wait(timeout)
                else:
                    p.wait(timeout=DEFAULT_TEST_TIMEOUT)
            except subprocess.TimeoutExpired:
                p.terminate()
                p.wait()

                # Cleanup
                files = os.listdir(test_subdir)
                for file_name in files:
                    if (
                        file_name[-2:] == ".m"
                        and file_name != "run_test.m"
                        and file_name != "output.mat"
                    ):
                        os.remove(os.path.join(test_subdir, file_name))
                if task2_data and "gradient" or "4" in test_subdir:
                    return (0, f"TIMEOUT (> {timeout}s)")
                else:
                    return (0, f"TIMEOUT (> {DEFAULT_TEST_TIMEOUT}s)")

    # Cleanup
    files = os.listdir(test_subdir)
    for file_name in files:
        if file_name[-2:] == ".m" and file_name != "run_test.m" and file_name != "output.mat":
            os.remove(os.path.join(test_subdir, file_name))

    # Cleanup
    os.remove(f"{test_subdir}/stderr")

    # Compare out & ref based on the provided argument
    numbers_out = None
    try:
        with open(f"{test_subdir}/out") as fout:
            if test["test-type"] == "exact":
                if task2_data:
                    numbers_out = [x for x in fout.read().split()]
                else:
                    numbers_out = [int(float(x)) for x in fout.read().split()]
            elif test["test-type"] == "approx":
                numbers_out = [float(x) for x in fout.read().split()]
    except ValueError:
        return (0, "out should only contain numbers")
    numbers_ref = None
    try:
        with open(f"{test_subdir}/ref") as fref:
            if test["test-type"] == "exact":
                if task2_data:
                    numbers_ref = [x for x in fref.read().split()]
                else:
                    numbers_ref = [int(float(x)) for x in fref.read().split()]
            elif test["test-type"] == "approx":
                numbers_ref = [float(x) for x in fref.read().split()]
    except ValueError:
        return (0, "ref should only contain numbers")

    if len(numbers_out) != len(numbers_ref):
        return (0, "WA")

    if test["test-type"] == "exact":
        for i in range(len(numbers_ref)):
            if numbers_out[i] != numbers_ref[i]:
                return (0, "WA")
    elif test["test-type"] == "approx":
        for i in range(len(numbers_ref)):
            if math.fabs(numbers_out[i] - numbers_ref[i]) > float(test["max-error"]):
                return (0, "WA")

    # Cleanup
    os.remove(f"{test_subdir}/out")

    # TODO - future development shall allow for partial points
    percent = 1
    msg = "OK"
    return (percent * test["test-score"], msg)


# This function will go through each test of a group individually. Output shall
# be provided throughout the whole process.
def evaluate_test_group(test_group):
    total_points = 0
    max_points = 0
    print(test_group["name"])
    print("-" * len(test_group["name"]))
    for test in test_group["tests"]:
        print(f"\n[{test['name']}]: ", end="")
        test_return = evaluate_test(test_group, test)
        print(f"{test_return[0]}p / {test['test-score']}p ({test_return[1]})", end="")
        total_points += test_return[0]
        max_points += test["test-score"]

    print(f"\n\n=> TOTAL: {total_points}p / {max_points}p\n")
    return (total_points, max_points)


# This function will go through each test group individually and mark them
# accordingly. Output shall be provided throughout the whole process.
def evaluate_all_test_groups(json_config):
    total_points = 0
    max_points = 0
    print("\n", end="")
    print("=" * 80)
    print("The Numerical Methods team reserves its right to change your final score in case")
    print("anything suspicious is found in the source code.")
    print("\nPlease refer to the course's guidelines for more info.")
    # print("\nThis checker is kindly provided as an open-source project by Valentin Vintilă.")
    # print("Check it out on GitHub: https://github.com/w1bb/NM-checker")
    print("=" * 80)
    for test_group in json_config["test-groups"]:
        print("\n", end="")
        (group_tp, group_mp) = evaluate_test_group(test_group)
        total_points += group_tp
        max_points += group_mp
    print("= " * 40)
    print(f"FINAL SCORE: {total_points}p / {max_points}p")
    if total_points == max_points:
        print("Congratulations, you did it!\n")
    print("Up to 10p can be awarded for providing a good README and clean code!")
    print("= " * 40, end="\n\n")


# Checker's true entrypoint
def main(arguments):
    # Check for the checker folder
    if not os.path.isdir("checker"):
        print(f"[ FATAL ] Missing 'checker' folder!")
        return -1

    # Get the JSON config
    json_config = read_configuration(JSON_CONFIG_PATH)
    if json_config == None:
        print(f"[ FATAL ] Missing JSON config file (expected '{JSON_CONFIG_PATH}')!")
        return -1

    # Check the config
    if check_configuration(json_config) == False:
        print(f"[ FATAL ] JSON config ('{JSON_CONFIG_PATH}') is invalid!")
        return -1

    # Check the arguments
    if len(arguments) > 1 or (len(arguments) == 1 and not arguments[0].isnumeric()):
        print(f"\nChecker usage: ./checker [task-number]\n")
        return -1

    if len(arguments) == 1:
        x = int(arguments[0])
        if x <= 0 or x > len(json_config["test-groups"]):
            print(f"\nThere is no task {x}.")
            print(f"Please provide a value in the [1, {len(json_config['test-groups'])}] range.\n")
            return -1
        json_config["test-groups"] = json_config["test-groups"][(x - 1) : x]

    # Start the checker
    evaluate_all_test_groups(json_config)


# Pass control to the main() function
if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
