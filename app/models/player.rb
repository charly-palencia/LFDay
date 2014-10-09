class Player < ActiveRecord::Base
  def play(id_user)
    @id_user = id_user
    return who_did_you_played if played?
    return false if available_users.empty?
    id_user_2 = available_users
    id_user_2 = id_user_2[rand(id_user_2.length)]
    Player.create(user_id_1: @id_user, user_id_2: id_user_2)
    Player.create(user_id_1: id_user_2, user_id_2: @id_user)
    name_user(id_user_2)
  end
  def available_users
    result = []
    ar_users = []
    ar_players = []
    players = Player.select("user_id_1")
    users = User.find_other_player @id_user
    users.each{ |user| ar_users << user.id }
    players.each{ |player| ar_players << player.user_id_1 }
    result = ar_users - ar_players
  end
  def played?
    return true if find_user_by_id
    return false
  end
  def who_did_you_played
    name_user(find_user_by_id.user_id_2)
  end
  def name_user(id)
    User.find(id).name
  end
  def find_user_by_id
    Player.find_by(user_id_1: @id_user)
  end
end
