class Player < ActiveRecord::Base
  def play(id_user)
    @id_user = id_user
    return who_did_you_played if played?
    self.user_id_1 = id_user
    self.user_id_2 = 10
    save
  end
  def available_users
    
  end
  def played?
    return true if find_user
    return false
  end
  def who_did_you_played
    find_user
  end
  private
    def find_user
      Player.find_by(user_id_1: @id_user) || Player.find_by(user_id_2: @id_user)
    end
end
