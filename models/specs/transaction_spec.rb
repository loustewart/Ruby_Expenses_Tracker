require('minitest/autorun')
require('minitest/rg')
require_relative('../transaction.rb')

class TransactionTest < MiniTest::Test

  def setup()
    options = {"id" => 1, "merchant_id" => 100, "category_id" => 10, "value" => 300}

    @transaction = Transaction.new(options)
  end

  def test_transaction_has_id()
    result = @transaction.id()
    assert_equal(1, result)
  end

  def test_transaction_has_merchant_id()
    result = @transaction.merchant_id()
    assert_equal(100, result)
  end

  def test_transaction_has_category_id()
    result = @transaction.category_id()
    assert_equal(10, result)
  end

  def test_transaction_has_value()
    result = @transaction.value()
    assert_equal(300, result)
  end

end
