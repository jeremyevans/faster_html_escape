#!/bin/sh
for CHAR in \< \> \" \&; do
    for NUM in 1 2 3 4 5 6 7; do 
        echo -n "Checking '${CHAR}'*$NUM: "
        echo -n "$CHAR" | ./test_faster_html_escape.rb check 1 $NUM
    done
    echo -n "Checking 'X${CHAR}': "
    echo -n "X$CHAR" | ./test_faster_html_escape.rb check
    echo -n "Checking '${CHAR}X': "
    echo -n "${CHAR}X" | ./test_faster_html_escape.rb check
    echo -n "Checking 'X${CHAR}X': "
    echo -n "X${CHAR}X" | ./test_faster_html_escape.rb check
    echo -n "Checking '${CHAR}X${CHAR}': "
    echo -n "${CHAR}X${CHAR}" | ./test_faster_html_escape.rb check
done
for INPUT in '<blah>' '<>&"' blah X ''; do 
  echo -n "Checking '$INPUT'*1000000: "
  echo -n "$INPUT" | ./test_faster_html_escape.rb check 1 1000000
  echo "Benchmarking '$INPUT'*1000000"
  for METHOD in fhe erb; do
    echo -n "$INPUT" | ./test_faster_html_escape.rb $METHOD 1 1000000
  done
  echo "Benchmarking '$INPUT' multiple times"
  for METHOD in fhe erb; do
    echo -n "$INPUT" | ./test_faster_html_escape.rb $METHOD 1
    echo -n "$INPUT" | ./test_faster_html_escape.rb $METHOD 2
    echo -n "$INPUT" | ./test_faster_html_escape.rb $METHOD 3
    echo -n "$INPUT" | ./test_faster_html_escape.rb $METHOD 1000
    echo -n "$INPUT" | ./test_faster_html_escape.rb $METHOD 100000
  done
done
