require('pg')

class Bounty
  attr_accessor :name, :species, :homeworld, :bounty_value
  attr_reader :id

  def initialize(options)
    @name = options["name"]
    @species = options["species"]
    @homeworld = options["homeworld"]
    @bounty_value = options["bounty_value"].to_i
    @id = options["id"].to_i() if options["id"]
  end


  def save()
    db = PG.connect({dbname: "bounty_hunters", host: "localhost"})
    sql = "INSERT INTO bounties
      (
        name,
        species,
        homeworld,
        bounty_value
      ) 
      VALUES
      (
        '#{@name}',
        '#{@species}',
        '#{@homeworld}',
        #{@bounty_value}
      ) RETURNING id "
      @id = db.exec(sql)[0]["id"].to_i
      db.close()
  end

  def delete()
    db = PG.connect({dbname: "bounty_hunters", host: "localhost"})
    sql = "DELETE FROM bounties WHERE id = #{@id}"
    db.exec(sql)
    db.close
  end

  def update()
    db = PG.connect({dbname: "bounty_hunters", host: "localhost"})
    sql = "UPDATE bounties
      SET 
      (
        name,
        species,
        homeworld,
        bounty_value
      ) =
      (
        '#{@name}',
        '#{@species}',
        '#{@homeworld}',
        #{@bounty_value}
      ) WHERE id = #{@id}"
    db.exec(sql)
    db.close
  end

  def Bounty.delete_all()
    db = PG.connect({dbname: "bounty_hunters", host: "localhost"})
    sql = "DELETE FROM bounties"
    db.exec(sql)
    db.close
  end

  def Bounty.all()
    db = PG.connect({dbname: "bounty_hunters", host: "localhost"})
    sql = "SELECT * FROM bounties"
    bounties = db.exec(sql)
    db.close()
    return bounties.map {|bounty| Bounty.new(bounty)}
  end

  def Bounty.find(id)
    db = PG.connect({dbname: "bounty_hunters", host: "localhost"})
    sql = "SELECT * FROM bounties WHERE id = #{id}"
    bounty_hash = db.exec(sql)[0]
    db.close()
    return Bounty.new(bounty_hash)
  end
end


