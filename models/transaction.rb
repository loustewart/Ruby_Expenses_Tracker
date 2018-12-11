require_relative('../db/sql_runner.rb')
require_relative('./merchant.rb')
require_relative('./category.rb')



class Transaction
attr_reader :id
attr_accessor :merchant_id, :category_id, :value, :day, :month, :year

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id'].to_i()
    @category_id = options['category_id'].to_i()
    @value = options['value'].to_f()
    @day = options['day'].to_i()
    @month = options['month'].to_i()
    @year = options['year'].to_i()
  end

  def save()
    sql = "INSERT INTO transactions
    (
      merchant_id,
      category_id,
      value,
      day,
      month,
      year
    )
    VALUES($1, $2, $3, $4, $5, $6)
    RETURNING id"
    values = [@merchant_id, @category_id, @value, @day, @month, @year]
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

  def delete()
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  #
  # def month()
  #   sql = "SELECT * FROM transactions WHERE month = $1"
  #   values = [month]
  #   SqlRunner.run(sql, values)
  # end



  def update()
    sql = "UPDATE transactions SET (merchant_id, category_id, value, day, month, year) = ($1, $2, $3, $4, $5, $6) WHERE id = $7"
    values = [@merchant_id, @category_id, @value, @day, @month, @year, @id]
    SqlRunner.run(sql, values)
  end


  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    transaction_hash = result.first()
    return Transaction.new(transaction_hash)
  end


# define a method to set a budget and return if the total value of the expenses transactions (sum) as greater than or less than the budget (boolean)

# define a method to return only expenses submitted within a specific month (using the integer of the month to return the data)

# define a function to return the expenses for specific catagories and/or merchants using a drop down menu of the category/merchant

end
