class ChangeColumnNameForMoviesTable < ActiveRecord::Migration[7.1]
  def change
    rename_column :movies, :postel_url, :poster_url
  end
end
