Given(/^that I navigate to the Contact Page URL$/) do
    PageController.contact_page.go_here
end

Then(/^I have successfully navigated to the Contact Page$/) do
    sleep 2
    #Verify that the contact header was present as a part of the verification step
    unless PageController.contact_page.verify_contact_header
        fail("Did not successfully navigate to the Contact Page")
    end
end

And(/^I enter details on the contact page$/) do
    #This is a step for normal creation with entering all the fields
    PageController.contact_page.enter_details(required)
end

And(/^I enter details on the contact page without entering Dealership$/) do
    #This is a step for creation with entering all the fields without entering one of the required fields
    PageController.contact_page.enter_details(not_required)
end

And(/^I hit the send button/) do
    #Step to submit the contact details
    PageController.contact_page.hit_send
end

Then(/^I should receive a confirmation message$/) do
    sleep 2
    #Verify that we get the confirmation message as a part of the verification step
    unless PageController.contact_page.verify_success_message
        fail("Did not receive the success message")
    end
end

Then(/^I should get an error message$/) do
    sleep 2
    #Verify that we get an error message as a part of the verification step
    unless PageController.contact_page.verify_error_message
        fail("Did not receive an error message")
    end
end

