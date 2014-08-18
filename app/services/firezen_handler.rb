class FirezenHandler
  def self.send_fire_zen
    quote = ZenServices.get_zen
    existing_quotes = get_just_quotes.map { |zen| zen.lower }
    if existing_quotes.include? quote.lower
      true
    else
      response = FirebaseServices.push_zen quote
      false
    end
  end

  def self.get_fire_zen
    firebase = Firebase::Client.new(ENV['FIREBASE'])
    get_unique_zens firebase.get("zen").body.sort_by { |z| z[1]["likes"]}.reverse
  end

  def self.get_just_quotes
    firebase = Firebase::Client.new(ENV['FIREBASE'])
    my_zens = []
    firebase.get("zen").body.each do |zen|
      my_zens << zen[1]["quote"]
    end
    my_zens
  end

  def self.get_unique_zens zens
    selects = zens.uniq { |z| z[1]["quote"] }
    raw = zens.flatten.select { |z| z.is_a? String }
    uniques = selects.flatten.select { |s| s.is_a? String }

    FirebaseServices::remove_zen_keys (raw - uniques)

    selects
  end  
end