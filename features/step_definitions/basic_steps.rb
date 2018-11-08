Given("I click on {string}") do |button_or_link|
    click_on button_or_link
end

Given("I am on the Sign up page") do
    visit new_user_registration_path
end

Given("I fill in {string} with {string}") do |field, text|
    fill_in(field, with: text)
end

Given("I fill in {string} with Jan, 2018") do |field|
    element = page.find_by_id(field)
    element.send_keys :up
    element.send_keys :tab
    element.send_keys :up
end

Then("stop") do
    binding.pry
end

Given("I visit the landing page") do
    visit root_path
end

Then("I end up on the landing page") do
    expect(current_path).to eq root_path    
end

Given("the following user is registered") do |table|
    table.hashes.each do |user|
      create(:user, user)
    end
end

Given("the following schedules are in the database") do |table|
    table.hashes.each do |schedule_hash|
        @user = User.find_by(email: schedule_hash[:user])
        schedule_hash.except!("user")
        create(:schedule, schedule_hash.merge(user: @user))
    end
end

Given("the following patterns are in the database") do |table|
    table.hashes.each do |pattern_hash|
        @schedule = Schedule.find_by(period: pattern_hash[:schedule])
        pattern_hash.except!("schedule")
        create(:pattern, pattern_hash.merge(schedule: @schedule))
    end   
end
  
Then("I am on the Log in page") do
    visit new_user_session_path
end

Given("I am logged in as {string}") do |email|
    user = User.find_by_email(email)
    login_as user, scope: :user
end

Given("I click {string}") do |link|
    click_on link
end

Given("I visit the latest planning period") do
    visit schedule_path(@user.id)
  end
  
Given("I click checkbox {string}") do |checkbox|
    check checkbox 
end
