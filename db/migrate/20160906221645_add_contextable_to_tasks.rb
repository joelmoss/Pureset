class AddContextableToTasks < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :contextable, polymorphic: true, index: true
  end
end
