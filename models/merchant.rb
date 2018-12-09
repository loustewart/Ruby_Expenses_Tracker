require_relative('../db/sql_runner.rb')

class Merchant

attr_reader :id
attr_accessor :name, :phone, :email

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @phone = options['phone']
    @email = options['email']
  end

  def save()
    sql = "INSERT INTO merchants
    (
      name,
      phone,
      email
    )
    VALUES($1, $2, $3)
    RETURNING id"
    values = [@name, @phone, @email]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def delete_one()
    sql = "DELETE FORM merchants WHERE id = $1"
    values = ['id']
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE merchants SET (name, phone, email) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @phone, @email]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    values = []
    merchants = SqlRunner.run(sql, values)
    result = transactions.map { |merchant| Merchant.new(merchant) }
    return result
  end

  def find_by_id()
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = ['id']
    merchants_hash = results.first()
    merchant = SqlRunner.run(merchants_hash)
    return merchant
  end

end
