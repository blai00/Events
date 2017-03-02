module AttendsHelper
    def find_id (attends, user_id)
        attends.find {|attend| attend.user_id == user_id}.id
    end
end