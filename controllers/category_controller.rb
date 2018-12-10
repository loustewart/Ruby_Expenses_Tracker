require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('../models/category.rb')
require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')


# INDEX
get '/categories' do
  @categories = Category.all()
  erb(:"categories/index")
end

# CREATE
get '/categories/add' do
  erb(:"categories/add")
end

# SHOW ONE BY ID
get '/categories/:id' do
  @category = Category.find(params[:id].to_i())
  erb(:"categories/show")
end


# EDIT
# get '/categories/:id/edit' do
#   @category = Category.find(params[:id])
#   @categories = Category.all()
#   @type = ("utilities", "rent", "travel", "admin", "events")
#   erb(:edit)
# end


# UPDATE
# post '/categories/:id' do
#   @category = Category.new(params)
#   @order.update()
#   redirect('/categories/index')
# end
#
# # DESTROY
# post 'categories/:id/delete' do
#   category = Category.find(params[:id])
#   category.delete()
#   redirect('/categories/index')
# end

post '/categories' do # create
  @category = Category.new( params )
  @category.save()
  redirect('/categories')
end
