require_relative('../models/category.rb')
require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')

require('pry')

Transaction.delete_all()
Category.delete_all()
Merchant.delete_all()



utilities = Category.new({
  'type' => 'utilities'
  })
utilities.save()

rent = Category.new({
  'type' => 'rent'
  })
rent.save()

travel = Category.new({
  'type' => 'travel'
  })
travel.save()

admin = Category.new({
  'type' => 'admin'
  })
admin.save()

events = Category.new({
  'type' => 'events'
  })
events.save()



water = Merchant.new({
  'name' => "Scottish Water",
  'phone' => "0800 077 8778",
  'email' => "help@scottishwater.co.uk",
  })
water.save()

hampden = Merchant.new({
  'name' => "Hampden",
  'phone' => "0141 429 1122",
  'email' => "accounts@hampdencabs.com"
  })
hampden.save()

briggait = Merchant.new({
  'name' => "Briggait",
  'phone' => "0141 553 5890",
  'email' => "finance@waspsstudios.org.uk"
  })
briggait.save()

staples = Merchant.new({
  'name' => "staples",
  'phone' => "0333 300 1334",
  'email' => "accounts@staples.co.uk"
  })
staples.save()

drygate = Merchant.new({
  'name' => "drygate",
  'phone' => "0141 212 8815",
  'email' => "accounts@drygate.com"
  })
drygate.save()


expense1 = Transaction.new({
  'merchant_id' => "#{water.id}",
  'category_id' => "#{utilities.id}",
  'value' => 350.72,
  })
expense1.save()

expense2 = Transaction.new({
  'merchant_id' => "#{hampden.id}",
  'category_id' => "#{travel.id}",
  'value' => 12.50,
  })
expense2.save()

expense3 = Transaction.new({
  'merchant_id' => "#{briggait.id}",
  'category_id' => "#{rent.id}",
  'value' => 283.00,
  })
expense3.save()

expense4 = Transaction.new({
  'merchant_id' => "#{staples.id}",
  'category_id' => "#{admin.id}",
  'value' => 12.50,
  })
expense4.save()

expense5 = Transaction.new({
  'merchant_id' => "#{drygate.id}",
  'category_id' => "#{events.id}",
  'value' => 12.50,
  })
expense5.save()


binding.pry

nil
