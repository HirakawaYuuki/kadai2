class AddBodyToImpressions < ActiveRecord::Migration[5.2]
  def change
    add_column :impressions, :body, :string
  end
end
