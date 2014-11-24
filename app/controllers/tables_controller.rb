class TablesController < ApplicationController

  def index
    render json: ActiveRecord::Base.connection.tables
  end

  def query
    @query = params[:q]
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