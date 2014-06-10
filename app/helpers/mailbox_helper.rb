module MailboxHelper


	def show_messages(user)

		user.mailbox.inbox.each do |message_attribute|
			message_attributes = { name: message_attribute.originator.name, body: message_attribute.original_message.body  }
		end

	end


	def message_count(user)
		if has_message?(user)
			#user_mailbox_count = (user.mailbox.inbox.first.receipts_for user).count
			user_mailbox_count = user.mailbox.inbox.all.count
			user_mailbox_count
		else
	   		"None"
		end
	end



	def has_message?(user)
		!user.mailbox.inbox.first.nil?
	end

end
