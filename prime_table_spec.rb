require "./prime_table.rb"
require "minitest/autorun"

describe PrimeTable do
  def brute_multiply_primes(primes)
    primes.map do |prime|
      primes.collect{ |n| n * prime }
    end
  end

  describe :generate_primes do
    describe "when n equals 0" do
      it "should be an empty array" do
        primes = PrimeTable.new(0).send(:generate_primes)
        primes.must_equal []
      end
    end

    describe "when n equals 2" do
      it "should have the correct primes" do
        expected_primes = [2, 3]

        primes = PrimeTable.new(2).send(:generate_primes)
        primes.must_equal expected_primes
      end
    end

    describe "when n equals 10" do
      it "should have the correct primes" do
        expected_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

        primes = PrimeTable.new(10).send(:generate_primes)
        primes.must_equal expected_primes
      end
    end

    describe "when n equals 12" do
      it "should have the correct primes" do
        expected_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37]

        primes = PrimeTable.new(12).send(:generate_primes)
        primes.must_equal expected_primes
      end
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
      it "should have the correct primes multiplication table" do
        expected_primes = [2, 3]
        expected_array = brute_multiply_primes(expected_primes)

        table = PrimeTable.new(2)
        times_table = table.to_multiplication_table
        times_table.must_equal expected_array
      end
    end

    describe "when n equals 10" do
      it "should have the correct primes multiplication table" do
        expected_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
        expected_array = brute_multiply_primes(expected_primes)

        table = PrimeTable.new(10)
        times_table = table.to_multiplication_table
        times_table.must_equal expected_array
      end
    end

    describe "when n equals 12" do
      it "should have the correct primes multiplication table" do
        expected_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37]
        expected_array = brute_multiply_primes(expected_primes)

        table = PrimeTable.new(12)
        times_table = table.to_multiplication_table
        times_table.must_equal expected_array
      end
    end
  end
end