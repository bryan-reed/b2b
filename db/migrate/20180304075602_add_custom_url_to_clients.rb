class AddCustomUrlToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :custom_url, :string
  end
end
