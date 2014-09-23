require 'prime'
require './string'

class PrimeTable
  attr_accessor :n, :times_table, :primes, :spacing

  def initialize(n = nil, spacing = 10)
    if n.nil?
      print("Enter N (must be a positive integer): ")
      n = gets.chomp.to_i
      while n < 1
        print("That's not a positive integer... Please try again: ")
        n = gets.chomp.to_i
      end
      print("\n")
    end
    @n = n
    @spacing = spacing
  end

  def to_multiplication_table
    generate_primes if primes.nil? 

    times_table = Array.new(n){ Array.new(n) }

    primes.each do |p1|
      p1_index = primes.index(p1)
      
      primes.each do |p2|
        p2_index = primes.index(p2)

        mult_value = p1 * p2
        times_table[p1_index][p2_index] = mult_value
        times_table[p2_index][p1_index] = mult_value if p1_index != p2_index
      end
    end

    @times_table = times_table
  end

  alias_method :create_multiplication_table, :to_multiplication_table

  def pretty_print
    create_multiplication_table if times_table.nil?

    # Print first row w/bar on top
    print_bar
    print_row("x", primes, :red, :green)

    times_table.each_with_index do |row, i|
      print_row(primes[i], row, :cyan, :gray)
    end
  end

  private

  def generate_primes
    primes = []
    current_int = 2

    while primes.length < n
      is_prime = true
      2.upto(Math.sqrt(current_int).to_i) do |x|
        is_prime = false if current_int%x == 0
      end
      primes << current_int if is_prime
      current_int += 1
    end

    @primes = primes
  end
    
  def print_bar
    print("_" * (spacing * ( n + 1 ) + 1) + "\n")
  end

  def print_empty_columns
    printf("%-#{spacing}s" * (n + 1), *Array.new(n+2) { "|" })
    print("|\n")
  end

  def print_bars_and_columns
    print("|" + ("_" * (spacing - 1) + "|") * (n + 1) + "\n")
  end

  def print_in_color(string, color)
    string = string.to_s
    spaces = spacing - 2 - string.length
    print("\s" + string.send(color) + "\s" * (spaces) + "|")
  end

  def print_row(first_col, row, color1, color2)
    print_empty_columns
    print("|")
    print_in_color(first_col, color1)
    row.each {|prime| print_in_color(prime, color2) }
    print("\n")
    print_bars_and_columns
  end
end
