class FirebaseServices
  def self.push_zen quote
    firebase = Firebase::Client.new(ENV['FIREBASE'])
    response = firebase.push("zen", { quote: quote, likes: 0, dislikes: 0 })
  end

  def self.remove_zen_keys keys
    firebase = Firebase::Client.new(ENV['FIREBASE'])
    keys.each do |key|
      firebase.delete("zen/#{key}")
    end
  end
end