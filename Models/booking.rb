require_relative( '../db/sqlrunner' )

class Booking

  attr_reader( :member_id, :activity_id, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @activity_id = options['activity_id'].to_i
  end

  def save()
    sql = "INSERT INTO bookings
    (
      member_id,
      activity_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@member_id, @activity_id]
    result = SqlRunner.run(sql, values)
    @id = result.first()['id'].to_i
  end

  def update()
   sql = "UPDATE bookings SET (activity_id, member_id) = ($1, $2) WHERE id = $3"
   values = [@activity_id, @member_id, @id]
   SqlRunner.run(sql, values)
  end

  def activity()
    sql = "SELECT * FROM activities
    WHERE id = $1"
    values = [@activity_id]
    result = SqlRunner.run( sql, values )
    return Activity.new( result.first )
  end



  def member()
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [@member_id]
    result = SqlRunner.run( sql, values )
    return Member.new( result.first )
  end
#----------MISSING DELETE/------------------------------------------------
  def self.all()
   sql = "SELECT * FROM bookings"
   result = SqlRunner.run( sql )
   return result.map { |booking| Booking.new( booking ) }
  end

  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM bookings
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
