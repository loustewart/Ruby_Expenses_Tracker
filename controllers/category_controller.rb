require_relative('../models/merchant')
require_relative('../models/transaction')


# INDEX
get '/categories' do
  @categories = Category.all()
  erb(:"categories/index")
end

# SHOW
get '/categories/new' do
  @categories = Category.all()
end
