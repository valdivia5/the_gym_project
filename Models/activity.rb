require_relative( '../db/sqlrunner' )

class Activity

  attr_reader( :name, :date_and_time, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @date_and_time = options['date_and_time'].to_i
  end



  def save()
    sql = "INSERT INTO activities
    (
      name,
      date_and_time
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @date_and_time]
    result = SqlRunner.run(sql, values)
    @id = result.first()['id'].to_i
  end

  def members()
    sql = "SELECT m.* FROM members AS m
    JOIN bookings AS b ON b.member_id = m.id
    JOIN activities AS a ON a.id = b.activity_id
    WHERE b.activity_id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |member| Member.new(member) }
  end

  def update()
   sql = "UPDATE activities SET (name, date_and_time) = ($1, $2) WHERE id = $3"
   values = [@name, @date_and_time, @id]
   SqlRunner.run(sql, values)
  end

  def delete()
   sql = "DELETE FROM activities where id = $1"
   values = [@id]
   SqlRunner.run(sql, values)
  end




  def self.all()
    sql = "SELECT * FROM activities"
    result = SqlRunner.run( sql )
    return result.map { |activity| Activity.new( activity ) }
  end

  def self.find( id )
    sql = "SELECT * FROM activities
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run( sql, values )
    return Activity.new( result.first )
  end

  def self.delete_all
    sql = "DELETE FROM activities"
    SqlRunner.run( sql )
  end

end
