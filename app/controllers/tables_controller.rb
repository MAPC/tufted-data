class TablesController < ApplicationController
  def show
    @table = TableFactory.set_table(params[:table_name]).all
  end

  def query
    @table = TableFactory.set_table(params[:table_name]).all
    ActiveRecord::Base.connection.execute(:query)
  end
end
