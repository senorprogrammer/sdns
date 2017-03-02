class Dir2
  def self.home(user = nil) : String
    ENV["HOME"]
  end
end
