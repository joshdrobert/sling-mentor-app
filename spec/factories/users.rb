FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    phone_number { Faker::PhoneNumber.phone_number }
    role { %w[student mentor].sample }
    isAdmin { false }

    trait :admin do
      isAdmin { true }
    end

    trait :student_role do
      role { 'student' }

      after(:create) do |user|
        create(:student, user: user)
      end
    end

    trait :mentor_role do
      role { 'mentor' }

      after(:create) do |user|
        create(:mentor, user: user)
      end
    end
  end

  factory :student do
    user
    major { Faker::Educator.subject }
    classification { Student.classifications.keys.sample } # This will use :freshman, :sophomore, etc.
    specialty { association :specialty }
  end

  factory :mentor do
    user
    profession { Faker::Job.title }
    specialty { association :specialty }
    mentor_type { association :mentor_type }
  end

  factory :specialty do
    name { Faker::Job.field }
    short_name { name.parameterize }
  end

  factory :mentor_type do
    name { Faker::Company.industry }
    short_name { name.parameterize }
  end

  factory :question do
    user
    question { Faker::Lorem.question }
    description { Faker::Lorem.paragraph }
  end

  factory :comment do
    user
    question
    content { Faker::Lorem.paragraph }
  end

  factory :student_en_me_mentor do
    student
    mentor
  end
end
