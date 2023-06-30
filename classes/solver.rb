require 'test/unit'

class SolverTest < Test::Unit::TestCase
  def setup
    @solver = Solver.new
  end

  def test_factorial_with_zero
    assert_equal(1, @solver.factorial(0))
  end

  def test_factorial_with_positive_integer
    assert_equal(120, @solver.factorial(5))
  end

  def test_factorial_with_negative_integer
    assert_raises(ArgumentError) { @solver.factorial(-5) }
  end

  def test_reverse_word
    assert_equal('olleh', @solver.reverse('hello'))
  end

  def test_fizzbuzz_divisible_by_3
    assert_equal('fizz', @solver.fizzbuzz(9))
  end

  def test_fizzbuzz_divisible_by_5
    assert_equal('buzz', @solver.fizzbuzz(10))
  end

  def test_fizzbuzz_divisible_by_3_and_5
    assert_equal('fizzbuzz', @solver.fizzbuzz(15))
  end

  def test_fizzbuzz_not_divisible_by_3_or_5
    assert_equal('7', @solver.fizzbuzz(7))
  end
end

class Solver
  def factorial(num)
    raise ArgumentError, 'Input must be a non-negative integer' if num.negative?

    return 1 if num.zero?

    result = 1
    (1..n).each do |i|
      result *= i
    end
    result
  end

  def reverse(word)
    word.reverse
  end

  def fizzbuzz(num)
    if (num % 3).zero? && (num % 5).zero?
      'fizzbuzz'
    elsif (num % 3).zero?
      'fizz'
    elsif (num % 5).zero?
      'buzz'
    else
      num.to_s
    end
  end
end

algo = Solver.new
puts algo.factorial(6)
puts algo.fizzbuzz(6)
puts algo.reverse('Hello')
