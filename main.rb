require 'prime'

print "Enter N (must be an integer): "
n = gets.chomp.to_i
print("\n")

primes = Prime.first(n)
prime_string = ["\033[31mx\s\s\s\s\033[0m"] + primes

times_table = Array.new(n){ Array.new(n + 1) }

(0..(n - 1)).each do |i|
  times_table[i][0] = primes[i]
end

primes.each do |p1|
  p1_index = primes.index(p1)
  
  primes.each do |p2|
    p2_index = primes.index(p2)

    mult_value = p1 * p2
    times_table[p1_index][p2_index + 1] = mult_value
    times_table[p2_index][p1_index + 1] = mult_value if p1_index != p2_index
  end
end

printf("%-5s" + "| %-8i" * n, *prime_string)
print("\n" + "_" * (5 + 10 * n) + "\n\n")
times_table.each do |row|
  printf("%-5i" + "| %-8i" * n, *row)
  print("\n" + "_" * (5 + 10 * n) + "\n\n")
end