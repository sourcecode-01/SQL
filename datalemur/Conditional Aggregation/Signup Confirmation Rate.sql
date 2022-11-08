select ROUND(count(email_id)*1.0/(select count(email_id) from texts),2) 
as confirmation_rate from texts where signup_action = 'Confirmed'
