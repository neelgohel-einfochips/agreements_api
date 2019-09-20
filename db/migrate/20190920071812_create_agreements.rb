class CreateAgreements < ActiveRecord::Migration[6.0]
  def change
    create_table :agreements do |t|
      t.string :first_name
      t.string :last_name
      t.integer :status
      t.integer :days_out
      t.datetime :accepted_datetime
      t.datetime :expiration_datetime
      t.string :business_name
      t.string :email
      t.string :reference

      t.timestamps
    end
  end
end
