# PRBMath Equivalence Fuzzing
The fuzz equivalence tests, created by [0xScourgedev](https://x.com/0xScourgedev) demonstrate finding the issue of mulDivSigned rounding towards zero instead of rounding down, as stated in the documentation.

The issues can be found using either Echidna or Medusa, and it should be found within 5 seconds of running the fuzzer using 1 worker and minimal hardware.

## Setup

1. Complete the setup instructions in the README of the root directory
2. Create virtual environment with `python -m venv`
3. Activate the virtual environment with `source venv/bin/activate`
4. Install dependencies with `pip install -r test/python/requirements.txt`

### Prerequisites

- The installation of Medusa, instructions can be found [here](https://github.com/crytic/medusa/blob/master/docs/src/getting_started/installation.md)
- The installation of Echidna, instructions can be found [here](https://github.com/crytic/echidna#installation)

## Running

To run the echidna equivalence test, use the following command
```
echidna . --contract Fuzz --config echidna-config.yaml
```

To run the medusa equivalence test, use the following command
```
medusa fuzz
```