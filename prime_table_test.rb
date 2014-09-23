require "./prime_table.rb"
require "minitest/autorun"

describe PrimeTable do
  def brute_multiply_primes(primes)
    primes.map do |prime|
      primes.collect{ |n| n * prime }
    end
  end

  describe :to_multiplication_table do
    describe "when n equals 0" do
      it "should be an empty array" do
        table = PrimeTable.new(0)
        times_table = table.to_multiplication_table
        times_table.must_equal []
      end
    end

    describe "when n equals 2" do
      it "should be an empty array" do
        expected_primes = [2, 3]
        expected_array = brute_multiply_primes(expected_primes)

        table = PrimeTable.new(2)
        times_table = table.to_multiplication_table
        times_table.must_equal expected_array
      end
    end

    describe "when n equals 10" do
      it "should be an empty array" do
        expected_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
        expected_array = brute_multiply_primes(expected_primes)

        table = PrimeTable.new(10)
        times_table = table.to_multiplication_table
        times_table.must_equal expected_array
      end
    end
  end
end