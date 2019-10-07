require_relative( '../db/sqlrunner' )

class Member

  attr_reader( :first_name, :last_time, :id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

#----------instance methods------------------------------------------------


  def save()
    sql = "INSERT INTO members
    (
      first_name,
      last_name
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@first_name, @last_name]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  # def activities
  #   sql = "SELECT v.* FROM activities v INNER JOIN bookings b ON b.activity_id = v.id WHERE b.member_id = $1;"
  #   values = [@id]
  #   result = SqlRunner.run(sql, values)
  #   return result.map { |activity| Activity.new(activity) }
  # end

  def update()
   sql = "UPDATE members SET (first_name, last_name) = ($1, $2) WHERE id = $3"
   values = [@first_name, @last_name, @id]
   SqlRunner.run(sql, values)
  end

  def delete()
   sql = "DELETE FROM members where id = $1"
   values = [@id]
   SqlRunner.run(sql, values)
  end
#----------class methods------------------------------------------------
  def self.all()
    sql = "SELECT * FROM members"
    result = SqlRunner.run( sql )
    return result.map { |hash| Member.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run( sql, values )
    return Member.new( result.first )
  end

  def self.delete_all
    sql = "DELETE FROM members"
    SqlRunner.run( sql )
  end

end
