And (/^Someone asked permission to enter the page$/) do
    c = College.find_by(initials: "UT001")
    u = User.find_by(nickname: "teste001.user")
    cw = CollegeWhitelist.new(college: c, user: u, status: "pending")
    cw.save

    cw = CollegeWhitelist.find_by(college_id: c.id, user_id: u.id)
end