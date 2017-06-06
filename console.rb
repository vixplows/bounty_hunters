require('pry-byebug')
require_relative('bounty')
Bounty.delete_all()

bounty_1 = Bounty.new ({
  "name" => "joshua",
  "species" => "reptile",
  "homeworld" => "mars",
  "bounty_value" => 100
  })

bounty_2 = Bounty.new({
  "name" => "olli",
  "species" => "slaveeen",
  "homeworld" => "galafry",
  "bounty_value" => 125
  })

bounty_1.save()
bounty_2.save()
  
binding.pry
nil