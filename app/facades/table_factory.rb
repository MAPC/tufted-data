class TableFactory < Table
  def self.set_table(table_name)
    if ActiveRecord::Base.connection.table_exists? table_name
      Table.table_name = table_name
      Table
    end
  end
end