class AddOrganisationToService < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :organisation, :text
  end
end
