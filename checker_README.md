# Numerical Methods - First Homework Checker

This repository contains the current Numerical Methods checker. The project is
intended to be easily modifiable to any user's needs.

Please refer to this README in order to fully understand how to use it.

## License

This project was written by **Valentin-Ioan Vintilă** and it is provided under
the MIT License. For more info about the author, check out his
[personal website](https://v-vintila.com/).

In order to legally use the checker, don't forget to include a copy of the
license that comes with.

## Usage

In order to run the checker, all you have to do is run `./checker.py` from your
favorite bash terminal. If you only want to run a specific task, you can do so
by calling `./checker.py X`, where `X` is the task's number (for example,
`./checker.py 2` will only run the checker for the second task).

## Internal settings

The checker is written entirely in Python 3 and it was tailor-made to be easily
customizable. Most settings can be changed in a separate JSON file. However,
a few are left out in the `checker.py` file:

- `CHECKER_FOLDER` - This is a constant that tells the checker where are its
  *insides*. All the content required by the checker shall be provided in this
  folder. By default, this value is set to `checker`.
- `JSON_CONFIG_PATH` - This is the path to the JSON file that contains most
  settings. By default, this value is set to `{CHECKER_FOLDER}/config.json`.
- `DEFAULT_TEST_TIMEOUT` - This constant represents the number of seconds that
  each test should be run for. By default, this value is set to `2`.

## JSON File

The bread and butter of the checker is the JSON file (see `JSON_CONFIG_PATH`).
This file will contain the structure of the provided tests.

The config should contain a list of test groups (called `test-groups`) - these
were designed in order to store the tests for different tasks.

Each test group should have a name (`name`), a folder name that will contain
ref files and more (`folder`), a required file that is provided by the students
(`expected-file`) and a list of individual tests (`tests`).

Each test has a name (`name`) - **please use the convention bellow** -, a
maximum score (`test-score`) and a test type (`test-type`). The last parameter
can be:

- `"exact"` - This means that the values are probed exactly as they are. This is
  a great way to test integers, for example.
- `"approx"` - This means that the values can be similar, but they don't have to
  be the same. For this mode, **please provide the** `max-error` **field**!

Tests should be named using the following convention: the first test should be
called `test-01`, the second test should be `test-02` and so on. The example
provided with this repository **breaks** this convention for convenience.

## File structure

Each test group is expected to have a folder with the following path:
`{CHECKER_FOLDER}/folder`, where the value for `folder` is provided in the JSON
file.

Each test inside a test group is expected to have its own folder in:
`{CHECKER_FOLDER}/test-group-folder/test-folder`. The value for `test-folder` is
set by the test's name provided in the JSON file.

Each test should contain at least the following two files:

- `run_test.m` - This file should be runnable (meaning it should contain a valid
  Octave function called `run_test()`). The file is expected to create an output
  file called `out` inside the same folder.
- `ref` - This file shouldn't change. This file will be compared to the `out`
  file generated using the `run_test()` function.

As an example, please refer to the files provided in this repository.

## Output

The checker will create various forms of output to aid the students solve any
issues encountered throughout. The console will tell the user the score for each
test individually, alongside an error if it shall be necessary.

Error messages in case of TLE / WA are provided as well.
