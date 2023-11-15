class Post < ApplicationRecord
  validates :title, :start_at, :end_at, presence: { message: "は必須項目です" }
  validates :title, length: { maximum: 20, message: "は20文字以内で入力してください" }
  validates :memo, length: { maximum: 500, message: "は500文字以内で入力してください" }
  validate :end_at_after_start_at

  private

  def end_at_after_start_at
    return if start_at.blank? || end_at.blank?

    errors.add(:end_at, "は開始日より後の日付にしてください") if end_at < start_at
  end
end
