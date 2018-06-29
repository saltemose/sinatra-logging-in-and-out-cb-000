class Helpers

  def self.current_user(session_hash)
      @current_user = User.find_by_id(session_hash)
      @current_user
  end

  def self.is_logged_in?(session_hash)
    !! self.current_user
  end 
end