require('minitest/autorun')
require('minitest/rg')
require_relative('../category.rb')

class CategoryTest < MiniTest::Test

  def setup()
    options = {"id" => 10, "type" => "utilities"}

    @category = Category.new(options)
  end

  def test_category_has_id()
    result = @category.id()
    assert_equal(10, result)
  end

  def test_category_has_type()
      result = @category.type()
      assert_equal("utilities", result)
  end

# start with hardcoded list (seeds) then refactor to a type array (admin function to add other categories)

end
