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

# /tables/foreclosure_2011/SELECT * WHERE something = 'something'

# q = params[:query]
# action, remainder = q.partition " " #=> ['SELECT *', '...']

# query = "#{action} FROM self.table_name #{remainder}"

# raise QueryTotallyWrongError if query.include? danger_zone_words

# danger_zone_words = %w( drop delete remove insert update)
