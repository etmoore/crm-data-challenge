require 'pp'
require_relative 'data/crm'

## Challenge #2 - all employments

# Write some code that will return an array of all the employments,
# including the person name, company name, person id, company id
# and title.

# [
#   {
#     :company_id => 4,
#     :company_name => "Nicolas and Sons",
#     :person_id => 20,
#     :person_first_name => "Savannah",
#     :person_last_name => "Clementina",
#     :title => "Chief Communications Consultant"
#   },
#   {
#     :company_id => 6,
#     :company_name => "Mueller LLC",
#     :person_id => 20,
#     :person_first_name => "Elyse",
#     :person_last_name => "Jensen",
#     :title => "Human Directives Engineer"
#   },
# ]

result = []
CRM[:people].each do |person|
  person[:employments].each do |employment|
    entry = {}
    entry[:company_id] = employment[:company_id]
    company = CRM[:companies].find {|company| company[:id] == employment[:company_id]}
    entry[:company_name] = company[:name]
    entry[:person_id] = person[:id]
    entry[:person_first_name] = person[:first_name]
    entry[:person_last_name] = person[:last_name]
    entry[:title] = employment[:title]
    result << entry
  end
end
pp result
