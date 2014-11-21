class TablesController < ApplicationController
  def show
    @table = TableFactory.set_table(params[:table_name]).all
  end
end
