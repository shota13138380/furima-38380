class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :token

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :postcode, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city,          presence: true
  validates :block,         presence: true
  validates :phone_number,  presence: true, numericality: { only_integer: true }, length: { in: 10..11 }
  validates :token, presence: true

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Destination.create(purchase_id: purchase.id, postcode: postcode, prefecture_id: prefecture_id, city: city, block: block,
                       building: building, phone_number: phone_number)
  end
end
