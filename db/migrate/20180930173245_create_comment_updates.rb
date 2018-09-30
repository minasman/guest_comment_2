class CreateCommentUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_updates do |t|

      t.timestamps
    end
  end
end
