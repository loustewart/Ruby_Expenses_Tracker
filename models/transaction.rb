require_relative('../db/sql_runner.rb')
require_relative('./merchant.rb')
require_relative('./category.rb')


class Transaction
attr_reader :id, :merchant_id, :category_id
attr_accessor :value

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id'].to_i()
    @category_id = options['category_id'].to_i()
    @value = options['value'].to_f()
  end

  def save()
    sql = "INSERT INTO transactions
    (
      merchant_id,
      category_id,
      value
    )
    VALUES($1, $2, $3)
    RETURNING id"
    values = [@merchant_id, @category_id, @value]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def delete_one()
    sql = "DELETE FROM transactions WHERE id = $1"
    values = ['id']
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE transactions SET (merchant_id, category_id, value) = ($1, $2, $3) WHERE id = $4"
    values = [@merchant_id, @category_id, @value]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    values = []
    transactions = SqlRunner.run(sql, values)
    result = transactions.map { |transaction| Transaction.new(transaction) }
    return result
  end

  def find_by_id()
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = ['id']
    result = SqlRunner.run(sql, values)
    transaction_hash = results.first
    transaction = SqlRunner.run(transaction_hash)
    return transaction
  end

  def merchant() 
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [@merchant_id]
    results = SqlRunner.run(sql, values)
    merchant_hash = results[0]
    merchant = Merchant.new(merchant_hash)
    return merchant
  end

  def category()
    sql = "SELECT * FROM categories WHERE id = $1"
    values = [@category_id]
    results = SqlRunner.run(sql, values)
    category_hash = results[0]
    category = Category.new(category_hash)
    return category

  end

end
