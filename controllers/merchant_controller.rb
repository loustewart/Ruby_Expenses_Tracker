require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('../models/category.rb')
require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')


# INDEX
get '/merchants' do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

# CREATE
get '/merchants/add' do
  erb(:"merchants/add")
end


# SHOW ONE BY ID
get '/merchants/:id' do
  @merchant = Merchant.find(params[:id].to_i())
  erb(:"merchants/show")
end

# EDIT
get '/merchants/:id/edit' do
  @merchant = Merchant.find(params[:id])
  erb(:"merchants/edit")
end

# UPDATE
post '/merchants/:id' do
  merchant = Merchant.new(params)
  merchant.update()
  redirect to '/merchants'
end


# DESTROY
post '/merchants/:id/delete' do
  merchant = Merchant.find(params[:id])
  merchant.delete()
  redirect('/merchants')
end

post '/merchants' do # create
  @merchant = Merchant.new( params )
  @merchant.save()
  redirect('/merchants')
end
