# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Item.delete_all

Item.new(title: 'Kindle DX',
         description: 'super ultra cool awesome ebook reader with brutally broken display',
         start_price: 100.01,
         end_date: Time.now + 1.month,
         status: 'SELLING').save(validate: false)
         
Item.new(title: 'Gold Chain',
         description: 'Dirt Nasty`s gold chain from 1980',
         start_price: 590.01,
         end_date: Time.now - 1.month,
         status: 'SOLD').save(validate: false)

Item.new(title: 'Painting',
         description: 'beautiful painting by liybo chuka',
         start_price: 590.01,
         end_date: Time.now - 1.month,
         status: 'NOTSOLD').save(validate: false)


