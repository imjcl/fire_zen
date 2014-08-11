class FirebaseServices
  def self.push_zen quote
    firebase = Firebase::Client.new(ENV['FIREBASE'])
    response = firebase.push("zen", { quote: quote })
  end
end