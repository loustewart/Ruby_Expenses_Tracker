require_relative('../db/sql_runner.rb')

class Category

attr_reader :id
attr_accessor :type

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end


# need to create and array to keep all the types (save method)

  def save()
    sql = "INSERT INTO categories(type)
    VALUES($1)
    RETURNING id"
    values = [@type]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM categories"
    SqlRunner.run(sql)
  end

  def delete_one()
    sql = "DELETE FROM categories WHERE id = $1"
    values = ['id']
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE categories SET (type) = ($1) WHERE id = $2"
    values = [@type]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM categories"
    values = []
    categories = SqlRunner.run(sql, values)
    result = categories.map { |category| Category.new(category) }
    return result
  end

  def find_by_id()
    sql = "SELECT * FROM categories WHERE id = $1"
    values = ['id']
    result = SqlRunner.run(sql, values)
    category_hash = results.first
    category = SqlRunner.run(category_hash)
    return category
  end


  def find_by_type()
    sql = "SELECT * FROM categories WHERE type = $1"
    values = ['type']
    result = SqlRunner.run(sql, values)
    type_hash = results.first
    type = SqlRunner.run(type_hash)
    return category
  end

end
