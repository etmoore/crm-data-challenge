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

def employments_with(person, company_id)
  person[:employments].select do |employment|
    employment[:company_id] == company_id
  end
end

def employees_of(company_id)
  CRM[:people].flat_map do |person|
    employments_with(person, company_id).map do |employment|
      {
        id: person[:id],
        first_name: person[:first_name],
        last_name: person[:last_name],
        title: employment[:title],
      }
    end
  end
end

result = CRM[:companies].map do |company|
  {
    name: company[:name],
    employees: employees_of(company[:id])
  }
end
pp result
