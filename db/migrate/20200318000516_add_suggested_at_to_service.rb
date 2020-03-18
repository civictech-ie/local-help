class AddSuggestedAtToService < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :safety_doc_url, :text
    add_column :services, :suggested_at, :datetime, index: true
  end
end
