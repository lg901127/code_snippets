class AddReferencesToSnippet < ActiveRecord::Migration
  def change
    add_reference :snippets, :user, index: true, foreign_key: true
    add_column :snippets, :private, :integer, default: 0
  end
end
