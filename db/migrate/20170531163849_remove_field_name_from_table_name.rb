class RemoveFieldNameFromTableName < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :user_idinteger, :string
  end
end
