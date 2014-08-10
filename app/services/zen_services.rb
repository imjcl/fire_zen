class ZenServices
  def self.get_zen
    RestClient.get 'https://api.github.com/zen'
  end
end