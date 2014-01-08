class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :bonuse_code
      t.string :status
      t.belongs_to :product
      t.timestamps
    end

    add_index :codes, :bonuse_code

  end
end
