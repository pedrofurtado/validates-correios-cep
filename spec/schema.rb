ActiveRecord::Schema.define do
  self.verbose = false

  create_table :my_address, force: true do |t|
    t.string :street
    t.string :zipcode
    t.timestamps
  end
end
