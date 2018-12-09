require('minitest/autorun')
require('minitest/rg')
require_relative('../merchant.rb')

class MerchantTest < MiniTest::Test

  def setup()
    options = {"id" => 100, "name" => "Scottish Water", "phone" => "0800 077 8778", "email" => "help@scottishwater.co.uk"}

    @merchant = Merchant.new(options)
  end

  def test_merchant_has_id
    result = @merchant.id()
    assert_equal(100, result)
  end

  def test_merchant_has_name
    result = @merchant.name()
    assert_equal("Scottish Water", result)
  end

  def test_merchant_has_phone
    result = @merchant.phone()
    assert_equal("0800 077 8778", result)
  end

  def test_merchant_has_email
    result = @merchant.email()
    assert_equal("help@scottishwater.co.uk", result)
  end

end
