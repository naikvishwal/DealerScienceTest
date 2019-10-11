module PageController
    
    def self.contact_page
        if @contact_page == nil
          @contact_page = ContactPage.new
        end
        @contact_page
      end
end