FactoryBot.define do
  factory :order_address do
    item_id { 1 }
    user_id { 2 }
    post_code { '440-8975' }
    prefecture_id { 3 }
    city { '横浜市緑区' }
    address1 { '青山2-8-6' }
    number { '09044569865' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
