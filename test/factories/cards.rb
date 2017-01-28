FactoryGirl.define do
  factory :card do
    title "MyString"
    current_phase_id nil
    due_date "2017-01-28 19:59:52"
    duration 1.5
    started_at "2017-01-28 19:59:52"
    finished_at "2017-01-28 19:59:52"
    expiration_time "2017-01-28 19:59:52"
    index 1
    token "MyString"
    expired false
    late false
    draft false
    done false
    can_show_pipe false
    previous_phase_id nil
    next_phase_id nil
  end
end
