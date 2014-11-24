class TablesController < ApplicationController
  def show
    @table = TableFactory.set_table(params[:table_name]).all
  end

  def query
    # @table = TableFactory.set_table(params[:table_name]).all
    @query = params[:query]
    @table = ActiveRecord::Base.connection.execute(@query)
    render json: @table.as_json
  end
end
