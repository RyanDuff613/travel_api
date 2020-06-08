FactoryBot.define do 
  factory(:review) do
    user_name {'guy'}
    rating {5}
    country {'spain'}
    city {'madrid'}
    content {'stuff stuff stuff'}
  end
end