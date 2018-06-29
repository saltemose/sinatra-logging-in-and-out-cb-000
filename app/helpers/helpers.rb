class Helpers

  def self.current_user(session_hash)
    session_hash.each do |user_id|
      @current_user = User.find_by(user_id)
      @current_user
    end
  end

  def self.is_logged_in?
  end 
end