class Contact < ApplicationMailer

	default :from => 'contact@devpointlabs.com'
  # you can also default subject, body, etc.
	include SendGrid

	# plain text email
	def send_contact_info
		mail :to => "tiffanyforsyth1@gmail.com",
				 :subject => "Test plain text email subject",
				 :body => 'This is the plain text email body.'
	end

	# HTML email
	def send_contact_info_html
	mail :to => "tiffanyforsyth1@gmail.com",
			 :subject => "Test HTML email subject"
	end

	# HTML email with args
	def email_with_args(to_email, from_email, subject)
	  mail :to => to_email,
			   :from => from_email,
				 :subject => subject
	end

	# gives you instance variables you can use in your views
	def email_with_args_and_instance_vars(first_name, last_name)
		@first_name = first_name,
		@last_name = last_name,
		mail :to => "tiffanyforsyth1@gmail.com",
			 	 :subject => "test HTML email subject"
	end

end

# in logic put: Contact.send_contact_info_html.deliver
# Contact.email_with_args_and_instance_vars('Jake, 'Sorce').deliver


