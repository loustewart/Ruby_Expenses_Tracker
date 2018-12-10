require_relative('../db/sql_runner.rb')
require_relative('./merchant.rb')
require_relative('./category.rb')


class Transaction
attr_reader :id
attr_accessor :merchant_id, :category_id, :value

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

  def self.all()
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run(sql)
    return results.map { |transaction| Transaction.new(transaction) }
  end

  def merchant()
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [@merchant_id]
    results = SqlRunner.run(sql, values)
    return Merchant.new(results.first)
  end

  def category()
    sql = "SELECT * FROM categories WHERE id = $1"
    values = [@category_id]
    results = SqlRunner.run(sql, values)
    return Category.new(results.first)
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end





  # def update()
  #   sql = "UPDATE transactions SET (merchant_id, category_id, value) = ($1, $2, $3) WHERE id = $4"
  #   values = [@merchant_id, @category_id, @value, @id]
  #   SqlRunner.run(sql, values)
  # end
  #
  #
  # def self.find(id)
  #   sql = "SELECT * FROM transactions WHERE id = $1"
  #   values = [id]
  #   result = SqlRunner.run(sql, values)
  #   transaction_hash = result.first()
  #   return Transaction.new(transaction_hash)
  # end

end
