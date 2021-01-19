class CreateAddColumnTakephotoToTopics < ActiveRecord::Migration[5.2]
  def change
      add_column :topics, :takephoto, :datetime

  end
end
