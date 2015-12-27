class AddZipcodeToNumbers < ActiveRecord::Migration
  def change
    add_reference :numbers, :zipcode, index: true, foreign_key: true
  end
end
