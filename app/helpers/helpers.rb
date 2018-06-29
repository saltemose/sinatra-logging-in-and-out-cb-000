class Helpers

  def self.current_user(session_hash)
      current_user = User.find_by(session_hash)
      current_user
    end
  end

  def self.is_logged_in?(session_hash)
    if session_hash.any? do |user_id|
      user_id == 
  end 
end