require 'pp'
require_relative 'data/crm'

## Challenge #1 - employees of companies
# Write some code that will return an array of companies,
# and the people who work for them.  For example:

# [
#   {
#     name: "Nicolas and Sons",
#     employees: [
#       {
#         :id => 20,
#         :first_name => "Savannah",
#         :last_name => "Clementina",
#         :title => "Chief Communications Consultant"
#       },
#       {
#         :id => 46,
#         :first_name => "Elyse",
#         :last_name => "Jensen",
#         :title => "Human Directives Engineer"
#       },
#     ]
#   }
# ]

result = []
CRM[:companies].each do |company|
  c_entry = {}
  c_entry[:name] = company[:name]
  c_entry[:employees] = []
  CRM[:people].each do |person|
    person[:employments].each do |employment|
      if employment[:company_id] == company[:id]
        p_entry = {}
        p_entry[:id] = person[:id]
        p_entry[:first_name] = person[:first_name]
        p_entry[:last_name] = person[:last_name]
        p_entry[:title] = employment[:title]
        c_entry[:employees] << p_entry
      end
    end
  end
  result << c_entry
end
pp result
