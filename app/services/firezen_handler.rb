class FirezenHandler
  def self.send_fire_zen
    quote = ZenServices.get_zen
    response = FirebaseServices.push_zen quote
    [[response.body["name"], {"quote" => quote, "likes" => 0, "dislikes" => 0}]]
  end

  def self.get_fire_zen
    firebase = Firebase::Client.new(ENV['FIREBASE'])
    get_unique_zens firebase.get("zen").body.sort_by { |z| z[1]["likes"]}.reverse
  end

  def self.get_unique_zens zens
    selects = zens.uniq { |z| z[1]["quote"] }
    raw = zens.flatten.select { |z| z.is_a? String }
    uniques = selects.flatten.select { |s| s.is_a? String }

    FirebaseServices::remove_zen_keys (raw - uniques)

    selects
  end  
end