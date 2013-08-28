class AddDoNotIndexToAlchemyEssenceRichtexts < ActiveRecord::Migration
  def change
    add_column :alchemy_essence_richtexts, :do_not_index, :boolean, default: false
  end
end
