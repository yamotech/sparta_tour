class Participant < ActiveRecord::Base
  belongs_to :course
  validates :name, presence: true
  validate :upper_limit?

  private


  def upper_limit?
    # 懸賞た相性のコースを取得する
    course = Course.find(course_id)

    # 現在のParticipantsを調べる
    participants_count = course.participants.count

    # 現在の参加者数とコースの上限を比較する
    if participants_count >= course.upper_limit
      # 上限に達していればエラーログを出して保存させない
      errors.add(:base, "上限に達しました")
    end
  end

end
