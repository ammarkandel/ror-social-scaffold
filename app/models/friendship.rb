class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def confirm_friend
    update_all(confirmed: true)
    Friendship.create! do |f|
      f.friend_id = user_id,
      f.user_id = friend_id,
      f.confirmed = true
    end
  end
end
