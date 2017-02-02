FactoryGirl.define do
  factory :card do
    title 'My card'
    association :current_phase_id, factory: :phase
    due_date '2017-01-28 19:59:52'
    duration 1.5
    started_at '2017-01-28 19:59:52'
    finished_at '2017-01-28 19:59:52'
    expiration_time '2017-01-28 19:59:52'
    index 1
    token 'ed1dfd38a90c5acd33358bc54a712f34d9388980'
    expired false
    late false
    draft false
    done false
    can_show_pipe false
  end
end
