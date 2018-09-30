class AddCommentIdToCommentUpdates < ActiveRecord::Migration[5.2]
  def change
    add_column :comment_updates, :comment_id, :integer
    add_column :comment_updates, :update_date, :datetime
    add_column :comment_updates, :update_time, :time
    add_column :comment_updates, :update_type, :string
    add_column :comment_updates, :current_update, :string
    add_column :comment_updates, :employee_name, :string
  end
end
