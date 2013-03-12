Given /^I login as administrator$/ do
  @admin_user = AdminUser.create! email: 'admin@example.com', 
    password: 'longpassword', 
    password_confirmation: 'longpassword'
  
  visit admin_root_path

  fill_in 'Email', with: 'admin@example.com'
  fill_in 'Password', with: 'longpassword'
  click_on 'Login'
  page.should have_content 'Signed in successfully'
end
