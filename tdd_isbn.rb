require "minitest/autorun"
require_relative "isbn.rb"

class TestYourFunctions < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_if_isbn_10_is_a_string
        assert_equal("", isbn_10())
    end
end