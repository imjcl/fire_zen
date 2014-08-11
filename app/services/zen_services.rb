class ZenServices
  def self.get_zen
    base_uri = 'https://api.github.com/zen'
    
    FirebaseServices.push_zen RestClient.get base_uri if (ENV["CID"].nil? && ENV["CSECRET"].nil?)

    FirebaseServices.push_zen RestClient.get base_uri + "?client_id=#{ENV["CID"]}&client_secret=#{ENV["CSECRET"]}"
  end
end