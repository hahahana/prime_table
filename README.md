To run the program, just clone the code and run ```ruby main.rb``` from the directory.

The program also contains a test that can be run using ```ruby prime_table_spec.rb```.

**Notes:**
- The program takes the value of n from the user input in the terminal, unless specified explicitly upon instantiation.
- The program is split up into a few different concerns, getting N from the user, generating the primes, and generating the times table (which is available as a raw multidimensional array), and printing to the terminal. The last two are the public concerns of the program.
- You can change the spacing interactively, i.e. you can go to main.rb and change the instantiation of table to PrimeTable.new(nil, 12) and the cells will appear larger upon printing.

**Time complexity:**

```generate_primes``` does not scale well for large N and has a time complexity of O(n * sqrt(n)).

```to_multiplication_table```, or rather, the process to create the multiplication table is O(n^2).

```pretty_print``` is O(n) since you print a row for each prime up to n.

The output should look like this:

![timestable](https://raw.github.com/hahahana/prime_table/master/screenshot.png)

----

### Objective

Write a program that prints out a multiplication table of the first 10 prime numbers.

The program must run from the command line and print one table to STDOUT.

The first row and column of the table should have the 10 primes, with each cell containing the product of the primes for the corresponding row and column.

#### Notes

- Consider complexity. How fast does your code run? How does it scale?

- Consider cases where we want N primes.

- Do not use the Prime class from stdlib (write your own code).

- Write tests. Try to demonstrate TDD/BDD.
