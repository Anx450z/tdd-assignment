# TDD Assignment for Incubyte

## **Problem Statement**

String Calculator TDD Kata

## Requirements

- Create a simple String calculator with a method 
- Allow the add method to handle any amount of numbers.
- Allow the add method to handle new lines between numbers (instead of commas). ("1\n2,3" should return 6)
- Support different delimiters:
- Calling add with a negative number will throw an exception: "negative numbers not allowed <negative_number>".
- If there are multiple negative numbers, show all of them in the exception message, separated by commas.

## Approach

I am going to follow the TDD approach for this kata. I will write the tests first and then write the code to make the tests pass which is a typical red green cycle.

- I will use ruby to write the code.
- Test framework will be rspec.
