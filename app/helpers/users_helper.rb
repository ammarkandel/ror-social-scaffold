module UsersHelper
  def unfriended_users(user)
    friend = current_user.friends.include?(user)
    accept = current_user.friend_requests.include?(user)
    pending = current_user.pending_requests.include?(user)
    if user != current_user
    if accept
      content_tag(:br) do
        content_tag(:div) do
          link_to 'Accept Request', friendship_path(id: user), method: :put, class: 'btn-request'
        end
      end +
        content_tag(:br) do
          content_tag(:div) do
            link_to 'Decline Request', friendship_path(id: user), method: :delete, class: 'btn-request'
          end
        end

    elsif pending
      link_to 'Pending Request', '', class: 'btn-request'
    elsif !friend
      link_to('Friend Request', friendships_path(friend_id: user), method: :post, class: 'btn-request')
    else
      link_to 'Unfriend', friendship_path(id: user), method: :delete, class: 'btn-request'
    end
  end
  end
end
