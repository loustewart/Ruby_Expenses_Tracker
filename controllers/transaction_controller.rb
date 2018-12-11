require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('../models/category.rb')
require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')

# INDEX
get '/transactions' do
  @transactions = Transaction.all()
  erb(:"transactions/index")
end

# CREATE
get '/transactions/new' do
  @merchants = Merchant.all
  @categories = Category.all
  erb(:"transactions/new")
end

# SHOW ONE BY ID
get '/transactions/:id' do
  @transaction = Transaction.find(params[:id].to_i())
  erb(:"transactions/show")
end

# EDIT
get '/transactions/:id/edit' do
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/edit")
end

# UPDATE
post '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update()
  redirect to '/transactions'
end

# DESTROY
post '/transactions/:id/delete' do
 transaction = Transaction.find(params[:id])
 transaction.delete()
 redirect('/transactions')
end


post '/transactions' do # create
  transaction = Transaction.new(params)
  transaction.save()
  redirect to("/transactions")
end

# post '/transactions/:id/delete' do
#   Transaction.destroy(params[:id])
#   redirect to("/transactions")
# end
