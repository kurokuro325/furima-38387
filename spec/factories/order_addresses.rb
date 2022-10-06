FactoryBot.define do
  factory :order_address do
    post_code { '440-8975' }
    prefecture_id { 3 }
    city { '横浜市緑区' }
    address1 { '青山2-8-6' }
    address2 { '東ビル202' }
    number { '09044569865' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
