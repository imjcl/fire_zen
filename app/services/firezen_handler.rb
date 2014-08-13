class FirezenHandler
  def self.send_fire_zen
    quote = ZenServices.get_zen
    FirebaseServices.push_zen quote
  end

  def self.get_fire_zen
    firebase = Firebase::Client.new(ENV['FIREBASE'])
    firebase.get("zen").body.sort_by { |z| z[1]["likes"]}.reverse
  end
end