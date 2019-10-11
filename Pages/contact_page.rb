class ContactPage
    attr_accessor :name
    attr_accessor :email
    attr_accessor :phone
    attr_accessor :dealership
    attr_accessor :message
    
    def initialize
        @name = "QA Candidate"
        @email = "qacandidate@dealerscience.com"
        @phone = "617-555-5555"
        @dealership = "QA Dealership"
        @message = "This is just a QA Test, you can ignore this"
    end

    def go_here
        #Navigate to the contact page URL
        $browser.navigate_to "https://www.dealerscience.com/site/contact/"
        #Providing a sleep time for the page to load
        sleep 1
    end

    def verify_header_present
        sleep 1
        #Check that you land on the correct Page
        $browser.url.include? "contact"
        $browser.h1(text: "Contact").exists?
    end

    def enter_details(field_necessary)
       #This method has a case statement to check submitting contact with not required fields as well
       #Enter the name
       $browser.input(name: "Name").send_keys @name 

       #Enter the email
       $browser.input(name: "Email").send_keys @email

       #Enter the Phone
       $browser.input(name: "Telephone").send_keys @phone

       #Enter the Dealership 
       #I will be checking here to see if we skip entering this and submit the contact, we get an error message
       case field_necessary
        when "required"
            $browser.input(name: "Dealership").send_keys @dealership
        when "not required"    
            $browser.input(name: "Dealership").send_keys " "
       end

       #Enter the message
       $browser.textarea(name: "Message").send_keys @message
    end   

    def hit_send
        sleep 1
        #Hit the send button to submit the contact details
        $browser.input(type: "submit").click!
    end

    def verify_success_message
        sleep 1
        #Verify that the success message appeared on hitting the submit button
        $browser.div(text: "Your message was sent successfully. Thanks.").exists?
    end

    def verify_error_message
        sleep 1
        #Verify that we get an error message on the missed out field as well
        $browser.p(text: /Dealership/).span(text: "Please fill in the required field.").exists?
        #Verify that an error message appeared on hitting the submit button
        $browser.div(text: "Validation errors occurred. Please confirm the fields and submit it again.").exists?
    end
end