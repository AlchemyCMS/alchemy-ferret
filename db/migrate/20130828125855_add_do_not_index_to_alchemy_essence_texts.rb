class AddDoNotIndexToAlchemyEssenceTexts < ActiveRecord::Migration
  def change
    add_column :alchemy_essence_texts, :do_not_index, :boolean, default: false
  end
end
