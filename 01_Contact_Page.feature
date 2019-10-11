@ContactPage
Feature: DealerScience Contact Page Test

#This is the test to verify that we land on the correct page
@NavigateToContactPage
Scenario: Verify Navigate to The Contact Page
    Given that I navigate to the Contact Page URL 
    Then I have successfully navigated to the Contact Page

#This is the test to verify that we can enter details on the contact page
@VerifyEnterContactPageDetails
Scenario: Verify entering details on the contact page
    Given that I navigate to the Contact Page URL 
    And I enter details on the contact page 
    And I hit the send button
    Then I should receive a confirmation message

#This is test to verify that we cannot submit the contact details without any one required fields
@VerifyCannotSendWithoutRequiredFields    
Scenario: Verify that you cannot send the contact inquiry with leaving a required fields empty
    Given that I navigate to the Contact Page URL
    And I enter details on the contact page without entering Dealership
    And I hit the send button
    Then I should get an error message