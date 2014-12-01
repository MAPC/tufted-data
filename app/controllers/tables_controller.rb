class TablesController < ApplicationController
  respond_to :json
  def index
    render json: ActiveRecord::Base.connection.tables
  end

  def query
    @query = params[:q]
    conn = PGconn.open(:dbname=> 'housing_data')
    res = conn.exec(@query)

    # @test = @new.select("max(municipal) AS series, json_agg(row_to_json((SELECT r FROM (SELECT sch_yr,grade_1 AS value ) r WHERE grade_1 IS NOT NULL))ORDER BY sch_yr ASC) AS values")
    # @json = ActiveModel::Serializer.build_json(self, @test, {})
    # puts @test
    render json: res
  end
end

# /tables/foreclosure_2011/SELECT * WHERE something = 'something'

# q = params[:query]
# action, remainder = q.partition " " #=> ['SELECT *', '...']

# query = "#{action} FROM self.table_name #{remainder}"

# raise QueryTotallyWrongError if query.include? danger_zone_words

# # danger_zone_words = %w( drop delete remove insert update)
# select json_agg(c.municipal,
#  (select * from (select c.grade_k,
#  c.grade_1)) as values from ed_enroll as c  LIMIT 5)

# SELECT max(municipal) AS series, json_agg(row_to_json((SELECT r FROM (SELECT sch_yr,grade_1 AS value ) r WHERE grade_1 IS NOT NULL))ORDER BY sch_yr ASC) AS values FROM ed_enroll WHERE grade_1 IS NOT NULL GROUP BY municipal