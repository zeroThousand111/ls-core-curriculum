# database hash

mailing_campaign_leads = [
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]

# LEGACY CODE

pp mailing_campaign_leads # original hash

# counter = 0

# loop do
#   break if counter == mailing_campaign_leads.size # loop the whole mailing_campaign_leads array
#   full_name = mailing_campaign_leads[counter][:name] # each :name on each loop
#   names = full_name.split # an array of first name and surname

#   names_counter = 0
#   loop do
#     break if names_counter == names.size # loop through both names i.e. first name and surname
#     name = names[names_counter] # each name in turn from the names array
#     names[names_counter] = name.capitalize # reassignment of name in names array to capitalised version

#     names_counter += 1
#   end

#   capitalized_full_name = names.join(' ') # creates a string from names array
#   mailing_campaign_leads[counter][:name] = capitalized_full_name # reassignment of each :name value to capitalised value i.e. first letter capital, rest lower case

#   counter += 1
# end

# # does this reassignment work?
# # p mailing_campaign_leads # yes.  

# usable_leads = []
# counter = 0

# loop do
#   break if counter == mailing_campaign_leads.size # loop the whole mailing_campaign_leads array
#   last_login = mailing_campaign_leads[counter][:days_since_login]
#   subscribed_to_list = mailing_campaign_leads[counter][:mailing_list]

#   if last_login < 60 && subscribed_to_list
#     usable_leads << mailing_campaign_leads[counter]
#   end

#   counter += 1
# end

# pp mailing_campaign_leads

# p usable_leads

# [{:name=>"Jane Williams", :email=>"jane_w95@my_mail.com", :days_since_login=>16, :mailing_list=>true}, {:name=>"Ash Patel", :email=>"ash_patel@my_mail.com", :days_since_login=>22, :mailing_list=>true}]
# i.e. Jane and Ash, not Emma or Mike

# the original hash IS mutated.  
# usable_leads is a new hash

# OPTION 1

mailing_campaign_leads.map do |lead|
  lead[:name].capitalize!
end

mailing_campaign_leads.select! do |lead|
  lead[:days_since_login] < 60 && lead[:mailing_list]
end

# NO!  Only the first name of :name is capitalised.

# OPTION 2

# mailing_campaign_leads.each do |lead|
#   names = lead[:name].split
#   names.map! { |name| name.capitalize }
#   lead[:name] = names.join(' ')
# end

# usable_leads = mailing_campaign_leads.keep_if do |lead|
#   lead[:days_since_login] <= 60 && lead[:mailing_list]
# end

# This appears to work correctly (selects Ash and Jane, not Emma and Mike) but uses the logic of <= 60 not < 60, so not quite the same but more importantly it MUTATES the hash using Hash#keep_if


# OPTION 3

# mailing_campaign_leads.each do |lead|
#   names = lead[:name].split # an array of both names
#   lead[:name] = names.map { |name| name.capitalize }.join(' ') # reassignment of name to capitalised
# end

# usable_leads = mailing_campaign_leads.reject do |lead|
#   last_login = lead[:days_since_login]
#   subscribed_to_list = lead[:mailing_list]
#   last_login > 59 && !subscribed_to_list
# end

# name reassignment looks plausible.  Selection doesn't work - all four names selected because line 96 evaluates to false for every name.  Should be OR not AND logic.

# OPTION 4

# mailing_campaign_leads.each do |lead|
#   names = lead[:name].split
#   names.map! { |name| name.capitalize }
#   lead[:name] = names.join(' ')
# end

# usable_leads = mailing_campaign_leads.select do |lead|
#   lead[:days_since_login] < 60 && lead[:mailing_list]
# end

# name change seems OK, but it mutates the hash, unlike the legacy code.  selection works OK

pp mailing_campaign_leads
# pp usable_leads